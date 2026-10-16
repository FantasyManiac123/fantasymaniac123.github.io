# Open Gamebook Reader

Statická PWA knižnica interaktívnych príbehov vytvorených v [Ink](https://www.inklestudios.com/ink/). Aplikácia nepotrebuje server ani databázu: príbehy sa načítajú z adresára `books/` a postup hráča sa ukladá v prehliadači.

## Lokálne spustenie

Projekt musí bežať cez lokálny HTTP server, nie otvorením `index.html` priamo zo súborového systému.

```bash
npx serve .
```

Potom otvor adresu, ktorú server vypíše. Pre produkciu stačí nasadiť celý priečinok ako statický web.

## Bežný workflow

Po zmene zdrojového Ink súboru spusti:

```bash
npm run compile:ink
npm test
```

`compile:ink` skompiluje `.ink` súbory na `.json` a obnoví offline cache. Vyžaduje nainštalovaný program `inklecate`; ak nie je v `PATH`, nastav premennú `INKLECATE_BIN` na jeho cestu.

Ak sa menia obrázky, obálky, témy alebo metadáta knihy, stačí:

```bash
npm run update:precache
npm test
```

## Štruktúra knihy

Každá kniha má vlastný priečinok:

```text
books/moj-pribeh/
  book.json
  theme.json
  story.ink
  story.json
  cover.webp
  images/
```

Knihu pridaj aj do `books/library.json`. Identifikátor musí obsahovať len malé/veľké písmená, čísla, spojovník alebo podčiarkovník.

Príklad minimálneho `book.json`:

```json
{
  "id": "moj-pribeh",
  "title": "Môj príbeh",
  "author": "Autor",
  "version": "1.0",
  "language": "sk",
  "story": "story.json",
  "theme": "theme.json"
}
```

Pole `version` je súčasťou formátu uložených pozícií. Pri nekompatibilnej zmene štruktúry príbehu ho zvýš, napríklad z `1.0` na `1.1`; starý save sa potom bezpečne nenačíta do nového príbehu.

## Kapitolová kniha

Namiesto `story` môže `book.json` obsahovať pole `chapters`. Premenné, ktoré sa majú prenášať medzi kapitolami, deklaruj v každej kapitole a uveď ich v `globalVariables`.

```json
{
  "globalVariables": ["odvaha", "puto"],
  "chapters": [
    { "id": "chapter-01", "title": "I. Začiatok", "story": "chapters/chapter-01.json" }
  ]
}
```

## Ilustrácie

Ilustrácia sa viaže na názov Ink knotu. Súbor `images/zaciatok.webp` sa zobrazí pri knote `=== zaciatok ===` iba ak je knot uvedený v `illustrations`:

```json
{
  "illustrations": ["zaciatok"]
}
```

Ak sa názov knotu opakuje v kapitolách alebo názov súboru má byť odlišný, použi presné mapovanie:

```json
{
  "illustrations": [
    { "chapter": "chapter-01", "knot": "zaciatok", "file": "prichod" }
  ]
}
```

Toto výslovné uvedenie zabraňuje požiadavkám na neexistujúce obrázky. Všetky súbory kníh, okrem pracovných `.ink` a `.txt` súborov, sa automaticky pridajú do offline cache pri `npm run update:precache`.

## Kontroly

```bash
npm test
```

Kontrola overuje JSON, načítateľnosť Ink príbehov, prvé vetvenia, globálne premenné, deklarované ilustrácie a aktuálnosť offline cache.
# gamebook-reader-pwa
# gamebook-reader-pwa
# gamebook-reader-pwa
