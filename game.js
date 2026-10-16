let story = null;
let bookId = null;
let bookMetadata = null;
let bookTheme = null;

let chapterMode = false;
let currentChapterIndex = 0;
let currentChapter = null;
let globalGameState = {};

const storyElement = document.getElementById("story");
const choicesElement = document.getElementById("choices");
const saveButton = document.getElementById("saveButton");
const loadButton = document.getElementById("loadButton");
const restartButton = document.getElementById("restartButton");
const themeButton = document.getElementById("themeButton");
const messageElement = document.getElementById("message");
const titleElement = document.getElementById("bookTitle");
const subtitleElement = document.getElementById("bookSubtitle");
const chapterTitleElement = document.getElementById("chapterTitle");

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

    const params = new URLSearchParams(window.location.search);
    bookId = params.get("book") || sessionStorage.getItem("open-gamebook-selected-book");

    if (!bookId) {
        showNoBookSelected();
        return;
    }

    if (!/^[a-zA-Z0-9_-]+$/.test(bookId)) {
        showFatalError("Neplatné ID gamebooku.");
        return;
    }

    try {
        const metadataResponse = await fetch(`./books/${bookId}/book.json`);
        if (!metadataResponse.ok) throw new Error("book.json sa nepodarilo načítať.");

        bookMetadata = await metadataResponse.json();
        setBookMetadata();
        await loadBookTheme();

        chapterMode = Array.isArray(bookMetadata.chapters) && bookMetadata.chapters.length > 0;

        if (chapterMode) {
            const saved = parseChapterSave(localStorage.getItem(getAutosaveKey()));

            if (saved) {
                globalGameState = saved.globals || {};
                try {
                    await loadChapter(saved.chapterIndex, saved.inkState, globalGameState, saved.display);
                } catch (error) {
                    console.warn("Autosave sa nepodarilo načítať:", error);
                    localStorage.removeItem(getAutosaveKey());
                    await loadChapter(0, null, {});
                }
            } else {
                // Starý jednodielny autosave nie je kompatibilný s kapitolovým formátom.
                const oldSave = localStorage.getItem(getAutosaveKey());
                if (oldSave) localStorage.removeItem(getAutosaveKey());
                await loadChapter(0, null, {});
            }
        } else {
            await loadSingleStory();
        }
    } catch (error) {
        console.error(error);
        showFatalError("Gamebook sa nepodarilo načítať.");
    }
}

function showNoBookSelected() {
    console.error("Nebol vybraný žiadny gamebook.");
    if (!storyElement) return;

    storyElement.innerHTML = "";
    const paragraph = document.createElement("p");
    paragraph.className = "error-message";
    paragraph.textContent = "Najprv si vyber gamebook v knižnici.";

    const link = document.createElement("a");
    link.className = "back-link";
    link.href = "./index.html";
    link.textContent = "← Späť do knižnice";

    storyElement.append(paragraph, link);
}

function safeRelativeStoryPath(value) {
    return typeof value === "string"
        && /^[a-zA-Z0-9_./-]+$/.test(value)
        && !value.includes("..")
        && !value.startsWith("/");
}

async function fetchInkStory(relativePath) {
    if (!safeRelativeStoryPath(relativePath)) {
        throw new Error(`Neplatná cesta k Ink JSON: ${relativePath}`);
    }

    const response = await fetch(`./books/${bookId}/${relativePath}`);
    if (!response.ok) throw new Error(`Nepodarilo sa načítať ${relativePath}`);
    const storyData = await response.json();
    return new inkjs.Story(storyData);
}

async function loadSingleStory() {
    const storyFilename = bookMetadata.story || "story.json";
    story = await fetchInkStory(storyFilename);

    const saved = parseSingleSave(localStorage.getItem(getAutosaveKey()));
    let savedDisplay = null;
    if (saved) {
        try {
            story.state.LoadJson(saved.inkState);
            savedDisplay = saved.display;
        } catch (error) {
            console.warn("Autosave sa nepodarilo načítať:", error);
            localStorage.removeItem(getAutosaveKey());
        }
    } else if (localStorage.getItem(getAutosaveKey())) {
        localStorage.removeItem(getAutosaveKey());
    }

    updateChapterTitle();
    render(savedDisplay);
}

