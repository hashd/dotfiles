SETUP_DIR=$(pwd)

# Clean directory structure
cd ~
mkdir Files
mkdir Media
mkdir Other
mkdir Sync
mkdir Workspace
mkdir .deb
mkdir -p Workspace/Backyard
mkdir -p Workspace/Github
mkdir -p Workspace/Whiteboard
mkdir -p Files/eBooks
mkdir -p Files/Notes
mkdir -p Workspace/Tools
mkdir -p Sync/Google-Drive

mv ~/Pictures ~/Media/
mv ~/Music ~/Media/
mv ~/Videos ~/Media/
mv ~/Desktop ~/Files/
mv ~/Documents ~/Files/
mv ~/Templates ~/Other/
mv ~/Public ~/Other/

sudo apt-get update
sudo apt-get upgrade -y
sudo apt-get install ubuntu-restricted-extras -y

# Install chrome
cd ~/.deb && wget https://dl.google.com/linux/direct/google-chrome-unstable_current_amd64.deb && sudo dpkg -i google-chrome*.deb && cd ~
# Install Skype
cd ~/.deb && wget http://download.skype.com/linux/skype-ubuntu-precise_4.3.0.37-1_i386.deb && sudo dpkg -i skype-ubuntu*.deb && cd ~
sudo apt-get install gtk2-engines-murrine:i386 gtk2-engines-pixbuf:i386
sudo apt-get -f install -y

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

# Clean, Update, Upgrade!
sudo apt-get autoremove -y && sudo apt-get update && sudo apt-get upgrade -y
