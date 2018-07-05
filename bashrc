#!/bin/bash

#The following should be the first content line of the script.
#after the following line, DIR conatins the absolute path to the directory in which this script is located.
#it is not required, but highly recommneded to have all remaining aspects of this script be relative to DIR.
DIR="$(cd -P "$(dirname "$(readlink --canonicalize "${BASH_SOURCE[0]}")")" && pwd)"

export EDITOR="vim"
export PATH="$PATH:$DIR/bin:$HOME/.bin"

#source .sh files in the directories listed in the following array.
scriptDirPaths=("bash" "self")
for dirName in ${scriptDirPaths[@]}; do
    if [ -d "$DIR/$dirName" ]; then
        #because DIR is absolute, filePath will be absolute, thus the source line.
        for filePath in $(find "$DIR/$dirName" -name "*.sh"); do
            source "$filePath"
        done
    fi
done

if [ -n "$DISPLAY" -a "$TERM" == "xterm" ]; then
	export TERM="xterm-256color"
fi