async function loadChapter(index, inkState = null, globals = null, display = null) {
    const chapters = bookMetadata.chapters;
    if (!Number.isInteger(index) || index < 0 || index >= chapters.length) {
        throw new Error("Neplatné číslo kapitoly.");
    }

    currentChapterIndex = index;
    currentChapter = chapters[index];
    story = await fetchInkStory(currentChapter.story);

    if (globals && typeof globals === "object") {
        globalGameState = { ...globals };
        applyGlobalStateToStory(globalGameState);
    }

    if (inkState) {
        try {
            story.state.LoadJson(inkState);
        } catch (error) {
            throw new Error(`Stav kapitoly sa nepodarilo obnoviť: ${error.message}`);
        }
    }

    captureGlobalState();
    updateChapterTitle();
    render(display);
}

function updateChapterTitle() {
    if (!chapterTitleElement) return;

    if (chapterMode && currentChapter?.title) {
        chapterTitleElement.textContent = currentChapter.title;
        chapterTitleElement.hidden = false;
    } else {
        chapterTitleElement.textContent = "";
        chapterTitleElement.hidden = true;
    }
}

function getGlobalVariableNames() {
    return Array.isArray(bookMetadata?.globalVariables)
        ? bookMetadata.globalVariables.filter(name => typeof name === "string" && /^[a-zA-Z_][a-zA-Z0-9_]*$/.test(name))
        : [];
}

function captureGlobalState() {
    if (!chapterMode || !story) return globalGameState;

    const next = { ...globalGameState };
    for (const name of getGlobalVariableNames()) {
        try {
            next[name] = story.variablesState[name];
        } catch (_) {
            // Kapitola nemusí danú premennú deklarovať; vtedy ponecháme starú hodnotu.
        }
    }

    globalGameState = next;
    return globalGameState;
}

function applyGlobalStateToStory(globals) {
    if (!story || !globals) return;

    for (const name of getGlobalVariableNames()) {
        if (!Object.prototype.hasOwnProperty.call(globals, name)) continue;
        try {
            story.variablesState[name] = globals[name];
        } catch (error) {
            console.warn(`Globálnu premennú ${name} sa nepodarilo preniesť:`, error);
        }
    }
}

function parseChapterSave(raw) {
    if (!raw) return null;

    try {
        const data = JSON.parse(raw);
        if (data?.engineSaveVersion !== 3 || data?.mode !== "chapters") return null;
        if (data.bookId !== bookId || data.bookVersion !== bookMetadata?.version) return null;
        if (!Number.isInteger(data.chapterIndex)) return null;
        if (!Array.isArray(bookMetadata?.chapters) || data.chapterIndex < 0 || data.chapterIndex >= bookMetadata.chapters.length) return null;
        if (typeof data.inkState !== "string") return null;
        return data;
    } catch (_) {
        return null;
    }
}

function parseSingleSave(raw) {
    if (!raw) return null;

    try {
        const data = JSON.parse(raw);
        if (data?.engineSaveVersion !== 3 || data?.mode !== "single") return null;
        if (data.bookId !== bookId || data.bookVersion !== bookMetadata?.version) return null;
        if (typeof data.inkState !== "string") return null;
        return data;
    } catch (_) {
        return null;
    }
}

function buildSingleSave() {
    return {
        engineSaveVersion: 3,
        mode: "single",
        bookId,
        bookVersion: bookMetadata?.version || null,
        inkState: story.state.ToJson(),
        display: captureDisplayedScene()
    };
}

function buildChapterSave() {
    captureGlobalState();
    return {
        engineSaveVersion: 3,
        mode: "chapters",
        bookId,
        bookVersion: bookMetadata?.version || null,
        chapterIndex: currentChapterIndex,
        chapterId: currentChapter?.id || null,
        globals: globalGameState,
        inkState: story.state.ToJson(),
        display: captureDisplayedScene()
    };
}

