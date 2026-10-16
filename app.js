const libraryElement = document.getElementById("library");
const messageElement = document.getElementById("message");
const themeButton = document.getElementById("themeButton");

const moonIcon = `
<svg viewBox="0 0 24 24" aria-hidden="true">
    <path d="M20.5 14.2A8.5 8.5 0 0 1 9.8 3.5 8.7 8.7 0 1 0 20.5 14.2Z" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round"/>
</svg>`;

const sunIcon = `
<svg viewBox="0 0 24 24" aria-hidden="true">
    <circle cx="12" cy="12" r="4" fill="none" stroke="currentColor" stroke-width="2"/>
    <path d="M12 2v2M12 20v2M4.93 4.93l1.42 1.42M17.65 17.65l1.42 1.42M2 12h2M20 12h2M4.93 19.07l1.42-1.42M17.65 6.35l1.42-1.42" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round"/>
</svg>`;

init();

async function init() {
    loadTheme();
    await loadLibrary();
}

async function loadLibrary() {
    if (!libraryElement) return;

    libraryElement.innerHTML = '<p class="loading-message">Načítavam knižnicu…</p>';

    try {
        const response = await fetch("./books/library.json");
        if (!response.ok) throw new Error("Nepodarilo sa načítať books/library.json");

        const library = await response.json();
        libraryElement.innerHTML = "";

        if (!Array.isArray(library) || library.length === 0) {
            libraryElement.innerHTML = '<p class="empty-message">V knižnici zatiaľ nie sú žiadne gamebooky.</p>';
            return;
        }

        for (const item of library) {
            try {
                if (!item.id || !/^[a-zA-Z0-9_-]+$/.test(item.id)) {
                    throw new Error("Neplatné ID knihy");
                }

                const metadataResponse = await fetch(`./books/${item.id}/book.json`);
                if (!metadataResponse.ok) throw new Error(`Nepodarilo sa načítať ${item.id}/book.json`);

                const book = await metadataResponse.json();
                book._themeAccent = await loadBookAccent(item.id, book);
                createBookCard(book);
            } catch (error) {
                console.error(`Chyba pri načítaní knihy ${item.id ?? "?"}:`, error);
            }
        }

        if (!libraryElement.children.length) {
            libraryElement.innerHTML = '<p class="empty-message">Nenašiel sa žiadny platný gamebook.</p>';
        }
    } catch (error) {
        console.error(error);
        libraryElement.innerHTML = '<p class="error-message">Knižnicu gamebookov sa nepodarilo načítať.</p>';
    }
}


async function loadBookAccent(bookId, book) {
    const themeFile = book?.theme;
    if (!themeFile || !/^[a-zA-Z0-9_.-]+$/.test(themeFile)) return null;

    try {
        const response = await fetch(`./books/${bookId}/${themeFile}`);
        if (!response.ok) return null;
        const theme = await response.json();
        const dark = document.body.classList.contains("dark");
        const colors = dark ? theme.dark : theme.light;
        const accent = colors?.accent;
        return typeof accent === "string" && /^#[0-9a-fA-F]{6}$/.test(accent) ? accent : null;
    } catch (error) {
        console.warn(`Nepodarilo sa načítať akcent témy pre ${bookId}:`, error);
        return null;
    }
}

