(() => {
    const installButton = document.getElementById("installButton");
    const installHelp = document.getElementById("installHelp");
    const closeInstallHelp = document.getElementById("closeInstallHelp");
    let deferredPrompt = null;

    const isStandalone = () =>
        window.matchMedia("(display-mode: standalone)").matches ||
        window.navigator.standalone === true;

    const isIOS = () => {
        const ua = navigator.userAgent || "";
        const classicIOS = /iPad|iPhone|iPod/.test(ua);
        const iPadDesktopMode = navigator.platform === "MacIntel" && navigator.maxTouchPoints > 1;
        return classicIOS || iPadDesktopMode;
    };

    function hideInstallButton() {
        if (installButton) installButton.hidden = true;
    }

    function showInstallButton(mode) {
        if (!installButton || isStandalone()) return;
        installButton.hidden = false;
        installButton.dataset.installMode = mode;
        installButton.textContent = mode === "ios" ? "Pridať na plochu" : "Nainštalovať aplikáciu";
    }

    function showIOSHelp() {
        if (!installHelp) return;
        installHelp.hidden = false;
        installHelp.setAttribute("aria-hidden", "false");
        closeInstallHelp?.focus();
    }

    function hideIOSHelp() {
        if (!installHelp) return;
        installHelp.hidden = true;
        installHelp.setAttribute("aria-hidden", "true");
        installButton?.focus();
    }

    window.addEventListener("beforeinstallprompt", event => {
        event.preventDefault();
        deferredPrompt = event;
        showInstallButton("native");
    });

    window.addEventListener("appinstalled", () => {
        deferredPrompt = null;
        hideInstallButton();
    });

    installButton?.addEventListener("click", async () => {
        if (isStandalone()) {
            hideInstallButton();
            return;
        }

        if (deferredPrompt) {
            deferredPrompt.prompt();
            try {
                await deferredPrompt.userChoice;
            } finally {
                deferredPrompt = null;
                hideInstallButton();
            }
            return;
        }

        if (isIOS()) {
            showIOSHelp();
        }
    });

    closeInstallHelp?.addEventListener("click", hideIOSHelp);
    installHelp?.addEventListener("click", event => {
        if (event.target === installHelp) hideIOSHelp();
    });
    document.addEventListener("keydown", event => {
        if (event.key === "Escape" && installHelp && !installHelp.hidden) hideIOSHelp();
    });

    if (!isStandalone() && isIOS()) showInstallButton("ios");
    else if (isStandalone()) hideInstallButton();

    if ("serviceWorker" in navigator) {
        window.addEventListener("load", () => {
            navigator.serviceWorker.register("./service-worker.js").catch(error => {
                console.error("Service worker sa nepodarilo zaregistrovať:", error);
            });
        });
    }
})();
