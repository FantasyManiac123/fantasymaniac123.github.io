#!/usr/bin/env bash

# Compile the Ink sources consumed by the reader. Override INKLECATE_BIN when
# the executable is not available under the default `inklecate` name.
set -euo pipefail

INKLECATE_BIN="${INKLECATE_BIN:-inklecate}"

if ! command -v "$INKLECATE_BIN" >/dev/null 2>&1; then
    echo "Chyba: Kompilátor Ink 'inklecate' sa nenašiel v PATH." >&2
    echo "Nainštaluj Inklecate alebo nastav INKLECATE_BIN na cestu k nemu." >&2
    exit 127
fi

compile_story() {
    local source="$1"
    local output="${source%.ink}.json"

    echo "Kompilujem ${source} -> ${output}"
    "$INKLECATE_BIN" -o "$output" "$source"
}

compile_story "books/ortheon/story.ink"

for source in books/vaelgard/chapters/*.ink; do
    compile_story "$source"
done

echo "Ink príbehy sú skompilované."