function setBookMetadata() {
    if (!bookMetadata) return;
    document.title = bookMetadata.title || "Gamebook";
    document.documentElement.lang = bookMetadata.language || "sk";
    if (titleElement) titleElement.textContent = bookMetadata.title || "Gamebook";
    if (subtitleElement) subtitleElement.textContent = bookMetadata.author || "Interaktívny príbeh";
}

async function loadBookTheme() {
    bookTheme = null;

    const themeFile = bookMetadata?.theme;
    if (!themeFile || !/^[a-zA-Z0-9_.-]+$/.test(themeFile)) {
        applyThemeConfig(null);
        return;
    }

    try {
        const response = await fetch(`./books/${bookId}/${themeFile}`);
        if (!response.ok) throw new Error(`Nepodarilo sa načítať ${themeFile}`);
        bookTheme = await response.json();
        applyThemeConfig(bookTheme);
    } catch (error) {
        console.warn("Téma knihy sa nepodarila načítať:", error);
        applyThemeConfig(null);
    }
}

const THEME_PRESETS = {
    default: {
        pattern: "soft-glow"
    },
    mystic: {
        pattern: "geometric"
    },
    fantasy: {
        pattern: "parchment"
    },
    cyberpunk: {
        pattern: "cyber-grid"
    },
    horror: {
        pattern: "noise"
    }
};

function applyThemeConfig(theme) {
    const root = document.documentElement;
    const body = document.body;

    body.classList.remove(
        "theme-pattern-soft-glow",
        "theme-pattern-geometric",
        "theme-pattern-parchment",
        "theme-pattern-cyber-grid",
        "theme-pattern-noise"
    );

    const presetName = theme?.preset || "default";
    const preset = THEME_PRESETS[presetName] || THEME_PRESETS.default;
    const pattern = theme?.background?.pattern || preset.pattern || "soft-glow";
    body.classList.add(`theme-pattern-${pattern}`);

    applyThemeModeColors();

    const typography = theme?.typography || {};
    setVar("--story-font", normalizeFont(typography.storyFont, "serif"));
    setVar("--ui-font", normalizeFont(typography.uiFont, "sans-serif"));
    setVar("--story-size", safeCssSize(typography.storySize, "19px"));
    setVar("--story-line-height", safeNumber(typography.lineHeight, 1.82));
    setVar("--paragraph-indent", safeCssSize(typography.paragraphIndent, "1.7em"));

    const layout = theme?.layout || {};
    setVar("--reading-width", safeCssSize(layout.readingWidth, "920px"));
    setVar("--game-radius", safeCssSize(layout.gameRadius, "0px"));
    setVar("--game-padding", safeCssPadding(layout.gamePadding, "24px 30px 88px"));

    const bg = theme?.background || {};
    setVar("--theme-pattern-size", safeCssSizePair(bg.patternSize, "84px 144px"));
    setVar("--game-surface-opacity", clampNumber(bg.gameSurfaceOpacity, 0, 1, 0.96));
    setVar("--game-backdrop-blur", safeCssSize(bg.blur, "0px"));
    body.classList.toggle("theme-background-fixed", bg.fixed === true);

    const choices = theme?.choices || {};
    setVar("--choice-radius", safeCssSize(choices.radius, "12px"));
    setVar("--choice-border-width", safeCssSize(choices.borderWidth, "1px"));
    setVar("--choice-accent-border-width", safeCssSize(choices.accentBorderWidth, "4px"));

    const illustrations = theme?.illustrations || {};
    setVar("--image-radius", safeCssSize(illustrations.radius, "14px"));
    body.classList.toggle("theme-image-border", illustrations.border !== false);
    body.classList.toggle("theme-image-shadow", illustrations.shadow !== false);

    applyTextStyleConfig(theme?.textStyles || {});
}

