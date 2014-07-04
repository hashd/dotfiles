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

cd ~/.deb && wget https://dl.google.com/linux/direct/google-chrome-unstable_current_amd64.deb && sudo dpkg -i google-chrome*.deb && cd ~
sudo apt-get -f install -y

if [[ -f ubuntu/ppas.list ]]; then
    while read PPA; do
        sudo apt-add-repository ppa:$PPA -y
    done < ubuntu/ppas.list
fi
sudo apt-get update

if [[ -f ubuntu/packages.list ]]; then
    while read packages; do
        sudo apt-get install $packages -y
    done < ubuntu/packages.list
fi

# Clean, Update, Upgrade!
sudo apt-get autoremove -y && sudo apt-get update && sudo apt-get upgrade -y