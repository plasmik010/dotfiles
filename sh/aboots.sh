#!/bin/bash
# Turn current system into handy environment for me!

[[ -z $MYGITDIR ]] && export MYGITDIR=$HOME/gd
echo gitdir $MYGITDIR

suc=false
var='v'
key=''
read_key() {
    echo Press   's' to enter shell , 'q' to exit , 'n' to go to next stage
    read -rsn 1 key
    [[ $key == 'f' ]] && echo key is F
    [[ $key == 'q' ]] && exit
    [[ $key == 'n' ]] && return
    [[ $key == 's' ]] && bash
}
if ($suc) ; then
    echo success
fi

cd

[[ -d Templates ]] && mkdir -p Trashed && mv Documents Music Pictures Public Templates Videos Trashed

mkdir -p $MYGITDIR

sudo pacman -S --needed vifm fzf lsb-release wget ranger fd

sudo pacman -S --needed fzf cmake unzip ninja tree-sitter curl luarocks npm python-pip python-pynvim ripgrep neovim

sudo pacman -S --needed base-devel
if type -f pacman &>/dev/null; then
    if ! type -f pakku &>/dev/null ; then
        cd $MYGITDIR && rm -rf pakku
        git clone https://aur.archlinux.org/pakku.git
        cd pakku
        makepkg -si
    fi
fi

if [[ -d $MYGITDIR/dotfiles ]] ; then
    echo -e '\n'--Gonna update my git repo
    git -C $MYGITDIR/dotfiles/ pull
else
    echo -e '\n'--Gonna clone my git repo
    git clone https://codeberg.org/plasmik/dotfiles $MYGITDIR/dotfiles
fi

(
echo -e '\n'--Gonna create /ln/ and short links there
# exit
sudo -- bash -c "mkdir -p /ln && chown $USER:$USER /ln"
cd /ln
ln -sfn $HOME ho
ln -sfn /ln/ho/.sh sh
mkdir -p /ln/ho/.lo
mkdir -p /ln/ho/.lo/cur
ln -sfn /ln/ho/.lo lo
[ -d mo ] || ln -sn  /mnt mo
ln -sfn /ln/ho/.config co
ln -sfn $git gd
ln -sfn /ln/mo/blink bl
ln -sfn /ln/mo/fast fast
ln -sfn /ln/fast/hh hh
ln -sfn /ln/fast/torrents torrents
# ln -sfn /ln/mo/metal/MUSIC mus
ln -sfn /ln/mo/metal/PRAGS pr
# ln -sfn /ln/mo/blink/dwn dwn
# ln -sfn /ln/ho/Downloads dwn
# ln -sfn /ln/dwn /ln/ho/Downloads
)

(
echo -e '\n'--Gonna link config files
cd
! [[ -L .sh ]] && ln -sn $MYGITDIR/dotfiles/sh .sh

[[ $(bash -c '(unset BASH_IS_PLASMIFIED; source .bashrc; echo $BASH_IS_PLASMIFIED )') != true ]] && NEED_NEW_BASHRC=true
# ( [[ -f .bashrc ]] && ! [[ -L .bashrc ]] ) &&
( [[ -f .bashrc ]] && [[ $NEED_NEW_BASHRC == true ]] ) && {
    echo
    echo --Will move current .bashrc to .bashrc_trash
    echo -e "\n\n----------$(date)-----.bashrc-------------\n\n" >> .bashrc_trash
    cat .bashrc >> .bashrc_trash
    rm .bashrc
}
# echo 
[[ $NEED_NEW_BASHRC == true ]] && echo -e "git=\""$MYGITDIR"\""\\nexport sh=\"\$git/dotfiles/sh\"\\nsource \"\$sh/bashrc_main\" > .bashrc 
# ln -sf .sh/bashrc_main .bashrc
touch -a /ln/lo/cur/bashrc_loc
touch -a /ln/lo/cur/vifmrc_loc
# ln -sf .sh/Xresources .Xresources
# ln -sf .sh/vi/vimrc_main .vimrc
co=$(realpath /ln/co)
mkdir -p "$co"/nvim; # ln -srf .sh/vi/vimrc_main "$co"/nvim/init.vim
mkdir -p "$co"/kitty; ln -srf .sh/conf/kitty.conf "$co"/kitty/
mkdir -p "$co"/tmux; ln -srf .sh/conf/tmux.conf "$co"/tmux/
mkdir -p "$co"/feh; ln -srf .sh/conf/feh.keys "$co"/feh/keys
mkdir -p "$co"/zathura; ln -srf .sh/conf/zathurarc "$co"/zathura/
mkdir -p "$co"/vifm/colors; ln -srf .sh/conf/vifmrc "$co"/vifm/vifmrc
    cp .sh/conf/vifm-colors/*.vifm "$co"/vifm/colors/
mkdir -p "$co"/mpv
    ln -srf .sh/conf/mpv/input.conf "$co"/mpv/
    ln -srf .sh/conf/mpv/mpv.conf "$co"/mpv/
mkdir -p "$co"/deadbeef; cp .sh/conf/deadbeef.config "$co"/deadbeef/config
mkdir -p .local/share/applications/; cp /ln/sh/conf/transmission*desktop .local/share/applications/
#
# xdg-mime default transmission-cli.desktop x-scheme-handler/magnet
# xdg-mime default transmission-cli.desktop application/x-bittorrent
type -f xdg-mime &>/dev/null && {
    xdg-mime default org.qbittorrent.qBittorrent.desktop x-scheme-handler/magnet
    xdg-mime default org.qbittorrent.qBittorrent.desktop application/x-bittorrent
    xdg-mime default FBReader.desktop application/x-mobipocket-ebook
}
#
[[ -d /usr/share/X11/xorg.conf.d ]] && ! [[ -L /usr/share/X11/xorg.conf.d/99-libinput-custom.conf ]] && [[ -d /ln/sh ]] && sudo ln -sf /ln/sh/conf/99-libinput-custom.conf /usr/share/X11/xorg.conf.d/
)

echo -e '\n'--Gonna pull kitty themes
if [[ -d ~/.config/kitty-themes ]] ; then
    #echo
    git -C ~/.config/kitty-themes/ pull
else
    git clone --depth 1 https://github.com/dexpota/kitty-themes.git ~/.config/kitty-themes
fi
mkdir -p $HOME/.config/kitty
cd $HOME/.config/kitty
ln -sfr ../kitty-themes/themes themes
# ln -s themes/Material.conf day_theme.conf
# ln -s themes/nightfox-dusk_kitty.conf nox_theme.conf
! [[ -L day_theme.conf ]] && ln -s themes/gruvbox_light.conf day_theme.conf
! [[ -L nox_theme.conf ]] && ln -s themes/gruvbox_dark.conf  nox_theme.conf
! [[ -f current-theme.conf ]] && ln -s themes/gruvbox_dark.conf current-theme.conf

[[ -z $sh ]] && export sh=$

cd

