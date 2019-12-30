#!/bin/bash
# Setup Ubuntu environment
## git, curl, yarn, zsh, oh my zsh

# Update Ubuntu & Packages
if [ $(whoami) = root ]; then
  apt update && apt upgrade -y
else
  sudo apt update && sudo apt upgrade -y
fi

# Install Git
if [ $(whoami) = root ]; then
  apt install git -y
else
  sudo apt install git -y
fi

# Install Curl
if [ $(whoami) = root ]; then
  apt install curl -y
else
  sudo apt install curl -y
fi

# Install Yarn
curl -sS https://dl.yarnpkg.com/debian/pubkey.gpg | sudo apt-key add -
echo "deb https://dl.yarnpkg.com/debian/ stable main" | sudo tee /etc/apt/sources.list.d/yarn.list
if [ $(whoami) = root ]; then
  apt update
  apt install yarn -y
else
  sudo apt update
  sudo apt install yarn -y
fi

# Install, config ZSH & Oh My ZSH
## ZSH & Oh My ZSH Install
if [ $(whoami) = root ]; then
  apt install zsh -y
else
  sudo apt install zsh -y
fi
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
