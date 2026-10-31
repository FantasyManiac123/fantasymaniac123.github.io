<<<<<<< HEAD
const CACHE_NAME = "open-gamebook-reader-255c3ba93b878fbf";
=======
const CACHE_NAME = "open-gamebook-reader-a2e378a6c9016fc6";
>>>>>>> f20273d (Initial commit)

const PRECACHE = [
    "./",
    "./app.js",
    "./books/library.json",
    "./books/ortheon/book.json",
    "./books/ortheon/cover.webp",
<<<<<<< HEAD
=======
    "./books/ortheon/images/pattern-dark.svg",
    "./books/ortheon/images/pattern-light.svg",
>>>>>>> f20273d (Initial commit)
    "./books/ortheon/images/zaciatok.webp",
    "./books/ortheon/story.json",
    "./books/ortheon/theme.json",
    "./books/vaelgard/book.json",
    "./books/vaelgard/chapters/chapter-01.json",
    "./books/vaelgard/chapters/chapter-02.json",
    "./books/vaelgard/chapters/chapter-03.json",
    "./books/vaelgard/chapters/chapter-04.json",
    "./books/vaelgard/chapters/chapter-05.json",
    "./books/vaelgard/chapters/chapter-06.json",
    "./books/vaelgard/chapters/chapter-07.json",
    "./books/vaelgard/chapters/chapter-08.json",
    "./books/vaelgard/chapters/chapter-09.json",
    "./books/vaelgard/chapters/chapter-10.json",
    "./books/vaelgard/cover.webp",
<<<<<<< HEAD
    "./books/vaelgard/images/observatorium.webp",
=======
    "./books/vaelgard/images/chapter-01.png",
    "./books/vaelgard/images/chapter-02.png",
    "./books/vaelgard/images/chapter-03.png",
    "./books/vaelgard/images/chapter-04.png",
    "./books/vaelgard/images/chapter-05.png",
    "./books/vaelgard/images/chapter-06.png",
    "./books/vaelgard/images/chapter-07.png",
    "./books/vaelgard/images/chapter-08.png",
    "./books/vaelgard/images/chapter-09.png",
    "./books/vaelgard/images/chapter-10.png",
    "./books/vaelgard/images/dragon-scales.png",
    "./books/vaelgard/images/exec-6f387a87-1b88-4a89-9cfb-c834e0e9290f.png",
    "./books/vaelgard/images/exec-ccb928c3-0b49-489a-96e9-40a2af8260ac.png",
    "./books/vaelgard/images/observatorium.webp",
    "./books/vaelgard/images/pattern-dark.svg",
    "./books/vaelgard/images/pattern-light.svg",
>>>>>>> f20273d (Initial commit)
    "./books/vaelgard/images/vzlet.webp",
    "./books/vaelgard/images/zaciatok.webp",
    "./books/vaelgard/theme.json",
    "./game.html",
    "./game.js",
    "./icons/apple-touch-icon.png",
    "./icons/icon-192.png",
    "./icons/icon-512.png",
    "./icons/icon-maskable-192.png",
    "./icons/icon-maskable-512.png",
    "./index.html",
    "./manifest.webmanifest",
    "./pwa.js",
    "./style.css",
    "./vendor/ink.js"
];

self.addEventListener("install", event => {
    event.waitUntil(
        caches.open(CACHE_NAME).then(cache => cache.addAll(PRECACHE))
    );
    self.skipWaiting();
});

self.addEventListener("activate", event => {
    event.waitUntil(
        caches.keys().then(keys => Promise.all(
            keys
                .filter(key => key.startsWith("open-gamebook-reader-") && key !== CACHE_NAME)
                .map(key => caches.delete(key))
        ))
    );
    self.clients.claim();
});

self.addEventListener("fetch", event => {
    const request = event.request;
    if (request.method !== "GET") return;

    const url = new URL(request.url);
    if (url.origin !== self.location.origin) return;

    // Network-first keeps development and book updates fresh; cache is the offline fallback.
    event.respondWith(
        fetch(request)
            .then(response => {
                if (response && response.ok) {
                    const copy = response.clone();
                    caches.open(CACHE_NAME).then(cache => cache.put(request, copy));
                }
                return response;
            })
            .catch(async () => {
                const cached = await caches.match(request);
                if (cached) return cached;

                if (request.mode === "navigate") {
                    return caches.match("./index.html");
                }

                return new Response("Offline", {
                    status: 503,
                    statusText: "Offline",
                    headers: { "Content-Type": "text/plain; charset=UTF-8" }
                });
            })
    );
});
