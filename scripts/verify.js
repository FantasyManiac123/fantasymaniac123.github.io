#!/usr/bin/env node

const fs = require("fs");
const path = require("path");
const inkjs = require("inkjs");
const { getPrecacheAssets, getPrecacheInfo } = require("./precache-utils");

const projectRoot = path.resolve(__dirname, "..");
let checks = 0;

function fail(message) {
    throw new Error(message);
}

function readText(relativePath) {
    const filePath = path.resolve(projectRoot, relativePath);
    const safeRelativePath = path.relative(projectRoot, filePath);

    if (safeRelativePath.startsWith("..") || path.isAbsolute(safeRelativePath)) {
        fail(`Neplatná cesta: ${relativePath}`);
    }

    return fs.readFileSync(filePath, "utf8");
}

function readJson(relativePath) {
    try {
        const value = JSON.parse(readText(relativePath).replace(/^\uFEFF/, ""));
        checks += 1;
        return value;
    } catch (error) {
        fail(`Neplatný JSON súbor ${relativePath}: ${error.message}`);
    }
}

function isSafeRelativePath(value) {
    return typeof value === "string"
        && /^[a-zA-Z0-9_./-]+$/.test(value)
        && !value.includes("..")
        && !value.startsWith("/");
}

<<<<<<< HEAD
=======
function isValidVariableName(value) {
    return typeof value === "string" && /^[a-zA-Z_][a-zA-Z0-9_]*$/.test(value);
}

function verifyHud(bookPath, book, globalVariables) {
    if (book.hud === undefined) return;
    if (!book.hud || typeof book.hud !== "object" || Array.isArray(book.hud)) {
        fail(`${bookPath} má neplatnú konfiguráciu hud.`);
    }

    const attributes = book.hud.attributes === undefined ? [] : book.hud.attributes;
    if (!Array.isArray(attributes)) fail(`${bookPath} má neplatné atribúty hud.`);

    const usedVariables = [];
    for (const attribute of attributes) {
        if (!attribute || !isValidVariableName(attribute.variable) || typeof attribute.label !== "string" || !attribute.label.trim()) {
            fail(`${bookPath} má neplatný atribút hud.`);
        }
        if (attribute.emptyValue !== undefined && typeof attribute.emptyValue !== "string") {
            fail(`${bookPath} má neplatnú prázdnu hodnotu atribútu hud.`);
        }
        if (attribute.icon !== undefined && (typeof attribute.icon !== "string" || !attribute.icon.trim() || attribute.icon.trim().length > 12)) {
            fail(`${bookPath} má neplatnú ikonu atribútu hud.`);
        }
        if (attribute.wide !== undefined && typeof attribute.wide !== "boolean") {
            fail(`${bookPath} má neplatné rozloženie atribútu hud.`);
        }
        if (attribute.identity !== undefined && typeof attribute.identity !== "boolean") {
            fail(`${bookPath} má neplatnú skupinu atribútu hud.`);
        }
        usedVariables.push(attribute.variable);
    }

    const inventory = book.hud.inventory;
    if (inventory !== undefined) {
        if (!inventory || typeof inventory !== "object" || Array.isArray(inventory)) {
            fail(`${bookPath} má neplatný inventár hud.`);
        }
        if (inventory.label !== undefined && (typeof inventory.label !== "string" || !inventory.label.trim())) {
            fail(`${bookPath} má neplatný názov inventára hud.`);
        }
        if (inventory.emptyLabel !== undefined && (typeof inventory.emptyLabel !== "string" || !inventory.emptyLabel.trim())) {
            fail(`${bookPath} má neplatný text prázdneho inventára hud.`);
        }
        if (inventory.variable !== undefined) {
            if (!isValidVariableName(inventory.variable)) fail(`${bookPath} má neplatnú premennú inventára hud.`);
            usedVariables.push(inventory.variable);
        }

        const items = inventory.items === undefined ? [] : inventory.items;
        if (!Array.isArray(items)) fail(`${bookPath} má neplatné položky inventára hud.`);
        for (const item of items) {
            if (!item || !isValidVariableName(item.variable) || typeof item.label !== "string" || !item.label.trim()) {
                fail(`${bookPath} má neplatnú položku inventára hud.`);
            }
            usedVariables.push(item.variable);
        }

        if (inventory.variable === undefined && items.length === 0) {
            fail(`${bookPath} má inventár hud bez premennej alebo položiek.`);
        }
    }

    if (attributes.length === 0 && inventory === undefined) fail(`${bookPath} má prázdnu konfiguráciu hud.`);

    if (Array.isArray(book.chapters) && book.chapters.length > 0) {
        for (const name of usedVariables) {
            if (!globalVariables.includes(name)) {
                fail(`${bookPath} používa v hud premennú ${name}, ktorá nie je v globalVariables.`);
            }
        }
    }

    checks += 1;
}

