#!/bin/bash

DOTFILES_DIR=$(realpath `pwd`/../dotfiles)
if [ ! -d "$DOTFILES_DIR" ]; then
    echo "ERROR: Dotfiles directory not found."
    exit -1
fi

# Check if application config directory exists
# If not, create it
[ ! -d "$HOME/.config" ] && mkdir $HOME/.config

# Create a convenience function to setup the dotfiles
link() {
    src="$1"
    target="$2"
    # If the destination is a link and points to the source, we're done
    if [ -L "$target" ] && [ $(realpath $(readlink "$target")) = $(realpath "$src") ]; then
        echo "$target already pointing to something. Skipping."
        return
    elif [ -f "$target" ]; then
        echo "Removing file $target"
        rm "$target"
    elif [ -d "$target" ]; then
        echo "Removing directory $target"
        rm -rf "$target"
    fi
    echo "Linking $target to $src"
    ln -s "$src" "$target"
}

# Create some aliases to reduce typing in the following commands
# Most dotifles should end up in ~/.config
DD="$DOTFILES_DIR"
C="$HOME/.config"

# Link the required config files in the right places
link $DD/aliases $HOME/.aliases
link $DD/awesome $C/awesome
link $DD/bash/bashrc $HOME/.bashrc
link $DD/calcurse $C/calcurse
link $DD/lf $C/lf
link $DD/localutils $C/localutils
link $DD/mpv $C/mpv
link $DD/profile $HOME/.profile
link $HOME/.profile $HOME/.zprofile
link $DD/qutebrowser $C/qutebrowser
link $DD/ranger $C/ranger
link $DD/stnote $C/stnote
link $DD/sxhkd $C/sxhkd
link $DD/user-dirs.dirs $C/user-dirs.dirs
link $DD/user-dirs.locale $C/user-dirs.locale
link $DD/vim $C/vim
link $DD/wgetrc $C/.wgetrc
link $DD/zathura $C/zathura
link $DD/zsh $C/zsh
