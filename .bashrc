# .bashrc

# Source global definitions
if [ -f /etc/bashrc ]; then
	. /etc/bashrc
fi

source /usr/share/git-core/contrib/completion/git-prompt.sh
export PS1='\[\033[01;32m\]\u \w\[\033[01;33m\]$(__git_ps1)\[\033[01;34m\] \$\[\033[00m\] '
export EDITOR=vim
export I915=~/gfx/sources/linux/drivers/gpu/drm/i915

export PATH="~/checkout/smatch/smatch_scripts:$PATH"

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
alias exec="exec "
alias sudo="sudo "
alias tsocks="tsocks "

# git
alias gg="git grep -i -n"
alias gd="git diff --color | diff-so-fancy"

# packages
alias install="sudo dnf -y install"
alias update="sudo dnf -y update"

# build
alias mk="make -j$(getconf _NPROCESSORS_ONLN)"

alias bloat-o-meter="~/gfx/sources/linux/scripts/bloat-o-meter"

# ccache
export CCACHE_DIR="/home/comwa/.ccache"
export CC="ccache gcc"
export CXX="ccache g++"
export PATH="/usr/lib64/ccache:$PATH"

# sessions
alias s-kernel="cd ~/gfx/sources/linux && git f tip && cd $I915"
alias s-go="cd ~/checkout/gocode && source setup-env"
alias s-weechat="ssh comwa@mwahaha-do -t screen -D -RR weechat weechat-curses"
alias s-weechat-otc="ssh comwa@mwahaha-office -t screen -D -RR weechat weechat-curses"
alias s-netconsole="sudo modprobe netconsole netconsole=4444@192.168.0.24/enp0s25,6666@192.168.0.11/e0:3f:49:13:21:47"
alias s-console="sudo systemctl isolate multi-user.target"
alias s-graphical="sudo systemctl isolate graphical.target"
alias s-krita="cd ~/krita && source krita-env && cd src && git f origin && cd .."
alias s-my-eyes="redshift -l 51:0.1&"

# git-send-email
alias trybot-intel-gfx="git send-email --suppress-cc=all --to=intel-gfx-trybot@lists.freedesktop.org"
alias intel-gfx="git send-email --to=intel-gfx@lists.freedesktop.org"

function install-mesa {
	./configure --prefix=/home/comwa/gfx/install --with-dri-drivers=i965
		--enable-gles2 --with-egl-platforms=drm,x11
		--with-gallium-drivers=
	mk && make install
}

function make-indexing {
	make tags cscope
}

function install-kernel {
	# make DOCBOOKS="" htmldocs
	mk
	if [ $? -ne 0 ]; then
		return 1
	fi

	sudo make modules_install
	if [ $? -ne 0 ]; then
		return 1
	fi

	sudo make install
	if [ $? -ne 0 ]; then
		return 1
	fi

	sudo grub2-mkconfig --output=/boot/grub2/grub.cfg
}

function install-krita {
	cmake -DCMAKE_INSTALL_PREFIX=$HOME/krita/install $HOME/krita/src
		-DWITH_GMIC=ON -DCMAKE_BUILD_TYPE=RelWithDebInfo -DPRODUCTSET=ALL
		-DPACKAGERS_BUILD=ON -DBUILD_TESTING=OFF -DKDE4_BUILD_TESTS=OFF
	mk && mk install
}

function init-net-env {
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

#init-net-env

[ -f ~/.fzf.bash ] && source ~/.fzf.bash
