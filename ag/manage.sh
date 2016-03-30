#!/bin/bash

DIR="$(cd -P "$(dirname "$(readlink --canonicalize "${BASH_SOURCE[0]}")")" && pwd)"

AG_CONFIG_DIR="$HOME"
AG_CONFIG="$AG_CONFIG_DIR/.agignore"

mkdir -p "$AG_CONFIG_DIR"

if [ ! -h "$AG_CONFIG" ]; then
    ln -fs "$DIR/.agignore" "$AG_CONFIG_DIR"
fi
