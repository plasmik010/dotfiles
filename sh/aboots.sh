#!/bin/bash
# Turn current system into handy environment for me!

[[ -z $MYGITDIR ]] && export MYGITDIR=$HOME/g
echo gitdir $MYGITDIR
dots=$MYGITDIR/dotfiles
echo local dots $dots

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
if ($suc); then
    echo success
fi

cd

[[ -d Templates ]] && mkdir -p Trashed && mv Documents Music Pictures Public Templates Videos Trashed

mkdir -p $MYGITDIR

# Detect distro
if type -f pacman &>/dev/null; then
    DIS_ARCH=true
    function instal {
        echo -- Gonna install  "$*"  at this Arch Linux
        sudo pacman -S --needed --noconfirm $* 2>&1 | grep -v "skipping"
    }
elif type -f apt &>/dev/null; then
    DIS_DEB=true
    function instal {
        echo -- Gonna install  $*  at this Deb- Linux
        sudo apt install  $* 2>&1
    }
fi

paclist1="vifm lsb-release wget ranger"
paclist2="cmake unzip curl luarocks npm ripgrep neovim"
if [[ $DIS_ARCH == true ]]; then
    paclist3="mlocate fd ninja python-pip python-pynvim"
elif [[ $DIS_DEB == true ]]; then
    paclist3="plocate fd-find ninja-build pipx python3-pip python3-pynvim ruby-dev"
    paclist4="build-essential dmenu rofi wmctrl xdotool vim-gtk3 kitty pavucontrol htop btop vifm fdisk gparted nnn thunar bash-completion plocate sxhkd fonts-hack ncdu xclip zathura zathura-djvu gitg mpv xinput feh rsync inxi lshw mediainfo ripgrep silversearcher-ag libnotify-bin imagemagick efibootmgr unrar git make cmake curl zstd zip gparted strace speedcrunch udevil qalc qemu-system fd-find python3-neovim nitrogen lxappearance dunst tmux tmuxp rfkill ncal cpupower-gui picom scrot cpulimit fonts-firacode redshift python-is-python3 fonts-terminus fonts-liberation earlyoom unzip evince testdisk hardinfo nomacs "
    paclist5="fonts-terminus fonts-liberation fonts-noto fonts-dejavu fonts-firacode"
fi

#sudo pacman -S --needed $paclist1 2>&1 | grep -v "skipping"
#sudo pacman -S --needed $paclist2 2>&1 | grep -v "skipping"
instal $paclist1
instal $paclist2
instal $paclist3
[[ -n $paclist4 ]] && instal $paclist4
[[ -n $paclist5 ]] && instal $paclist5

# tree-sitter

if type -f pacman &>/dev/null; then
    #sudo pacman -S --needed base-devel  2>&1 | grep -v "skipping"
    instal base-devel
    if ! type -f pakku &>/dev/null ; then
        cd $MYGITDIR && rm -rf pakku
        git clone https://aur.archlinux.org/pakku.git
        cd pakku
        makepkg -si
    fi
fi

if [[ -d $dots ]] ; then
    echo -e '\n'--Gonna update my git repo
    git -C $dots/ pull
else
    echo -e '\n'--Gonna clone my git repo
    git clone https://codeberg.org/plasmik/dotfiles $dots
fi

(
! [[ -L $HOME/.sh ]] && echo -e '\n'--Gonna link $HOME/.sh/ && ln -sn $dots/sh .sh

echo -e '\n'--Gonna create /ln/ and short links there

sudo -- bash -c "mkdir -p /ln && chown $USER:$USER /ln"
cd /ln
ln -sfn $HOME ho
ln -sfn /ln/ho/.sh sh
mkdir -p /ln/ho/.lo
mkdir -p /ln/ho/.lo/cur
ln -sfn /ln/ho/.lo lo
[ -d mo ] || ln -sn  /mnt mo
[ -d gd ] || ln -sn $git gd
ln -sfn /ln/ho/.config co
ln -sfn /ln/gd/dotfiles dots
ln -sfn /ln/gd/dotfiles/vi vi
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

[[ $(bash -c '(unset BASH_IS_PLASMIFIED; source .bashrc; echo $BASH_IS_PLASMIFIED )') != true ]] && NEED_NEW_BASHRC=true
# ( [[ -f .bashrc ]] && ! [[ -L .bashrc ]] ) &&
( [[ -f .bashrc ]] && [[ $NEED_NEW_BASHRC == true ]] ) && {
    echo
    echo --Will move current .bashrc to .bashrc_trash
    echo -e "\n\n----------$(date)-----.bashrc-------------\n\n" >> .bashrc_trash
    cat .bashrc >> .bashrc_trash
    rm .bashrc
}

[[ $NEED_NEW_BASHRC == true ]] && echo -e "export git=\""$MYGITDIR"\""\\nexport sh=\"\$git/dotfiles/sh\"\\nsource \"\$sh/bashrc_main\" > .bashrc 
# ln -sf .sh/bashrc_main .bashrc
touch -a /ln/lo/cur/bashrc_loc
touch -a /ln/lo/cur/vifmrc_loc
ln -sf .sh/Xresources .Xresources
# ln -sf .sh/vi/vimrc_main .vimrc

co=$(realpath /ln/co)
mkdir -p "$co"/nvim; # ln -srf .sh/vi/vimrc_main "$co"/nvim/init.vim
mkdir -p "$co"/kitty; ln -srf $dots/conf/kitty.conf "$co"/kitty/
mkdir -p "$co"/tmux; ln -srf $dots/conf/tmux.conf "$co"/tmux/
mkdir -p "$co"/feh; ln -srf $dots/conf/feh.keys "$co"/feh/keys
mkdir -p "$co"/zathura; ln -srf $dots/conf/zathurarc "$co"/zathura/
mkdir -p "$co"/vifm/colors; ln -srf $dots/conf/vifmrc "$co"/vifm/vifmrc
    cp $dots/conf/vifm-colors/*.vifm "$co"/vifm/colors/
mkdir -p "$co"/mpv
    ln -srf $dots/conf/mpv/input.conf "$co"/mpv/
    ln -srf $dots/conf/mpv/mpv.conf "$co"/mpv/
mkdir -p "$co"/deadbeef; cp $dots/conf/deadbeef.config "$co"/deadbeef/config
mkdir -p .local/share/applications/; cp $dots/conf/transmission*desktop .local/share/applications/
#
# xdg-mime default transmission-cli.desktop x-scheme-handler/magnet
# xdg-mime default transmission-cli.desktop application/x-bittorrent
type -f xdg-mime &>/dev/null && {
    xdg-mime default org.qbittorrent.qBittorrent.desktop x-scheme-handler/magnet
    xdg-mime default org.qbittorrent.qBittorrent.desktop application/x-bittorrent
    xdg-mime default FBReader.desktop application/x-mobipocket-ebook
}
#
[[ -d /usr/share/X11/xorg.conf.d ]] && [[ -d $sh ]] && sudo ln -sf $dots/conf/98-libinput-custom.conf /usr/share/X11/xorg.conf.d/
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

[[ -z $sh ]] && export sh=$dots/sh

cd

