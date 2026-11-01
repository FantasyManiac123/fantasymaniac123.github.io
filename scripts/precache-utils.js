const crypto = require("crypto");
const fs = require("fs");
const path = require("path");

const CORE_ASSETS = [
    "./",
    "./index.html",
    "./game.html",
    "./style.css",
    "./app.js",
    "./game.js",
    "./pwa.js",
    "./manifest.webmanifest",
    "./vendor/ink.js",
    "./icons/icon-192.png",
    "./icons/icon-512.png",
    "./icons/icon-maskable-192.png",
    "./icons/icon-maskable-512.png",
    "./icons/apple-touch-icon.png"
];

function isSafeBookId(value) {
    return typeof value === "string" && /^[a-zA-Z0-9_-]+$/.test(value);
}

function listFiles(directory, projectRoot) {
    return fs.readdirSync(directory, { withFileTypes: true }).flatMap(entry => {
        const filePath = path.join(directory, entry.name);
        if (entry.isDirectory()) return listFiles(filePath, projectRoot);
        if (!entry.isFile() || /\.(ink|txt)$/i.test(entry.name)) return [];

        const assetPath = `./${path.relative(projectRoot, filePath).split(path.sep).join("/")}`;
        // Ilustrácie a textúry sa načítajú až pri otvorení danej knihy/scény.
        // Inak by prvá PWA inštalácia sťahovala desiatky megabajtov navyše.
        if (assetPath.includes("/images/")) return [];
        return [assetPath];
    });
}

function getPrecacheAssets(projectRoot) {
    const libraryPath = path.join(projectRoot, "books", "library.json");
    const library = JSON.parse(fs.readFileSync(libraryPath, "utf8").replace(/^\uFEFF/, ""));
    if (!Array.isArray(library)) throw new Error("books/library.json musí byť pole.");

    const bookAssets = library.flatMap(entry => {
        if (!isSafeBookId(entry?.id)) throw new Error("Knižnica obsahuje neplatné ID knihy.");
        return listFiles(path.join(projectRoot, "books", entry.id), projectRoot);
    });

    return [...new Set([...CORE_ASSETS, "./books/library.json", ...bookAssets])].sort();
}

function getPrecacheInfo(projectRoot, assetPaths = null) {
    const workerPath = path.join(projectRoot, "service-worker.js");
    const workerSource = fs.readFileSync(workerPath, "utf8");
    const precacheMatch = workerSource.match(/const PRECACHE = \[([\s\S]*?)\];/);

    if (!precacheMatch) {
        throw new Error("V service-worker.js sa nenašiel zoznam PRECACHE.");
    }

    const listedAssetPaths = [...precacheMatch[1].matchAll(/"(\.\/[^"\n]+)"/g)]
        .map(match => match[1])
        .filter(assetPath => assetPath !== "./");

    const assets = assetPaths || listedAssetPaths;

    if (assets.length === 0) {
        throw new Error("PRECACHE neobsahuje žiadne lokálne súbory.");
    }

    const hash = crypto.createHash("sha256");

    for (const assetPath of [...assets].filter(assetPath => assetPath !== "./").sort()) {
        const filePath = path.resolve(projectRoot, assetPath.slice(2));
        const relativePath = path.relative(projectRoot, filePath);

        if (relativePath.startsWith("..") || path.isAbsolute(relativePath) || !fs.statSync(filePath).isFile()) {
            throw new Error(`Neplatný alebo chýbajúci PRECACHE súbor: ${assetPath}`);
        }

        hash.update(assetPath);
        hash.update("\0");
        hash.update(fs.readFileSync(filePath));
        hash.update("\0");
    }

    return {
        workerPath,
        workerSource,
        cacheName: `open-gamebook-reader-${hash.digest("hex").slice(0, 16)}`
    };
}

module.exports = { getPrecacheAssets, getPrecacheInfo };
