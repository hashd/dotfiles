#!/bin/bash
function install_essentials() {
  echo "Install XCode Command Line Tools"
  xcode-select --install

  echo "Installing homebrew"
  /usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"

  echo "Installing zsh"
  brew install zsh

  echo "Setting zsh as default shell, provide password if prompted"
  chsh -s /bin/zsh
}

function install_languages() {
  echo "Installing Elixir"
  brew install elixir

  echo "Installing Go version manager"
  zsh < <(curl -s -S -L https://raw.githubusercontent.com/moovweb/gvm/master/binscripts/gvm-installer)
  gvm install go1.4 -B && gvm use go1.4
  gvm install go1.7 && gvm use go1.7 --default
}

install_essentials