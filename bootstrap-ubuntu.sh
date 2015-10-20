#!/bin/bash
SETUP_DIR=$(pwd)

# Clean directory structure
cleanDefaultDirectories() {
    mkdir ~/files
    mkdir ~/media
    mkdir ~/code
    mkdir ~/.deb
    mkdir ~/.tmp
    mkdir ~/.git-repos
    mkdir -p ~/code/github

    mv ~/Pictures ~/media/
    mv ~/Music ~/media/
    mv ~/Videos ~/media/
    mv ~/Desktop ~/files/
    mv ~/Documents ~/files/
}

installUbuntuExtras() {
    sudo apt-get update
    sudo apt-get upgrade -y
    sudo apt-get dist-upgrade -y
    sudo apt-get install ubuntu-restricted-extras ubuntu-restricted-addons -y
}

install3rdPartySoftware() {
    # Install chrome
    cd ~/.deb && wget https://dl.google.com/linux/direct/google-chrome-unstable_current_amd64.deb && sudo dpkg -i google-chrome*.deb && cd -
    # Install Skype
    cd ~/.deb && wget http://download.skype.com/linux/skype-ubuntu-precise_4.3.0.37-1_i386.deb && sudo dpkg -i skype-ubuntu*.deb && cd -
    sudo apt-get install gtk2-engines-murrine:i386 gtk2-engines-pixbuf:i386
    sudo apt-get -f install -y
}

addPpaAndInstallAdditionalSoftware() {
    cd $(SETUP_DIR)
    # Add PPA from list
    if [ -f ubuntu/lists/ppas.list ]; then
        while read PPA; do
            sudo apt-add-repository ppa:$PPA -y
        done < ubuntu/lists/ppas.list
    fi
    sudo apt-get update

    # Install packages from list
    if [ -f ubuntu/lists/packages.list ]; then
        while read packages; do
            sudo apt-get install $packages -y
        done < ubuntu/lists/packages.list
    fi

    # Install python packages from list
    if [ -f ubuntu/lists/python-packages.list ]; then
        while read package; do
            sudo pip install $package -y
        done < ubuntu/lists/python-packages.list
    fi
}

cleanDefaultDirectories
installUbuntuExtras
install3rdPartySoftware
addPpaAndInstallAdditionalSoftware

# Clean, Update, Upgrade!
sudo apt-get autoremove -y && sudo apt-get update && sudo apt-get upgrade -y

echo "Setting zsh as default shell, (reboot to see changes)"
chsh -s $(which zsh)
