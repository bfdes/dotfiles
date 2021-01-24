#!/bin/sh

# Dock
echo "Simplifying the Dock"

echo "> Showing Dock on hover only"
defaults write com.apple.dock autohide -bool true

echo "> Minimising windows using scale effect"
defaults write com.apple.dock mineffect -string "scale"

echo "> Removing recent applications pane"
defaults write com.apple.dock show-recents -bool false

echo "> Magnifies dock icons on hover"
defaults write com.apple.dock minimize-to-application -bool true

echo "Restarting Dock"
killall Dock

# Terminal
echo "Customizing Terminal"

echo "> Changing computer and host name"
sudo scutil --set ComputerName "rMBA"
sudo scutil --set LocalHostName "rMBA"
sudo scutil --set HostName "rMBA"

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
curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.37.0/install.sh | zsh

echo "> Installing Homebrew package manager"
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install.sh)"
brew analytics off

echo "> Intalling GUI applications using Homebrew Cask"
brew install jetbrains-toolbox google-chrome visual-studio-code docker --cask

echo "> Installing OpenJDK 8"
brew tap adoptopenjdk/openjdk
brew install adoptopenjdk8  --cask # for Scala compatibility

echo "> Installing golang"
brew install golang

echo "> Installing SBT for Scala development"
brew install sbt

# echo "Generating SSH keys"
# ssh-keygen -t rsa -b 4096
# eval "$(ssh-agent -s)"
# mv .ssh/config ~/.ssh/config
# ssh-add -K ~/.ssh/id_rsa

# Sets up Git username and email
git config --global user.name "Bruno Fernandes"
git config --global user.email "bfdes@users.noreply.github.com"

echo "Please restart Terminal :)"
