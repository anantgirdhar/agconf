#!/bin/sh

# Setup system folders

DOWNLOADS="$HOME/dl"
DOCUMENTS="$HOME/docs"
PICTURES="$HOME/pics"

[ ! -d "$DOWNLOADS" ] && mkdir "$DOWNLOADS"
[ ! -d "$DOCUMENTS" ] && mkdir "$DOCUMENTS"
[ ! -d "$PICTURES" ] && mkdir "$PICTURES"

# Create vim directories
mkdir -p $HOME/.cache/vim/{backup,swap}

# Create custom XDG user directories and remove the regular ones
mkdir -p $HOME/.local/ubuntu_dirs/{desktop,templates,public,music,videos}
mkdir $HOME/{dl,docs,pictures}
rmdir $HOME/{Desktop,Documents,Downloads,Music,Pictures,Public,Templates,Videos}

# Change shell to zsh
chsh -s /usr/bin/zsh

# Create a media directory for external drives to be mounted to
# Then chown the directory to the current user (but ask them which group they want)
user=$(whoami)
MEDIADIR="/media/$user"
echo "Creating media directory: $MEDIADIR"
echo "Current user: $user"
echo "Groups: $(groups)"
echo -n "Which group do you want to own the media directory: "
read group
[ ! -d /media ] && sudo mkdir /media
if [ ! -d "$MEDIADIR" ]; then
    sudo mkdir "$MEDIADIR"
    sudo chown -R $user:$group "$MEDIADIR"
fi
