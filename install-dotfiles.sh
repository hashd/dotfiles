#!/bin/bash
dir=~/.dotfiles
olddir=~/.backup.dotfiles

install_zsh () {
# Test to see if zshell is installed.  If it is:
if [ -f /bin/zsh -o -f /usr/bin/zsh ]; then
    # Clone my oh-my-zsh repository from GitHub only if it isn't already present
    if [[ ! -d $dir/oh-my-zsh/ ]]; then
        git clone http://github.com/robbyrussell/oh-my-zsh.git
    fi
    # Set the default shell to zsh if it isn't currently set to zsh
    if [[ ! $(echo $SHELL) == $(which zsh) ]]; then
        chsh -s $(which zsh)
    fi
else
    # If zsh isn't installed, get the platform of the current machine
    platform=$(uname);
    # If the platform is Linux, try an apt-get to install zsh and then recurse
    if [[ $platform == 'Linux' ]]; then
        sudo apt-get install zsh
        install_zsh
    # If the platform is OS X, tell the user to install zsh :)
    elif [[ $platform == 'Darwin' ]]; then
        echo "Please install zsh, then re-run this script!"
        exit
    fi
fi
}

install_vundle () {
if [ -f /bin/git -o -f /usr/bin/git ]; then
    if [[ ! -d $dir/vim/bundle/Vundle.vim ]]; then
        git clone https://github.com/gmarik/Vundle.vim.git $dir/vim/bundle/Vundle.vim
    fi
else
    platform=$(uname);
    if [[ $platform == 'Linux' ]]; then
        sudo apt-get install git
        install_vundle
    fi
fi
}

install_vundle
vim +PluginInstall +qall
install_zsh

# files to backup and symlink
files="bashrc vimrc vim zshrc oh-my-zsh zsh tmux.conf gitconfig"

# create backup folder for any old files
echo "Creating $olddir for backup of any existing dotfiles in ~"
mkdir -p $olddir
echo "...done"

# change to the dotfiles directory
echo "Changing to the $dir directory"
cd $dir
echo "...done"

for file in $files; do
    echo "Moving any existing dotfiles from ~ to $olddir"
    mv ~/.$file $olddir/
    echo "Creating symlink to $file in home directory."
    ln -s $dir/$file ~/.$file
done