function applyThemeModeColors() {
    const mode = document.body.classList.contains("dark") ? "dark" : "light";
    const colors = bookTheme?.[mode] || {};
    const mapping = {
        background: "--background",
        surface: "--surface",
        surfaceStrong: "--surface-strong",
        text: "--text",
        secondary: "--secondary",
        border: "--border",
        accent: "--accent",
        accentStrong: "--accent-strong",
        accentSoft: "--accent-soft",
        accentContrast: "--accent-contrast",
        choice: "--choice",
        choiceHover: "--choice-hover"
    };

    for (const [key, variable] of Object.entries(mapping)) {
        if (typeof colors[key] === "string" && isSafeCssColor(colors[key])) {
            setVar(variable, colors[key]);
        }
    }
}

function applyTextStyleConfig(styles) {
    const defaults = {
        player: {}, character: {}, thought: {}, system: {}, inscription: {}
    };

    for (const type of Object.keys(defaults)) {
        const cfg = styles[type] || {};
        const prefix = `--text-${type}`;
        setVar(`${prefix}-font-style`, cfg.italic === true ? "italic" : "normal");
        setVar(`${prefix}-weight`, Number.isFinite(Number(cfg.weight)) ? String(cfg.weight) : "400");
        setVar(`${prefix}-align`, ["left", "center", "right"].includes(cfg.align) ? cfg.align : "left");
        setVar(`${prefix}-letter-spacing`, safeCssSize(cfg.letterSpacing, "0em"));
        setVar(`${prefix}-font`, normalizeFont(cfg.font, type === "system" ? "monospace" : "inherit"));
        setVar(`${prefix}-color`, colorToken(cfg.color || (cfg.accent ? "accent" : "text")));
        setVar(`${prefix}-surface`, colorToken(cfg.surface || "transparent"));
        setVar(`${prefix}-border`, cfg.borderLeft === true ? "var(--accent)" : "transparent");
        document.body.classList.toggle(`text-${type}-uppercase`, cfg.uppercase === true);
    }
}

function colorToken(value) {
    const tokens = {
        text: "var(--text)", secondary: "var(--secondary)", accent: "var(--accent)",
        accentStrong: "var(--accent-strong)", accentSoft: "var(--accent-soft)",
        surface: "var(--surface)", transparent: "transparent"
    };
    if (tokens[value]) return tokens[value];
    return typeof value === "string" && isSafeCssColor(value) ? value : "var(--text)";
}

function setVar(name, value) {
    document.documentElement.style.setProperty(name, String(value));
}

function normalizeFont(value, fallback) {
    const allowed = ["serif", "sans-serif", "monospace", "inherit"];
    return allowed.includes(value) ? value : fallback;
}

function isSafeCssColor(value) {
    return /^#[0-9a-fA-F]{3,8}$/.test(value) || /^(rgb|rgba|hsl|hsla)\([0-9.,%\s]+\)$/.test(value);
}

function safeCssSize(value, fallback) {
    if (typeof value !== "string") return fallback;
    return /^-?\d+(\.\d+)?(px|em|rem|%|vh|vw)$/.test(value.trim()) ? value.trim() : fallback;
}

function safeCssSizePair(value, fallback) {
    if (typeof value !== "string") return fallback;
    const parts = value.trim().split(/\s+/);
    return parts.length <= 2 && parts.every(v => /^\d+(\.\d+)?(px|em|rem|%)$/.test(v)) ? value.trim() : fallback;
}

function safeCssPadding(value, fallback) {
    if (typeof value !== "string") return fallback;
    const parts = value.trim().split(/\s+/);
    return parts.length >= 1 && parts.length <= 4 && parts.every(v => /^\d+(\.\d+)?(px|em|rem|%)$/.test(v)) ? value.trim() : fallback;
}

function safeNumber(value, fallback) {
    const n = Number(value);
    return Number.isFinite(n) ? n : fallback;
}

function clampNumber(value, min, max, fallback) {
    const n = Number(value);
    if (!Number.isFinite(n)) return fallback;
    return Math.min(max, Math.max(min, n));
}

