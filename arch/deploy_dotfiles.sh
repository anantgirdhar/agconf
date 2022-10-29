#!/bin/bash

DOTFILES_DIR="`pwd`/../dotfiles"
if [ ! -d "$DOTFILES_DIR" ]; then
	echo "ERROR: Dotfiles directory not found."
	exit -1
fi

# Check if application config directory exists
# If not, create it
[ ! -d "$HOME/.config" ] && mkdir $HOME/.config

# Setup most of the dotfiles in ~/.config
destdir=$HOME/.config
for d in `ls -d $DOTFILES_DIR/*/`; do
    # Handle the exceptions separately
    d=$(basename $d)
    [ "$d" = "misc" ] && continue
    [ "$d" = "bash" ] && continue
    [ "$d" = "ssh" ] && continue
    # If the destination directory already exists, remove it
    [ -d "$destdir/$d" ] && rm -rf "$destdir/$d"
    # Create a symlink to the dotfile dir
    ln -s "$DOTFILES_DIR/$d" "$destdir/$d"
done

# Handle the exceptions now

# Setup basic system configs

src=$DOTFILES_DIR/profile
target=$HOME/.profile
[ -f $target ] && rm $target
ln -s $src $target

# Create .zprofile (symlink to .profile)
ln -s $target $HOME/.zprofile

src=$DOTFILES_DIR/bash/bashrc
target=$HOME/.bashrc
[ -f $target ] && rm $target
ln -s $src $target

src=$DOTFILES_DIR/gitconfig
target=$HOME/.gitconfig
[ -f $target ] && rm $target
ln -s $src $target

# Copy ssh config
[ -d $HOME/.ssh ] || mkdir $HOME/.ssh
[ -f $HOME/.ssh/config ] && rm $HOME/.ssh/config
ln -s $DOTFILES_DIR/ssh/config $HOME/.ssh/config

# Fix mouse scrolling
[ -f /etc/X11/xorg.conf.d/40-touchpad.conf ] && \
    mv /etc/X11/xorg.conf.d/40-touchpad.conf /etc/X11/xorg.conf.d/40-touchpad.conf.bk
sudo ln -s $DOTFILES_DIR/misc/40-libinput.conf /etc/X11/xorg.conf.d/40-touchpad.conf
