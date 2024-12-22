#!/bin/bash
_dock() {
	local containers
	containers=$(docker ps -a --format '{{.ID}} {{.Names}}')

	local current_command="${COMP_WORDS[1]}"
	#local current_arg="${COMP_WORDS[2]}"

	if [[ $current_command == "cp" ]]; then
		COMPREPLY=( $(compgen -W "$containers" -- "${1:-}") )
		return 0
	elif [[ $current_command == "start" ]]; then
		COMPREPLY=( $(compgen -W "$containers" -- "${2:-}") )
		return 0
	fi
}

complete -o nospace -F _dock docker
