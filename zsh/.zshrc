source $XDG_CONFIG_HOME/aliases

if [ -n "${ZSH_PRIV_PROFILE}" ]; then
	source $XDG_CONFIG_HOME/aliases-priv
	source $ZDOTDIR/netenv-priv.zsh
fi

setopt HIST_IGNORE_DUPS
setopt HIST_IGNORE_ALL_DUPS

bindkey -v
export KEYTIMEOUT=1

setopt interactivecomments

autoload -U compinit; compinit

autoload -Uz edit-command-line
zle -N edit-command-line
bindkey -M vicmd v edit-command-line

source $ZDOTDIR/completion.zsh
source $ZDOTDIR/fzf.zsh
source $ZDOTDIR/misc.zsh
source $ZDOTDIR/shell-prompt.zsh
source $ZDOTDIR/plugins/zsh-bd/bd.zsh

source /usr/share/zsh-autosuggestions/zsh-autosuggestions.zsh
export ZSH_AUTOSUGGEST_HIGHLIGHT_STYLE="fg=#624F4F"

source /usr/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