function createBookCard(book) {
    const card = document.createElement("article");
    card.className = "book-card";

    const cardAccent = book._themeAccent || book.accent;
    if (cardAccent && /^#[0-9a-fA-F]{6}$/.test(cardAccent)) {
        card.style.setProperty("--book-accent", cardAccent);
    }

    const coverWrap = document.createElement("div");
    coverWrap.className = "book-cover-wrap";

    if (book.cover) {
        const cover = document.createElement("img");
        cover.className = "book-cover";
        cover.src = `./books/${book.id}/${book.cover}`;
        cover.alt = `Obálka: ${book.title}`;
        cover.loading = "lazy";

        cover.addEventListener("error", () => {
            cover.remove();
            createCoverPlaceholder(coverWrap, book);
        }, { once: true });

        coverWrap.appendChild(cover);
    } else {
        createCoverPlaceholder(coverWrap, book);
    }

    const content = document.createElement("div");
    content.className = "book-content";

    const title = document.createElement("h2");
    title.textContent = book.title || "Bez názvu";
    content.appendChild(title);

    if (book.author) {
        const author = document.createElement("p");
        author.className = "book-author";
        author.textContent = book.author;
        content.appendChild(author);
    }

    if (book.description) {
        const description = document.createElement("p");
        description.className = "book-description";
        description.textContent = book.description;
        content.appendChild(description);
    }

    const autosaveKey = `ink-autosave-${book.id}`;
    const hasSave = localStorage.getItem(autosaveKey) !== null;

    const actions = document.createElement("div");
    actions.className = "book-actions";

    const readButton = document.createElement("button");
    readButton.className = "read-button";
    readButton.type = "button";
    readButton.textContent = hasSave ? "Pokračovať" : "Začať čítať";
    readButton.addEventListener("click", () => {
        // Query parameter je primárny zdroj pravdy. Výber uložíme aj do
        // sessionStorage, aby čítačka fungovala v PWA/webview prostrediach,
        // ktoré pri navigácii občas zahodia query string.
        sessionStorage.setItem("open-gamebook-selected-book", book.id);
        const readerUrl = new URL("game.html", window.location.href);
        readerUrl.searchParams.set("book", book.id);
        window.location.assign(readerUrl);
    });
    actions.appendChild(readButton);

    if (hasSave) {
        const newGameButton = document.createElement("button");
        newGameButton.className = "new-game-button";
        newGameButton.type = "button";
        newGameButton.textContent = "Nová hra";
        newGameButton.addEventListener("click", () => {
            const confirmed = confirm(`Vymazať uložený postup pre „${book.title}“ a začať odznova?`);
            if (!confirmed) return;

            localStorage.removeItem(`ink-autosave-${book.id}`);
            localStorage.removeItem(`ink-save-${book.id}`);
            window.location.href = `./game.html?book=${encodeURIComponent(book.id)}`;
        });
        actions.appendChild(newGameButton);
    }

    content.appendChild(actions);
    card.append(coverWrap, content);
    libraryElement.appendChild(card);
}

function createCoverPlaceholder(container, book) {
    if (container.querySelector(".book-cover-placeholder")) return;

    const placeholder = document.createElement("div");
    placeholder.className = "book-cover-placeholder";

    const mark = document.createElement("span");
    mark.className = "cover-mark";
    mark.textContent = (book.title || "G").trim().charAt(0).toUpperCase();

    const label = document.createElement("span");
    label.className = "cover-label";
    label.textContent = book.title || "Gamebook";

    placeholder.append(mark, label);
    container.appendChild(placeholder);
}

function toggleTheme() {
    const dark = !document.body.classList.contains("dark");
    document.body.classList.toggle("dark", dark);
    localStorage.setItem("reader-theme", dark ? "dark" : "light");
    updateThemeButton();
}

function loadTheme() {
    const savedTheme = localStorage.getItem("reader-theme");
    const systemDark = window.matchMedia?.("(prefers-color-scheme: dark)").matches;
    const dark = savedTheme ? savedTheme === "dark" : systemDark;

    document.body.classList.toggle("dark", dark);
    updateThemeButton();
}

function updateThemeButton() {
    if (!themeButton) return;
    const dark = document.body.classList.contains("dark");
    themeButton.innerHTML = dark ? sunIcon : moonIcon;
    themeButton.setAttribute("aria-label", dark ? "Prepnúť na svetlú tému" : "Prepnúť na tmavú tému");
    themeButton.title = dark ? "Svetlá téma" : "Tmavá téma";
}

function showMessage(text) {
    if (!messageElement) return;
    messageElement.textContent = text;
    messageElement.classList.add("visible");
    setTimeout(() => messageElement.classList.remove("visible"), 1600);
}

if (themeButton) themeButton.addEventListener("click", toggleTheme);
