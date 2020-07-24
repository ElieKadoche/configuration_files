#!/bin/zsh

# Mac OS settings
# ------------------------------------------

echo "Setting OS..."

# Command line tools
xcode-select --install

# Allow apps downloaded from anywhere
# Security & Privacy: back to normal
# sudo spctl --master-disable

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

# Show full path in Finder
defaults write com.apple.finder _FXShowPosixPathInTitle -bool true
defaults write com.apple.finder ShowPathbar -bool true

# Disable log info
defaults write org.python.python ApplePersistenceIgnoreState NO

killall SystemUIServer
killall Finder
killall Dock

# Homebrew
# ------------------------------------------

echo "Installing Homebrew..."

/bin/zsh -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install.sh)"

brew tap homebrew/cask-fonts

# Brew
# ------------------------------------------

echo "Running brew..."

brew install bibclean
brew install clang-format
brew install clinfo
brew install cmake
brew install cmatrix
brew install coreutils
brew install ffmpeg
brew install gcc
brew install geos
brew install ghostscript
brew install git
brew install graphviz
brew install htop
brew install imagemagick
brew install leela-zero
brew install libav
brew install neofetch
brew install neovim
brew install nmap
brew install node
brew install osx-cpu-temp
brew install pandoc
brew install prettier
brew install proj
brew install pwgen
brew install python3
brew install sshfs
brew install swi-prolog
brew install thefuck
brew install tldr
brew install tor
brew install tree
brew install uncrustify
brew install unrar
brew install watch
brew install wget

# Brew cask
# ------------------------------------------

echo "Running brew cask..."

brew cask install android-file-transfer
brew cask install alacritty
brew cask install balenaetcher
brew cask install blender
brew cask install cloudcompare
brew cask install discord
brew cask install firefox
brew cask install flash-player
brew cask install font-source-sans-pro
brew cask install gimp
brew cask install google-earth-pro
brew cask install gopanda
brew cask install inkscape
brew cask install intellij-idea-ce
brew cask install libreoffice
brew cask install mactex
brew cask install mpv
brew cask install osxfuse
brew cask install pycharm-ce
brew cask install shifty
brew cask install skim
brew cask install spectacle
brew cask install teamviewer
brew cask install texstudio

# Git
# ------------------------------------------

echo "Configuring git..."

git config --global user.name "Elie KADOCHE"
git config --global user.email eliekadoche78@gmail.com
git config --global core.editor nvim
git config --global core.filemode false
git config --global credential.helper store

# zsh and vim
# ------------------------------------------

echo "Setting zsh and vim..."

sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
cp .zshrc ~

mkdir ~/.config/nvim
cp init.vim ~/.config/nvim/init.vim

mkdir ~/.config/nvim/syntax
cp cypher.vim ~/.config/nvim/syntax/cypher.vim
cp sparql.vim ~/.config/nvim/syntax/sparql.vim
cp log.vim ~/.config/nvim/syntax/log.vim

# Vim Plug
# ------------------------------------------

echo "Installing Vim Plug..."

sh -c 'curl -fLo "${XDG_DATA_HOME:-$HOME/.local/share}"/nvim/site/autoload/plug.vim --create-dirs \
       https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'

# Python packages
# ------------------------------------------

echo "Installing python packages..."

sudo pip install -r requirements.txt

# Others
# ------------------------------------------

# Install cgoban from https://www.gokgs.com/download.jsp
# Install Audacity (no homebrew support for the moment)
