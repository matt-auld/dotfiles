run() {
    number=$1
    shift
    for i in `seq $number`; do
      $@
    done
}

install-kernel() {
        # make DOCBOOKS="" htmldocs
        make prepare
        if [ $? -ne 0 ]; then
                return 1
        fi

        make scripts
        if [ $? -ne 0 ]; then
                return 1
        fi

        bmk
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

function gl() {
        git log --max-count=10000 --graph --color --format='%C(red)%h %Creset%s %C(green)(%cr)%C(red)%d%Creset %C(bold)%an%Creset' $1 | fzf \
          -e \
          --ansi \
          --color=light \
          --reverse \
          --no-sort \
          --preview-window=hidden \
          --preview='
            hash=$(echo {} | grep -o "[a-f0-9]*" | sed -n "1p") \
            && [[ $hash != "" ]] \
            && git show --color $hash | diff-so-fancy
            ' \
          --bind='enter:execute(
            hash=$(echo {} | grep -o "[a-f0-9]*" | sed -n "1p") \
            && [[ $hash != "" ]] \
            && sh -c "git show $hash | diff-so-fancy | less -R"
            )' \
          --bind='alt-c:execute(
            hash=$(echo {} | grep -o "[a-f0-9]*" | sed -n "1p") \
            && [[ $hash != "" ]] \
            && git checkout $hash
            )+abort' \
          --bind='alt-r:execute(
            hash=$(echo {} | grep -o "[a-f0-9]*" | sed -n "1p") \
            && [[ $hash != "" ]] \
            && git reset $hash
            )+abort' \
          --bind='alt-i:execute(
            hash=$(echo {} | grep -o "[a-f0-9]*" | sed -n "1p") \
            && [[ $hash != "" ]] \
            && git rebase -i $hash
            )+abort' \
          --bind='alt-p:toggle-preview' \
          --bind='alt-h:toggle-header' \
          --header-first \
          --header '
          > ENTER | <show>
          > ALT-C | <checkout> the commit
          > ALT-R | <reset> to the commit
          > ALT-I | <rebase -i> from the commit'
}

function gb() {
        git branch | fzf \
          --ansi \
          --color=light \
          --reverse \
          --no-sort \
          --preview='git log {-1} --max-count=100 --graph --color --format="%C(red)%h %Creset%s %C(green)(%cr)%C(red)%d%Creset %C(bold)%an%Creset"' \
          --bind='enter:execute(
            git switch {-1}
            )+abort' \
          --header '
          > ENTER | <switch> to the branch'
}
