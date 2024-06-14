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
    sudo pacman -S --needed base-devel cmake unzip ninja tree-sitter curl || flow=false
fi

if !($flow); then echo "Preps FAILED"; exit 1; fi

make CMAKE_BUILD_TYPE=Release &&
    sudo make install &&
    echo "Build SUCCESS" &&
    sudo ln -sf  /usr/local/bin/nvim /usr/bin/nvim

