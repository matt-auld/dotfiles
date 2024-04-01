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
