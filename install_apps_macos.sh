#!/bin/zsh

# Mac OS settings
# ---------------------------

echo "Setting OS..."

# Command line tools
xcode-select --install

defaults write com.apple.screencapture disable-shadow -bool true
defaults write com.apple.screencapture location ~/Downloads
defaults write com.apple.finder QuitMenuItem -bool true

# Launchpad display
defaults write com.apple.dock springboard-columns -int 10
defaults write com.apple.dock springboard-rows -int 7

# Action choice when power button for 2 seconds
defaults write com.apple.loginwindow PowerButtonSleepsSystem -bool no

# Speed up
defaults write -g QLPanelAnimationDuration -float 0.001
defaults write com.apple.finder DisableAllAnimations -bool true
defaults write com.apple.dock launchanim -bool false
defaults write com.apple.dock expose-animation-duration -float 0.001
defaults write com.apple.dock autohide-delay -float 0.001

# Disable automatically rearrange spaces in mission control
defaults write com.apple.dock mru-spaces -bool false

killall SystemUIServer
killall Finder
killall Dock

# Homebrew
# ---------------------------

echo "Installing Homebrew..."

/bin/zsh -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install.sh)"

brew tap homebrew/cask-fonts

# Brew
# ---------------------------

echo "Running brew..."

brew install alexjs
brew install bibclean
brew install clang-format
brew install clinfo
brew install cmake
brew install cmatrix
brew install coreutils
brew install emojify
brew install gcc
brew install git
brew install gnu-go
brew install htop
brew install leela-zero
brew install osx-cpu-temp
brew install pandoc
brew install prettier
brew install pwgen
brew install python3
brew install redpen
brew install sshfs
brew install swi-prolog
brew install tldr
brew install tor
brew install uncrustify
brew install unrar
brew install watch
brew install wget
brew install write-good

# Brew cask
# ---------------------------

echo "Running brew cask..."

brew cask install android-file-transfer
brew cask install cloudcompare
brew cask install discord
brew cask install firefox
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
brew cask install pycharm-ce
brew cask install sabaki
brew cask install skim
brew cask install spectacle
brew cask install teamviewer
brew cask install texstudio

# Git
# ---------------------------

echo "Configuring git..."

git config --global user.name "Elie KADOCHE"
git config --global user.email eliekadoche78@gmail.com
git config --global core.editor vim
git config --global core.filemode false
git config --global credential.helper store

# zsh and vim
# ---------------------------

echo "Setting zsh and vim..."

sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
cp .vimrc ~
cp .zshrc ~

mkdir ~/.vim/syntax
cp cypher.vim ~/.vim/syntax
cp sparql.vim ~/.vim/syntax

# Vim Plug
# ---------------------------

echo "Installing Vim Plug..."

curl -fLo ~/.vim/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

# Python packages
# ---------------------------

echo "Installing python packages..."

sudo pip3 install -r requirements.txt

# Other
# ---------------------------

# Install cgoban from https://www.gokgs.com/download.jsp