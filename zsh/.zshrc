source $XDG_CONFIG_HOME/aliases

if [ -n "${ZSH_PRIV_PROFILE=+1}" ]; then
	source $XDG_CONFIG_HOME/aliases-priv
	source $ZDOTDIR/netenv-priv.zsh
fi

bindkey -v
export KEYTIMEOUT=1

autoload -U compinit; compinit
_comp_options+=(globdots)
setopt MENU_COMPLETE
zstyle ':completion:*' menu select

source $ZDOTDIR/fzf.zsh
source $ZDOTDIR/misc.zsh
source $ZDOTDIR/shell-prompt.zsh
source $ZDOTDIR/plugins/zsh-bd/bd.zsh

source /usr/share/zsh-autosuggestions/zsh-autosuggestions.zsh
export ZSH_AUTOSUGGEST_HIGHLIGHT_STYLE="fg=#624F4F"

source /usr/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
