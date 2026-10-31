#!/usr/bin/env bash

# Import the ten Vaelgard chapter illustrations generated in this Codex chat.
# The source directory can be supplied as the first argument. By default it
# uses this chat's generated-image directory. Files are copied, not moved, so
# the originals remain available as a backup.
set -euo pipefail

SCRIPT_DIR="$(CDPATH= cd -- "$(dirname -- "$0")" && pwd)"
PROJECT_DIR="$(CDPATH= cd -- "$SCRIPT_DIR/.." && pwd)"
DEFAULT_SOURCE_DIR="/home/gamebook/.codex/generated_images/01a19289-b798-7f23-a480-84096c89da41"
SOURCE_DIR="${1:-$DEFAULT_SOURCE_DIR}"
TARGET_DIR="$PROJECT_DIR/books/vaelgard/images"

SOURCE_FILES=(
    "exec-9d0afc69-3f09-4e42-8fad-f76743218369.png"
    "exec-4679e62f-956a-4220-82eb-b50a18eeb8be.png"
    "exec-bd36ac10-80ad-49a1-9478-3a06986bf335.png"
    "exec-a129fd3d-ced0-44ac-b5eb-7bdd36aa7353.png"
    "exec-17e1c5bc-8178-43ad-86c0-471ddb0cb1a4.png"
    "exec-d9aa7b39-e7cf-4dc0-8b48-eda3fcbe9b3e.png"
    "exec-c6181e37-e3f0-48b2-b520-99edae34cbbc.png"
    "exec-2305b5c1-ce41-4ca8-bc6c-52c45b823b77.png"
    "exec-b951d1e5-52ef-4a8c-8a29-586c965ac466.png"
    "exec-fcd4220c-79de-4b92-92c0-71ab5ffb675d.png"
)

if [[ ! -d "$SOURCE_DIR" ]]; then
    echo "Chyba: zdrojový priečinok neexistuje: $SOURCE_DIR" >&2
    exit 1
fi

if [[ ! -d "$TARGET_DIR" ]]; then
    echo "Chyba: cieľový priečinok neexistuje: $TARGET_DIR" >&2
    exit 1
fi

invalid=0
for index in "${!SOURCE_FILES[@]}"; do
    chapter=$(printf '%02d' "$((index + 1))")
    source="$SOURCE_DIR/${SOURCE_FILES[index]}"
    target="$TARGET_DIR/chapter-$chapter.png"

    if [[ ! -f "$source" ]]; then
        echo "Chýba zdrojový súbor: $source" >&2
        invalid=1
    fi
    if [[ -e "$target" ]]; then
        echo "Cieľ už existuje (nič neprepíšem): $target" >&2
        invalid=1
    fi
done

if [[ "$invalid" -ne 0 ]]; then
    echo "Import sa neuskutočnil. Doplň chýbajúce súbory alebo premenuj existujúce ciele." >&2
    exit 1
fi

for index in "${!SOURCE_FILES[@]}"; do
    chapter=$(printf '%02d' "$((index + 1))")
    source="$SOURCE_DIR/${SOURCE_FILES[index]}"
    target="$TARGET_DIR/chapter-$chapter.png"
    cp -p -- "$source" "$target"
    echo "Skopírované: chapter-$chapter.png"
done

node "$SCRIPT_DIR/update-precache-version.js"
echo "Vaelgard ilustrácie sú pripravené v $TARGET_DIR"