function render(savedDisplay = null) {
    if (!story) return;

    storyElement.innerHTML = "";
    choicesElement.innerHTML = "";
    clearSceneBackground();

    let pendingTextType = "narrator";
    let pendingSpeaker = "";
    let sceneIllustrationAdded = false;
    const restoreSavedDisplay = savedDisplay?.paragraphs?.length > 0
        && !story.canContinue;

    if (restoreSavedDisplay) restoreDisplayedScene(savedDisplay);

    while (!restoreSavedDisplay && story.canContinue) {
        const text = story.Continue().trim();
        const tags = Array.isArray(story.currentTags) ? story.currentTags : [];

        // Obrázky už Ink tagmi neriadime. Z tagov čítame len
        // typ textu a voliteľné pozadie scény.
        for (const rawTag of tags) {
            const tag = rawTag.trim();
            const separator = tag.indexOf(":");
            const key = (separator >= 0 ? tag.slice(0, separator) : tag).trim().toLowerCase();
            const value = separator >= 0 ? tag.slice(separator + 1).trim() : "";

            if (["narrator", "player", "thought", "system", "inscription"].includes(key)) {
                pendingTextType = key;
                pendingSpeaker = value || "";
            }

            if (key === "character") {
                pendingTextType = "character";
                pendingSpeaker = value || "";
            }

            if (key === "background" && value) {
                setSceneBackground(value);
            }
        }

        if (!text) continue;

        // Po prvom Continue() už Ink pozná názov aktuálneho knotu.
        // Napr. zaciatok.0.14 -> zaciatok -> images/zaciatok.webp
        if (!sceneIllustrationAdded) {
            const knotName = getCurrentKnotName();
            if (knotName) addAutomaticSceneImage(knotName);
            sceneIllustrationAdded = true;
        }

        addStoryParagraph(text, pendingTextType, pendingSpeaker);

        pendingTextType = "narrator";
        pendingSpeaker = "";
    }

    story.currentChoices.forEach(choice => {
        const button = document.createElement("button");
        button.className = "choice";
        button.type = "button";
        button.textContent = choice.text;

        button.addEventListener("click", () => {
            story.ChooseChoiceIndex(choice.index);
            render();
            autosave();
            scrollToStory();
        });

        choicesElement.appendChild(button);
    });

    if (!story.canContinue && story.currentChoices.length === 0) showStoryEnd();
}

function getCurrentKnotName() {
    const path = story?.state?.currentPathString;
    if (!path || path === "0") return null;

    const first = String(path).split(".")[0];
    if (!first || /^\d+$/.test(first)) return null;
    if (!/^[a-zA-Z0-9_-]+$/.test(first)) return null;
    return first;
}

function addAutomaticSceneImage(knotName) {
    const illustrations = Array.isArray(bookMetadata?.illustrations) ? bookMetadata.illustrations : [];
    const illustration = illustrations.find(item => {
        if (typeof item === "string") return item === knotName;
        return item?.knot === knotName
            && (!item.chapter || item.chapter === currentChapter?.id);
    });
    if (!illustration) return;

    const filename = `${typeof illustration === "string" ? illustration : illustration.file || knotName}.webp`;
    const src = assetUrl(filename);
    if (!src) return;

    const figure = document.createElement("figure");
    figure.className = "story-illustration story-illustration-wide automatic-scene-image";
    figure.dataset.sceneKnot = knotName;

    const image = document.createElement("img");
    image.className = "story-image";
    image.src = src;
    image.alt = "";
    image.loading = "eager";
    image.decoding = "async";

    // Knot nemusí mať ilustráciu. Ak súbor neexistuje,
    // rozbitý obrázok sa jednoducho odstráni.
    image.addEventListener("error", () => {
        figure.remove();
    });

    figure.appendChild(image);
    storyElement.appendChild(figure);
}


function addStoryParagraph(text, type = "narrator", speaker = "") {
    const allowedTypes = ["narrator", "player", "character", "thought", "system", "inscription"];
    const safeType = allowedTypes.includes(type) ? type : "narrator";

    const paragraph = document.createElement("p");
    paragraph.className = `story-paragraph story-${safeType}`;
    paragraph.dataset.textType = safeType;
    paragraph.dataset.speaker = speaker;

    if (speaker && ["character", "player", "system", "inscription"].includes(safeType)) {
        const speakerElement = document.createElement("span");
        speakerElement.className = "story-speaker";
        speakerElement.textContent = speaker;
        paragraph.appendChild(speakerElement);
    }

    const textNode = document.createElement("span");
    textNode.className = "story-text";
    textNode.textContent = text;
    paragraph.appendChild(textNode);

    storyElement.appendChild(paragraph);
}

