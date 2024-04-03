export EDITOR="gvim -v"

export LANG=en_GB.UTF-8

export XDG_CONFIG_HOME="$HOME/.config"
export ZDOTDIR="$XDG_CONFIG_HOME/zsh"

export HISTFILE="$ZDOTDIR/.zhistory"    # History filepath
export HISTSIZE=10000                   # Maximum events for internal history
export SAVEHIST=10000                   # Maximum events in history file

# ccache
export CCACHE_DIR="$HOME/.ccache"
export CC="ccache clang"
export CXX="ccache clang++"
export PATH="/usr/lib64/ccache:$PATH"

export PATH="$HOME/checkout/fzf/bin:$PATH"
export PATH="$HOME/gfx/sources/maintainer-tools:$PATH"
