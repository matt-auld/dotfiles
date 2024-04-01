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
	PROMPT=' %B%F{#928374}@9¾%f%b %5~%B%F{#FF007F}$(git_branch_name)%f%F{#A0A0A0} >%f%b '
	RPROMPT='%B%1(j.•.)%b'
}

init_prompt
