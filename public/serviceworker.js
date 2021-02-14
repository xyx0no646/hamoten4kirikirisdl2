CACHE_VERSION = "0.01";
FORCE_CACHE_URLS = `
./index.html
./krkrsdl2.js
./krkrsdl2.wasm
./icons/logo_192x192.png
./icons/logo_512x512.png
./data.xp3
`.split("\n").filter(n => !!n);

self.addEventListener("install", event => {
    console.log("serviceworker-installed");
    event.waitUntil(
        caches.open(CACHE_VERSION)
            .then(cache => cache.addAll(FORCE_CACHE_URLS))
            .then(self.skipWaiting)
    );
});

self.addEventListener("activate", event => {
    console.log("serviceworker-activated");
    clients.claim();
});

self.addEventListener('fetch', event => {
    if (event.request.method != 'GET') return;
    event.respondWith(
        caches.match(event.request)
        .then(res =>{
            if(res && res.status == 200) 
                return res;
             else
                return fetch(event.request);
        })
    );
});

