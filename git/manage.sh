#!/usr/bin/env bash

#the following should be the first content line of the script.
DIR="$(cd -P "$(dirname "$(readlink -f "${BASH_SOURCE[0]}")")" && pwd)"

git config --global commit.template "$DIR/gitmessage"
