#!/bin/bash

git_dirty () {
    if [[ "$(git status 2> /dev/null | tail -n 1)" != "nothing to commit"* ]]; then
        echo "*"
    fi
}

git_current_branch () {
    branch="$(git branch --no-color 2> /dev/null | awk '/^\* /{print substr($0, 3)}')"
    if [[ "$branch" == "("*")" ]]; then
        branch="detached:$(git name-rev --name-only HEAD 2> /dev/null)"
    elif [[ ! -z "$branch" ]]; then
        branch="$(echo "$branch" | awk '{printf "%s", substr($0, 1, 10); if (length($0) > 10) printf ".."}')"
    fi
    echo "$branch"
}

git_prompt () {
    export GIT_DIRTY=$(git_dirty)
    git_current_branch | awk '{if ($1) print " ("$1 ENVIRON["GIT_DIRTY"]")"}'
}

PS1="\[\033[1;34m\][\u@\h] \W\[\033[0;34m\]\$(git_prompt) \[\033[1;34m\]\$\[\033[00m\] "
