git_branch_name() {
	branch=$(git branch --show-current 2> /dev/null)
        if [ $? -ne 0 ]; then
		:
	elif [[ $branch != "" ]]; then
		echo ' {'$branch'}'
	else
		echo ' {'$(git rev-parse --short HEAD)'}'
	fi
}

init_prompt() {

	setopt prompt_subst
	PROMPT=' %B%F{#928374}@9¾%f%b %5~'
	PROMPT+='%B%F{#FF007F}$(git_branch_name)%f '
	PROMPT+='>%f%b '

	RPROMPT='%B%0(?..%148(?..(%?%)))%b'

	if [ -n "${SSH_CLIENT}" ]; then
		RPROMPT+='(S)'
	fi

	RPROMPT+=' %B%F{#928374}%1(j.•. )%f%b'
}

init_prompt