function verifyTheme(bookPath, bookId, book) {
    if (book.theme === undefined) return;
    if (typeof book.theme !== "string" || !/^[a-zA-Z0-9_.-]+$/.test(book.theme)) {
        fail(`${bookPath} má neplatný názov témy.`);
    }

    const themePath = `books/${bookId}/${book.theme}`;
    const theme = readJson(themePath);
    const background = theme.background;
    if (background === undefined) return;
    if (!background || typeof background !== "object" || Array.isArray(background)) {
        fail(`${themePath} má neplatnú konfiguráciu pozadia.`);
    }

    for (const key of ["patternImage", "darkPatternImage"]) {
        const filename = background[key];
        if (filename === undefined) continue;
        if (!isSafeRelativePath(filename)) {
            fail(`${themePath} má neplatný obrázok pozadia ${key}.`);
        }

        const imagePath = path.join(projectRoot, "books", bookId, "images", filename);
        const relativeImagePath = path.relative(path.join(projectRoot, "books", bookId, "images"), imagePath);
        if (relativeImagePath.startsWith("..") || path.isAbsolute(relativeImagePath) || !fs.existsSync(imagePath)) {
            fail(`${themePath} odkazuje na chýbajúci obrázok pozadia: ${filename}.`);
        }
        checks += 1;
    }
}

>>>>>>> f20273d (Initial commit)
function continueUntilChoiceOrEnd(story, relativePath) {
    let linesRead = 0;
    while (story.canContinue) {
        story.Continue();
        linesRead += 1;
        if (linesRead > 100000) fail(`Ink príbeh ${relativePath} má nekonečné pokračovanie.`);
    }
}

function verifyInkStory(relativePath, globalVariables = []) {
    const storyData = readJson(relativePath);
    let story;

    try {
        story = new inkjs.Story(storyData);
    } catch (error) {
        fail(`Ink príbeh ${relativePath} sa nedá načítať: ${error.message}`);
    }

    continueUntilChoiceOrEnd(story, relativePath);

    for (const name of globalVariables) {
        if (story.variablesState[name] === undefined) {
            fail(`Ink príbeh ${relativePath} nemá globálnu premennú ${name}.`);
        }
    }

    // Overíme každý prvý krok z úvodnej voľby. Úplné prehľadanie stavového
    // stromu by pri gamebookoch s množstvom premenných bolo exponenciálne.
    const initialState = story.state.ToJson();
    for (const choice of story.currentChoices) {
        const branch = new inkjs.Story(storyData);
        branch.state.LoadJson(initialState);
        branch.ChooseChoiceIndex(choice.index);
        continueUntilChoiceOrEnd(branch, relativePath);
    }

    checks += 1;
}