function captureDisplayedScene() {
    if (!storyElement) return null;

    const paragraphs = [...storyElement.querySelectorAll(".story-paragraph")].map(paragraph => ({
        text: paragraph.querySelector(".story-text")?.textContent || "",
        type: paragraph.dataset.textType || "narrator",
        speaker: paragraph.dataset.speaker || ""
    }));

    if (paragraphs.length === 0) return null;
    return {
        paragraphs,
        knotName: storyElement.querySelector(".automatic-scene-image")?.dataset.sceneKnot || null,
        background: document.body.dataset.sceneBackground || null
    };
}

function restoreDisplayedScene(display) {
    if (!display || !Array.isArray(display.paragraphs)) return;

    if (typeof display.background === "string" && safeAssetName(display.background)) {
        setSceneBackground(display.background);
    }
    if (typeof display.knotName === "string" && /^[a-zA-Z0-9_-]+$/.test(display.knotName)) {
        addAutomaticSceneImage(display.knotName);
    }

    for (const paragraph of display.paragraphs) {
        if (typeof paragraph?.text !== "string") continue;
        addStoryParagraph(paragraph.text, paragraph.type, typeof paragraph.speaker === "string" ? paragraph.speaker : "");
    }
}

function safeAssetName(filename) {
    return /^[a-zA-Z0-9_./-]+$/.test(filename) && !filename.includes("..") && !filename.startsWith("/");
}

function assetUrl(filename) {
    if (!safeAssetName(filename)) return null;
    return `./books/${bookId}/images/${filename}`;
}

function setSceneBackground(filename) {
    const src = assetUrl(filename);
    if (!src) return;
    document.body.classList.add("has-scene-background");
    document.body.dataset.sceneBackground = filename;
    document.body.style.setProperty("--scene-background", `url("${src}")`);
}

function clearSceneBackground() {
    document.body.classList.remove("has-scene-background");
    delete document.body.dataset.sceneBackground;
    document.body.style.removeProperty("--scene-background");
}

function showStoryEnd() {
    if (chapterMode && currentChapterIndex < bookMetadata.chapters.length - 1) {
        captureGlobalState();
        autosave();

        const nextChapter = bookMetadata.chapters[currentChapterIndex + 1];

        const panel = document.createElement("div");
        panel.className = "chapter-end";

        const label = document.createElement("p");
        label.className = "chapter-end-label";
        label.textContent = `Kapitola ${currentChapterIndex + 1} dokončená`;
        panel.appendChild(label);

        const button = document.createElement("button");
        button.className = "choice chapter-next-button";
        button.type = "button";
        button.textContent = `Pokračovať — ${nextChapter.title || `Kapitola ${currentChapterIndex + 2}`}`;
        button.addEventListener("click", async () => {
            button.disabled = true;
            try {
                await loadChapter(currentChapterIndex + 1, null, globalGameState);
                autosave();
                scrollToStory();
            } catch (error) {
                console.error("Ďalšiu kapitolu sa nepodarilo načítať:", error);
                showMessage("Ďalšiu kapitolu sa nepodarilo načítať");
                button.disabled = false;
            }
        });

        panel.appendChild(button);
        choicesElement.appendChild(panel);
        return;
    }

    const endElement = document.createElement("div");
    endElement.className = "story-end";
    endElement.textContent = "Koniec príbehu";
    choicesElement.appendChild(endElement);
}

function getSaveKey() { return `ink-save-${bookId}`; }
function getAutosaveKey() { return `ink-autosave-${bookId}`; }

function saveGame() {
    if (!story) return;
    try {
        const value = chapterMode
            ? JSON.stringify(buildChapterSave())
            : JSON.stringify(buildSingleSave());
        localStorage.setItem(getSaveKey(), value);
        showMessage("Hra uložená");
    } catch (error) {
        console.error("Chyba pri ukladaní:", error);
        showMessage("Hru sa nepodarilo uložiť");
    }
}

