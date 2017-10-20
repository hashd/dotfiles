dotfiles
========

my Customized dot files for various linux tools

#### Steps to import dotfiles:

**Required**

	git zsh

Clone the repository into ~/.dotfiles.

```
chmod +x install-dotfiles.sh
./install-dotfiles.sh
```

Previous files are backed up in ~/.backup.dotfiles/

#### Bootstrap Scripts

##### MacOSX
Bootstrap OSX by running the script at `bootstraps/osx.sh`

From within the dotfiles folder
``` shell
./bootstraps/osx.sh
```

###### Ubuntu
Bootstrap Ubuntu 17.10 by running the script at `bootstraps/ubuntu.sh`

From within the dotfiles folder
``` shell
./bootstraps/ubuntu.sh
```
