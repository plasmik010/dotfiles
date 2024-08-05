#!/bin/bash

url="https://github.com/neovim/neovim"
[[ -z $tag ]] && tag="stable"

flow=true

[[ -d $git ]] && cd $git || flow=false

if [[ $flow == true && ! -d neovim ]]; then
    git clone $url || flow=false
fi

if [[ $flow == true ]]; then
    # get commit tagged with $tag
    ( cd neovim && git checkout master && git pull && git checkout tags/$tag  ) || flow=false
fi

if [[ $flow == true ]]; then
    cd neovim &&
    # Detect distro
    if type -f pacman &>/dev/null; then
        paclist="base-devel cmake unzip ninja tree-sitter curl"
        sudo pacman -S --needed $paclist || flow=false
    elif type -f apt &>/dev/null; then
        echo Getting deps..
        sudo apt install  build-essential curl autoconf automake cmake g++ libtool libtool-bin ninja-build pkg-config unzip gettext  2>&1 || flow=false
    fi
fi

if !($flow); then echo "Preps FAILED"; exit 1; fi

# exit
make CMAKE_BUILD_TYPE=Release &&
    sudo make install &&
    echo "Build SUCCESS" &&
    sudo ln -sf  /usr/local/bin/nvim /usr/bin/nvim

# vim: sw=4:ts=4:sts=4
