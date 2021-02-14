new class {
    constructor() {
        this.initsw();
    }
    async initsw() {
        // Load WebManifest
        this.loadManifest("krkrsdl2.appmanifest");
        // check xp3 update
        this.checkIfUpdated();
        // Load Service Worker
        const sw = await navigator.serviceWorker.register("./serviceworker.js", {
            scope: "./",
        });
    }
    loadManifest(url) {
        let manifest = document.head.querySelector('#krkrsdl2-web-manifest');
        manifest.setAttribute('href', url);
    }
    async checkIfUpdated(){
        const check = await fetch("./data.xp3",{method:"HEAD"});
        const etag = check.headers.get("ETag");
        const localEtag = localStorage.getItem("xp3_ETag");
        // Etagがない
        if (!etag) {
            return;
        }
        // 初発
        else if (!localEtag) {
            localStorage.setItem("xp3_ETag",String(etag));
            return;
        }
        //　更新
        else if (String(etag) != localEtag) {
            await this.deleteAllCaches();
            localStorage.setItem("xp3_ETag",String(etag));
            location.reload();
        }
    }

    async deleteAllCaches(){
        caches.keys().then(keys => {
            keys.forEach(cacheName => {
                if (cacheName) {
                    caches.delete(cacheName);
                }
            });
        });
    }
}