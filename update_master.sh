#!/bin/zsh

# Mac OS
brew update
brew upgrade
brew cleanup
brew cask upgrade --greedy
softwareupdate --install --all

# Termux
# pkg upgrade
# pkg update

# Global
upgrade_oh_my_zsh
python3 -m pip install --upgrade pip
pip-review --local --auto
python3 -m pip install ./lesspass/cli
python3 ~/.vim/plugged/YouCompleteMe/install.py --all
vim +"PlugUpgrade" +qa
vim +"PlugUpdate" +qa
vim +"PlugClean" +qa
vim +"PlugInstall" +qa
