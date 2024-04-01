export XDG_CONFIG_HOME="$HOME/.config"
export ZDOTDIR="$XDG_CONFIG_HOME/zsh"

export HISTFILE="$ZDOTDIR/.zhistory"    # History filepath
export HISTSIZE=10000                   # Maximum events for internal history
export SAVEHIST=10000                   # Maximum events in history file

# ccache
export CCACHE_DIR="/home/comwa/.ccache"
export CC="ccache gcc"
export CXX="ccache g++"
export PATH="/usr/lib64/ccache:$PATH"
export PATH="$HOME/checkout/fzf/bin:$PATH"
