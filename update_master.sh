#!/bin/zsh

# Mac OS
brew update
brew upgrade
brew cask upgrade --greedy
softwareupdate --install --all

# Termux
# pkg upgrade
# pkg update

# Global
upgrade_oh_my_zsh
python -m pip install --upgrade pip
pip-review --local --auto
pip install ./lesspass/cli
python ~/.vim/plugged/YouCompleteMe/install.py --all
vim +"PlugUpgrade" +qa
vim +"PlugUpdate" +qa
vim +"PlugClean" +qa
vim +"PlugInstall" +qa
