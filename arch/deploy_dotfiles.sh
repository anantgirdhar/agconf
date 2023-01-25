#!/bin/bash

source ../deploy_dotfiles_helper.sh

# Create some aliases to reduce typing in the following commands
# Most dotifles should end up in ~/.config
DD="$DOTFILES_DIR"
C="$HOME/.config"

# Link the required config files in the right places
link $DD/aliases $C/aliases
link $DD/awesome $C/awesome
link $DD/bash/bashrc $HOME/.bashrc
link $DD/calcurse $C/calcurse
link $DD/clarence $C/clarence
link $DD/dunst $C/dunst
link $DD/eduroam_ca.pem $C/eduroam_ca.pem
link $DD/fontconfig $C/fontconfig
link $DD/i3 $C/i3
link $DD/lf $C/lf
link $DD/localutils $C/localutils
link $DD/mpv $C/mpv
link $DD/npm $C/npm
link $DD/picom $C/picom
link $DD/profile $HOME/.profile
link $HOME/.profile $HOME/.zprofile
link $DD/qutebrowser $C/qutebrowser
link $DD/ranger $C/ranger
link $DD/stnote $C/stnote
link $DD/sxhkd $C/sxhkd
link $DD/vim $C/vim
link $DD/wgetrc $C/wgetrc
link $DD/X11 $C/X11
link $DD/zathura $C/zathura
link $DD/zsh $C/zsh
