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
link $DD/lf $C/lf
link $DD/localutils $C/localutils
link $DD/mpv $C/mpv
link $DD/picom $C/picom
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
