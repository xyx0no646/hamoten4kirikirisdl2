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
    if (event.request.url.endsWith('clear')) {
        // キャッシュをすべて削除する
        event.waitUntil(caches.keys().then(cacheNames => Promise.all(cacheNames.map(cacheName =>caches.delete(cacheName)))));
        return;
    }
    const fetchAndAdd = async request => {
        const cache = await caches.open(CACHE_VERSION);
        const response = await fetch(request);
        cache.put(event.request, response.clone());
        return response;
    };
    if (event.request.method != 'GET') return;
    event.respondWith(
        caches.match(event.request)
        .then(res =>{
            // キャッシュが存在し、かつ200
            if (res && res.status == 200) {
                // オフラインなら必ずキャッシュを戻す
                if (!navigator.onLine)
                    return res;
                // オンラインならheadリクエストを投げて更新を確認
                else
                    return fetch(event.request.url,{method:"HEAD"})
                        .then(headreq =>{
                            // 更新あり　アクセスする
                            if (headreq.ok && headreq.status == 200 && 
                                res.headers.get("ETag") != headreq.headers.get("ETag")) {
                                return fetchAndAdd(event.request);
                            }
                            // キャッシュにetagなし　アクセスする
                            else if (!res.headers.get("ETag")){
                                return fetchAndAdd(event.request);
                            }
                            // 更新なし　キャッシュを戻す
                            else {
                                return res;
                            }
                        })
                        //　駄目そうならキャッシュを戻す
                        .catch(error => {
                            console.error(error);
                            return res;
                        });
            }
            else
                return fetchAndAdd(event.request);
        })
    );
});

