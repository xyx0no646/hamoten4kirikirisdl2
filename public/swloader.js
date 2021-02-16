new class {
    constructor() {
        this.initsw();
    }
    async initsw() {
        // Load WebManifest
        this.loadManifest("krkrsdl2.appmanifest");
        // Load Service Worker
        const sw = await navigator.serviceWorker.register("./serviceworker.js", {
            scope: "./",
        });
    }
    loadManifest(url) {
        let manifest = document.head.querySelector('#krkrsdl2-web-manifest');
        manifest.setAttribute('href', url);
    }
}