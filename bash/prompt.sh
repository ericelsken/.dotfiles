#!/bin/bash

RESET="\[\033[0m\]"
BOLD_BLUE="\[\033[1;34m\]"
BOLD_MAGENTA="\[\033[1;35m\]"
BLUE="\[\033[34m\]"

git_dirty () {
    if [[ "$(git status 2> /dev/null | tail -n 1)" != "nothing to commit"* ]]; then
        echo "*"
    else
        echo " "
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
	local branch="$(git_current_branch)"
	if [[ "${branch}" == "main" || "${branch}" == "master" ]]; then
		printf "\033[1;31m"
	elif [[ "${branch}" = detached* || "${GIT_DIRTY}" == "*" ]]; then
		printf "\033[1;33m"
	elif [[ "${branch}" == "develop" ]]; then
		printf "\033[1;35m"
	else
		printf "\033[32m"
	fi
    echo -n "${branch}" | awk '{if ($1) print " ("$1 ENVIRON["GIT_DIRTY"]")"}'
}

user="${USER}"
if [[ "${user}" == "ericelsken" ]]; then
	user=me
fi

hostname="${HOSTNAME}"
if [[ "${hostname}" == "localhost.localdomain" ]]; then
	hostname=here
fi

userhostname_color="${BLUE}"
if [[ "${user}" != "me" || "${hostname}" != "here" ]]; then
	userhostname_color="${BOLD_MAGENTA}"
fi

PS1="${RESET}${userhostname_color}[${user}@${hostname}]${RESET} ${BOLD_BLUE}\W${RESET}${BLUE}\$(git_prompt) ${BOLD_BLUE}\$${RESET} "