async function loadGame() {
    if (!story) return;
    const saveData = localStorage.getItem(getSaveKey());
    if (!saveData) {
        showMessage("Žiadna manuálne uložená hra");
        return;
    }

    try {
        if (chapterMode) {
            const saved = parseChapterSave(saveData);
            if (!saved) throw new Error("Uložená hra používa starý alebo nekompatibilný formát.");
            globalGameState = saved.globals || {};
            await loadChapter(saved.chapterIndex, saved.inkState, globalGameState, saved.display);
        } else {
            const saved = parseSingleSave(saveData);
            if (!saved) throw new Error("Uložená hra používa starý alebo nekompatibilný formát.");
            story.state.LoadJson(saved.inkState);
            render(saved.display);
        }

        autosave();
        scrollToStory();
        showMessage("Hra načítaná");
    } catch (error) {
        console.error("Chyba pri načítaní:", error);
        showMessage("Uloženú hru sa nepodarilo načítať");
    }
}

function autosave() {
    if (!story) return;
    try {
        const value = chapterMode
            ? JSON.stringify(buildChapterSave())
            : JSON.stringify(buildSingleSave());
        localStorage.setItem(getAutosaveKey(), value);
    } catch (error) {
        console.error("Autosave zlyhal:", error);
    }
}

function restartGame() {
    if (!story) return;
    const confirmed = confirm("Naozaj chceš začať novú hru? Aktuálny postup bude vymazaný.");
    if (!confirmed) return;
    localStorage.removeItem(getAutosaveKey());
    localStorage.removeItem(getSaveKey());
    window.location.reload();
}

function toggleTheme() {
    const dark = !document.body.classList.contains("dark");
    document.body.classList.toggle("dark", dark);
    localStorage.setItem("reader-theme", dark ? "dark" : "light");
    updateThemeButton();
    applyThemeModeColors();
}

function loadTheme() {
    const savedTheme = localStorage.getItem("reader-theme");
    const systemDark = window.matchMedia?.("(prefers-color-scheme: dark)").matches;
    const dark = savedTheme ? savedTheme === "dark" : systemDark;
    document.body.classList.toggle("dark", dark);
    updateThemeButton();
    applyThemeModeColors();
}

function updateThemeButton() {
    if (!themeButton) return;
    const dark = document.body.classList.contains("dark");
    themeButton.innerHTML = dark ? sunIcon : moonIcon;
    themeButton.setAttribute("aria-label", dark ? "Prepnúť na svetlú tému" : "Prepnúť na tmavú tému");
    themeButton.title = dark ? "Svetlá téma" : "Tmavá téma";
}

function scrollToStory() {
    const gameElement = document.getElementById("game");
    if (gameElement) gameElement.scrollIntoView({ behavior: "smooth", block: "start" });
    else window.scrollTo({ top: 0, behavior: "smooth" });
}

function showMessage(text) {
    if (!messageElement) return;
    messageElement.textContent = text;
    messageElement.classList.add("visible");
    setTimeout(() => messageElement.classList.remove("visible"), 1600);
}

function showFatalError(text) {
    console.error(text);
    if (storyElement) {
        storyElement.innerHTML = "";
        const paragraph = document.createElement("p");
        paragraph.className = "error-message";
        paragraph.textContent = text;
        storyElement.appendChild(paragraph);
    }
    if (choicesElement) {
        choicesElement.innerHTML = "";
        const button = document.createElement("button");
        button.className = "choice";
        button.type = "button";
        button.textContent = "Späť do knižnice";
        button.addEventListener("click", () => window.location.href = "./index.html");
        choicesElement.appendChild(button);
    }
}

if (saveButton) saveButton.addEventListener("click", saveGame);
if (loadButton) loadButton.addEventListener("click", loadGame);
if (restartButton) restartButton.addEventListener("click", restartGame);
if (themeButton) themeButton.addEventListener("click", toggleTheme);