function verifyBooks() {
    const library = readJson("books/library.json");
    if (!Array.isArray(library) || library.length === 0) fail("Knižnica neobsahuje žiadne knihy.");

    for (const entry of library) {
        if (!entry?.id || !/^[a-zA-Z0-9_-]+$/.test(entry.id)) fail("Knižnica obsahuje neplatné ID knihy.");

        const bookPath = `books/${entry.id}/book.json`;
        const book = readJson(bookPath);

        if (book.id !== entry.id) fail(`${bookPath} má ID odlišné od knižnice.`);
        if (typeof book.version !== "string" || book.version.length === 0) fail(`${bookPath} nemá verziu pre kompatibilitu saveov.`);

        const globalVariables = Array.isArray(book.globalVariables) ? book.globalVariables : [];
<<<<<<< HEAD
        if (!globalVariables.every(name => typeof name === "string" && /^[a-zA-Z_][a-zA-Z0-9_]*$/.test(name))) {
            fail(`${bookPath} obsahuje neplatnú globálnu premennú.`);
        }
=======
        if (!globalVariables.every(isValidVariableName)) {
            fail(`${bookPath} obsahuje neplatnú globálnu premennú.`);
        }
        verifyHud(bookPath, book, globalVariables);
        verifyTheme(bookPath, entry.id, book);
>>>>>>> f20273d (Initial commit)

        const illustrations = Array.isArray(book.illustrations) ? book.illustrations : [];
        for (const illustration of illustrations) {
            const imageName = typeof illustration === "string" ? illustration : illustration?.file;
            const knotName = typeof illustration === "string" ? illustration : illustration?.knot;
            const chapterId = typeof illustration === "object" ? illustration?.chapter : null;
<<<<<<< HEAD
            if (!/^[a-zA-Z0-9_-]+$/.test(imageName) || !/^[a-zA-Z0-9_-]+$/.test(knotName)
                || (chapterId !== null && !/^[a-zA-Z0-9_-]+$/.test(chapterId))) {
                fail(`${bookPath} obsahuje neplatný názov ilustrácie.`);
            }
            const imagePath = `books/${entry.id}/images/${imageName}.webp`;
=======
            if (!/^[a-zA-Z0-9_-]+(?:\.(?:webp|png|jpe?g))?$/.test(imageName) || !/^[a-zA-Z0-9_-]+$/.test(knotName)
                || (chapterId !== null && !/^[a-zA-Z0-9_-]+$/.test(chapterId))) {
                fail(`${bookPath} obsahuje neplatný názov ilustrácie.`);
            }
            const imageFilename = /\.(?:webp|png|jpe?g)$/i.test(imageName) ? imageName : `${imageName}.webp`;
            const imagePath = `books/${entry.id}/images/${imageFilename}`;
>>>>>>> f20273d (Initial commit)
            if (!fs.existsSync(path.join(projectRoot, imagePath))) fail(`${bookPath} odkazuje na chýbajúcu ilustráciu ${imagePath}.`);
            checks += 1;
        }

        if (Array.isArray(book.chapters) && book.chapters.length > 0) {
            for (const chapter of book.chapters) {
                if (!isSafeRelativePath(chapter?.story)) fail(`${bookPath} obsahuje neplatnú cestu kapitoly.`);
                verifyInkStory(`books/${entry.id}/${chapter.story}`, globalVariables);
            }
        } else {
            const storyPath = book.story || "story.json";
            if (!isSafeRelativePath(storyPath)) fail(`${bookPath} obsahuje neplatnú cestu príbehu.`);
            verifyInkStory(`books/${entry.id}/${storyPath}`, globalVariables);
        }
    }
}

function verifyPrecache() {
    const worker = readText("service-worker.js");
    const cacheName = worker.match(/const CACHE_NAME = "(open-gamebook-reader-[^"]+)";/)?.[1];
    const precacheBlock = worker.match(/const PRECACHE = \[([\s\S]*?)\];/)?.[1];

    if (!cacheName) fail("service-worker.js nemá platný CACHE_NAME.");
    if (!precacheBlock) fail("service-worker.js nemá zoznam PRECACHE.");

    const expectedCacheName = getPrecacheInfo(projectRoot).cacheName;
    if (cacheName !== expectedCacheName) {
        fail(`CACHE_NAME je neaktuálny. Očakáva sa ${expectedCacheName}; spusti npm run update:precache.`);
    }
    checks += 1;

    const assetPaths = [...precacheBlock.matchAll(/"(\.\/[^"\n]+)"/g)].map(match => match[1]);
    if (assetPaths.length === 0) fail("PRECACHE je prázdny.");

    const expectedAssets = getPrecacheAssets(projectRoot).filter(assetPath => assetPath !== "./");
    if (JSON.stringify([...assetPaths].sort()) !== JSON.stringify(expectedAssets)) {
        fail("PRECACHE nezodpovedá aktuálnym zdrojom. Spusti npm run update:precache.");
    }

    for (const assetPath of assetPaths) {
        const filePath = path.resolve(projectRoot, assetPath.slice(2));
        const safeRelativePath = path.relative(projectRoot, filePath);
        if (safeRelativePath.startsWith("..") || path.isAbsolute(safeRelativePath) || !fs.existsSync(filePath)) {
            fail(`PRECACHE odkazuje na chýbajúci súbor: ${assetPath}`);
        }
        checks += 1;
    }

    const gamePage = readText("game.html");
    if (!gamePage.includes('src="./vendor/ink.js"')) fail("game.html nepoužíva lokálny Ink runtime.");
    if (!assetPaths.includes("./vendor/ink.js")) fail("Lokálny Ink runtime nie je v PRECACHE.");
    checks += 1;
}

verifyBooks();
verifyPrecache();
console.log(`Overenie prešlo: ${checks} kontrol.`);
