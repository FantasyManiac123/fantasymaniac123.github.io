const CACHE_NAME = "open-gamebook-reader-26955fe0472a4bc0";

const PRECACHE = [
    "./",
    "./app.js",
    "./books/library.json",
    "./books/ortheon/book.json",
    "./books/ortheon/cover.webp",
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

    const isImage = request.destination === "image"
        || /\.(?:avif|gif|jpe?g|png|svg|webp)$/i.test(url.pathname);

    // Ilustrácie netvoria súčasť úvodného precache. Po prvom zobrazení ich
    // však používame priamo z cache, aby sa pri ďalšom čítaní nezdržovali sieťou.
    if (isImage) {
        event.respondWith(
            caches.match(request).then(cached => {
                if (cached) return cached;
                return fetch(request).then(response => {
                    if (response && response.ok) {
                        caches.open(CACHE_NAME).then(cache => cache.put(request, response.clone()));
                    }
                    return response;
                });
            })
        );
        return;
    }

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
