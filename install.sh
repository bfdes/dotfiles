#!/bin/sh

# Dock
echo "Simplifying the Dock"

echo "> Showing Dock on hover only"
defaults write com.apple.dock autohide -bool true

echo "> Minimising windows using scale effect"
defaults write com.apple.dock mineffect -string "scale"

echo "> Removing recent applications pane"
defaults write com.apple.dock show-recents -bool false

echo "Restarting Dock"
killall Dock

# Terminal
echo "Customizing Terminal"

echo "> Changing computer and host name"
sudo scutil --set ComputerName "MBP"
sudo scutil --set LocalHostName "MBP"
sudo scutil --set HostName "MBP"

touch ~/.hushlogin

echo "> Removing host and directory from prompt"
cp .zshrc ~/.zshrc

# Development primitives
echo "Installing software"

echo "> Installing XCode CLI tools"
xcode-select --install

echo "> Updating App Store apps"
sudo softwareupdate -i -a

echo "> Installing NVM for NodeJS package management"
curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.39.2/install.sh | bash

echo "> Installing Homebrew package manager"
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install.sh)"
brew analytics off

echo "> Intalling GUI applications using Homebrew Cask"
brew install jetbrains-toolbox google-chrome firefox visual-studio-code docker --cask

echo "> Installing SDKMAN!"
curl -s https://get.sdkman.io | bash

echo "> Installing golang"
brew install golang

echo "> Installing SBT for Scala development"
brew install sbt

# echo "Generating SSH keys"
# ssh-keygen -t rsa -b 4096
# eval "$(ssh-agent -s)"
# mv .ssh/config ~/.ssh/config
# ssh-add --apple-use-keychain ~/.ssh/id_rsa

# Git profile
git config --global user.name "Bruno Fernandes"
git config --global user.email "bfdes@users.noreply.github.com"
git config --global user.defaultBranch "master"

echo "Please restart Terminal :)"
