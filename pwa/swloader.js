new class {
    constructor() {
        this.initsw();
    }
    async initsw() {
        // Load Service Worker
        const sw = await navigator.serviceWorker.register("./serviceworker.js", {
            scope: "./",
        });
    }
}