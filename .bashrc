# .bashrc

# Source global definitions
if [[ -f /etc/bashrc ]]; then
	source /etc/bashrc
fi

bashrc_file="${HOME}/.config/bash/bashrc"
if [[ -f "${bashrc_file}" ]]; then
	source "${bashrc_file}"
else
	echo >&2 ".bashrc could not find ${bashrc_file}"
fi
unset bashrc_file

