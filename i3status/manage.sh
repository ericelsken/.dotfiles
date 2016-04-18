#!/bin/bash

DIR="$(cd -P "$(dirname "$(readlink --canonicalize "${BASH_SOURCE[0]}")")" && pwd)"

I3_STATUS_CONFIG_DIR="$HOME/.config/i3status/"
I3_STATUS_CONFIG="$I3_STATUS_CONFIG_DIR/config"

mkdir -p "$I3_STATUS_CONFIG_DIR"

if [ ! -h "$I3_STATUS_CONFIG" ]; then
    ln -fs "$DIR/config" "$I3_STATUS_CONFIG_DIR"
fi
