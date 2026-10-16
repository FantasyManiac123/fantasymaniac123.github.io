#!/usr/bin/env node

const fs = require("fs");
const path = require("path");
const { getPrecacheAssets, getPrecacheInfo } = require("./precache-utils");

const projectRoot = path.resolve(__dirname, "..");
const workerPath = path.join(projectRoot, "service-worker.js");
const workerSource = fs.readFileSync(workerPath, "utf8");
const cacheNamePattern = /const CACHE_NAME = "open-gamebook-reader-[^"]+";/;
const precachePattern = /const PRECACHE = \[[\s\S]*?\];/;

if (!cacheNamePattern.test(workerSource) || !precachePattern.test(workerSource)) {
    throw new Error("V service-worker.js sa nenašiel platný CACHE_NAME.");
}

const assets = getPrecacheAssets(projectRoot);
const precacheSource = `const PRECACHE = [\n${assets.map(asset => `    "${asset}"`).join(",\n")}\n];`;
const workerWithAssets = workerSource.replace(precachePattern, precacheSource);
const { cacheName } = getPrecacheInfo(projectRoot, assets);
const updatedWorker = workerWithAssets.replace(
    cacheNamePattern,
    `const CACHE_NAME = "${cacheName}";`
);

if (updatedWorker !== workerSource) {
    fs.writeFileSync(workerPath, updatedWorker);
}

console.log(`PRECACHE verzia: ${cacheName}`);
