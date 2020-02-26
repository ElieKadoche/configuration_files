#!/bin/zsh

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

# Homebrew
# ---------------------------
# ---------------------------

echo 'Installing Homebrew...'

/usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"

# Brew
# ---------------------------
# ---------------------------

# To update packages: <brew update & brew upgrade & brew doctor>
# To see top-level packages: <brew leaves>

echo 'Running brew...'

brew tap homebrew/cask-fonts

brew install clang-format
# clang-format -i -style='{IndentWidth: 4}' <file.h>

brew install clinfo # OpenCL info
brew install cmake
brew install cmatrix
brew install coreutils
brew install docker
brew install docker-compose
brew install emojify
brew install gcc
brew install git
brew install gnu-go
brew install graphviz
brew install htop
brew install jupyter
brew install jupyterlab
brew install leela-zero
brew install macvim
brew install mpv
brew install neo4j
brew install ncdu
brew install osx-cpu-temp
brew install pandoc
brew install pyinstaller

brew install python
pip3 install -r requirements.txt
# pip-review --local --interactive # To update all pip packages
# virtualenv .venv / virtualenv -p python3 .venv / source .venv/bin/activate /deactivate

brew install pwgen
brew install sshfs
brew install swi-prolog
brew install tldr

brew install tor
# Run tor in terminal. In network prefecerences, create new location, advanced settings, proxies, SOCKS Proxy, localhost:9050

brew install unrar
brew install watch # 1st January 1970 <watch -n0.1 date +%s>
brew install wget
brew install youtube-dl

# Brew cask
# ---------------------------
# ---------------------------

# To update packages: <brew cask upgrade --greedy>

echo 'Runing brew cask...'

brew cask install adobe-acrobat-reader
brew cask install android-file-transfer
brew cask install cgoban
brew cask install cloudcompare
brew cask install discord
brew cask install firefox # HTTPS everywhere, Adblock for Firefox, SAMLtracer, Popup Blocker, LessPass, Markdown Here, GitLab Markdown Viewer
brew cask install flash-player
brew cask install font-source-sans-pro
brew cask install gopanda
brew cask install intellij-idea-ce
brew cask install libreoffice
brew cask install lulu
brew cask install mactex
brew cask install macvim
brew cask install mpv
brew cask install osxfuse
brew cask install postgres
brew cask install pycharm-ce

brew cask install sabaki
# GTP commands: showboard, play black c13, genmove white, etc.
# /usr/local/Cellar/leela-zero/0.17/bin/leelaz
# --gtp --noponder --playouts 128 -w /Users/eliekadoche/desktop/documents/leela_zero_LZ258_40x256.txt
# /Users/eliekadoche/desktop/KataGo/cpp/katago
# gtp -model /Users/eliekadoche/desktop/documents/katago_g170-b20c256x2-s1039565568-d285739972.txt.gz -config /Users/eliekadoche/desktop/KataGo/cpp/configs/gtp_example.cfg

brew cask install spectacle
brew cask install teamviewer
brew cask install texstudio

# Git
# ---------------------------
# ---------------------------

echo 'Configuring git...'

git config --global user.name "Elie KADOCHE"
git config --global user.email eliekadoche78@gmail.com
git config --global core.editor vim
# Termux: git config credential.helper store

# zsh and vim
# ---------------------------
# ---------------------------

echo 'Setting zsh and vim...'

sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

cp .vimrc ~
cp .zshrc ~

# Vim Plug
# ---------------------------
# ---------------------------

echo 'Installing Vim Plug...'

curl -fLo ~/.vim/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
# Then :PlugInstall and <./install.py --all> in the repo of YouCompleteMe

# Others
# ---------------------------
# ---------------------------

git clone https://github.com/lightvector/KataGo.git
# Then compile and install datago
# /Users/eliekadoche/desktop/KataGo/cpp/katago
# gtp -model /Users/eliekadoche/desktop/KataGo/model.txt.gz -config /Users/eliekadoche/desktop/KataGo/cpp/configs/gtp_example.cfg

# for termux: termux-setup-storage
# install oh-my-zsh (see documentation)
# Write in ~/.termux/termux.properties:
# extra-keys = [ \
#  ['ESC','|','/','HOME','UP','END','PGUP','DEL'], \
#  ['TAB','CTRL','ALT','LEFT','DOWN','RIGHT','PGDN','BKSP'] \
# ]
# termux-reload-settings

# Android
#   Termux: git, texlive, tlmgr install scheme-full, python, tor, mpv, sl, zip, unzip, unrar, numpy, etc.
#   + Termux:API
#   Dev: cxxdroid, quickedit pro, total commander, usb stick plugin
#   Baduk: tsumego pro, pandanet, tygem, kgs, Ah Q Go
#   Privacy: firefox, firefox focus, tor
#   Communication: discord, facebook, instagram, messenger, linkedin, whastapp, reddit
#   Google: gmail, drive, maps, contacts, doc
#   Moving: citymapper
#   System: adobe acrobat reader, calculator++, clearscanner, lithium
#   Others: leafpic, Hex, Morpion Solitaire (qilin TicTacToe)
