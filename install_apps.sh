#!/bin/bash
echo 'Process begins...'

echo 'Setting OS X...'
defaults write com.apple.finder AppleShowAllFiles YES
defaults write com.apple.dashboard mcx-disabled -boolean true
defaults write com.apple.dock autohide-delay -float 0
defaults write com.apple.dock autohide-time-modifier -float 0
defaults write com.apple.dock expose-animation-duration -float 0
defaults write -g QLPanelAnimationDuration -float 0
defaults write com.apple.finder DisableAllAnimations -bool true
defaults write com.apple.dock launchanim -bool false
defaults write com.apple.dock expose-animation-duration -float 0
defaults write com.apple.Dock autohide-delay -float 0
defaults write com.apple.dock springboard-columns -int 10 # defaults delete com.apple.dock springboard-rows
defaults write com.apple.dock springboard-rows -int 7 # defaults delete com.apple.dock springboard-columns
defaults write com.apple.screencapture disable-shadow -bool true
defaults write -g NSWindowResizeTime -float 0
defaults write com.apple.desktopservices DSDontWriteNetworkStores true

killall Finder
killall Dock

echo 'Setting vim and bash...'
cp .vimrc ~
cp .bash_profile ~ # for termux: termux-setup-storage and vim ~/../usr/etc/bash.bashrc

echo 'Installing Homebrew...'
/usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"

echo 'Running brew...'
brew tap homebrew/cask-fonts
brew install git
brew install python
brew install coreutils
brew install emojify
brew install macvim
brew install mpv
brew install unrar
brew install pandoc
brew install osx-cpu-temp
brew install cmake
brew install htop
brew install watch # 1st January 1970 watch -n 0.5 date +%s
brew install tldr
brew install pwgen
# brew install leela-zero
# brew install sl
# brew install swi-prolog # swipl to run
# brew install tor
# brew install gnu-go
# brew install ncdu # To see disk space usage
# brew install cmatrix
# brew install rig

# Python
pip3 install virtualenv 
# brew install graph-tool
# brew install jupyter # jupyter notebook
# brew install pyinstaller
# pip(3) install autopep8, pylint, black
# pip(3) install ascii-graph, autokeras, emoji, gomill, h5py, humanize, imageio, isort, jedi, Keras, matplotlib, networkx, numpy, pandas, Pillow, progress, PuLP, pytest, scikit-learn, scipy, seaborn, speedtest-cli, tensorflow, termcolor, tinydb, torch, virtualenv, etc.

# Virtualenv
# virtualenv .venv
# virtualenv -p python3 .venv
# source .venv/bin/activate
# deactivate

# Tor
# Run tor in terminal
# In network preferences, create new location
# Advanced settings, proxies, SOCKS Proxy, localhost:9050

echo 'Runing brew cask...'
brew cask install firefox # HTTPS everywhere, Adblock for Firefox, SAMLtracer, Popup Blocker, LessPass, DuckDuckGo Privacy Essentials, Markdown Here, GitLab Markdown Viewer, Express VPN
brew cask install font-source-sans-pro
brew cask install mpv
brew cask install adobe-acrobat-reader
brew cask install texstudio
brew cask install mactex
brew cask install spectacle
brew cask install discord
brew cask install teamviewer
brew cask install lulu
brew cask install cgoban
brew cask install gopanda
brew cask install libreoffice
brew cask install iterm2
# brew cask install expressvpn
# brew cask install pycharm-ce
# brew cask install intellij-idea-ce

# brew cask install sabaki
# /usr/local/Cellar/leela-zero/0.17/bin/leelaz
# --gtp --resignpct -1 --noponder --playouts 1500 -w /Users/eliekadoche/desktop/documents/deepmind/leela_zero_networks/last_network
# GTP commands: showboard, play black c13, genmove white, etc.

echo 'Please install JDK, Office, PostregeSQL, DocAtor'

echo 'Configuring git'
git config --global user.name "Elie KADOCHE"
git config --global user.email eliekadoche78@gmail.com
git config --global core.editor vim
# git config credential.helper store

echo 'Install Vim Plug'
curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
# Then :PlugInstall
# ./install.py --all in the repo of YouCompleteMe

echo 'End of process'

# Android
#   Termux: git, texlive, tlmgr install scheme-full, python, tor, mpv, sl, zip, unzip, unrar, numpy, etc.
#   + Termux:API
#   Dev: cxxdroid, quickedit pro, total commander, usb stick plugin
#   Baduk: ElyGo, tsumego pro, pandanet, tygem, kgs, Ah Q Go
#   Privacy: firefox, firefox focus, express vpn
#   Communication: discord, facebook, instagram, messenger, linkedin, whastapp, snapchat, reddit
#   Google: gmail, drive, maps, contacts
#   Moving: citymapper
#   System: adobe acrobat reader, calculator++, camscanner, teamviewer, lithium
#   Others: office, leafpic, HandShaker
