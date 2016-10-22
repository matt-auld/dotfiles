# .bashrc

# Source global definitions
if [ -f /etc/bashrc ]; then
	. /etc/bashrc
fi

source /usr/share/git-core/contrib/completion/git-prompt.sh
export PS1='\[\033[01;32m\]\u \w\[\033[01;33m\]$(__git_ps1)\[\033[01;34m\] \$\[\033[00m\] '
export EDITOR=vim
export I915=~/gfx/sources/linux/drivers/gpu/drm/i915

# Uncomment the following line if you don't like systemctl's auto-paging feature:
# export SYSTEMD_PAGER=

# aliases
alias g="git"
alias l="ls -l"
alias la="ls -la"
alias v="gvim -v"
alias vimrc="v ~/.vimrc"
alias bashrc="v ~/.bashrc"
alias muttrc="v ~/.muttrc"

# git
alias gg="git grep -i -n"
alias gd="git diff --color | diff-so-fancy"

# packages
alias install="sudo dnf -y install"
alias update="sudo dnf -y update"

# build
alias mk="make -j$(getconf _NPROCESSORS_ONLN)"
alias install-kernel="mk W=1 C=1 && sudo make modules_install && sudo make install && sudo grub2-mkconfig --output=/boot/grub2/grub.cfg"
alias install-mesa="./configure --prefix=/home/comwa/gfx/install --with-dri-drivers=i965 --enable-gles2 --with-egl-platforms=drm,x11 --with-gallium-drivers= && mk && make install"

# sessions
alias s-kernel="cd ~/gfx/sources/linux && git fetch nightly && cd $I915"
alias s-go="cd ~/checkout/gocode && source setup-env"
alias s-weechat="ssh comwa@mwahaha -t screen -D -RR weechat weechat-curses"

# git-send-email
alias trybot-intel-gfx="git send-email --suppress-cc=all --to=intel-gfx-trybot@lists.freedesktop.org"
alias intel-gfx="git send-email --to=intel-gfx@lists.freedesktop.org"

function init_net_env {
	if hostname -I | grep 10.*.*.* > /dev/null; then
		source ~/.netenv
	else
		unset GIT_PROXY_COMMAND
		unset ftp_proxy
		unset http_proxy
		unset https_proxy
		unset no_proxy
		unset socks_proxy
	fi
}

init_net_env
