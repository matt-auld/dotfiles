eval "$(fzf --zsh)"
#source ~/checkout/fzf/shell/key-bindings.zsh
#source ~/checkout/fzf/shell/completion.zsh
export FZF_COMPLETION_OPTS='--border'
export FZF_DEFAULT_COMMAND='fd --type f --strip-cwd-prefix'
export FZF_CTRL_T_COMMAND="$FZF_DEFAULT_COMMAND"

_fzf_compgen_path() {
	fd --hidden --follow . "$1"
}

_fzf_compgen_dir() {
	fd --type d --hidden --follow . "$1"
}
