#!/bin/bash

url="https://github.com/neovim/neovim"

flow=true

[[ -d $git ]] && cd $git || flow=false
if !($flow); then exit 1; fi

if [[ -d neovim ]]; then
    git -C neovim pull || flow=false
else
    git clone $url || flow=false
fi
if !($flow); then exit 1; fi

cd neovim &&
    sudo pacman -S --needed base-devel cmake unzip ninja tree-sitter curl || flow=false
if !($flow); then exit 1; fi

make CMAKE_BUILD_TYPE=Release &&
    sudo make install &&
    sudo ln -sf  /usr/local/bin/nvim /usr/bin/nvim

