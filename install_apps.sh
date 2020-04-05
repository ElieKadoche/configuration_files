#!/bin/zsh

# Mac OS settings
# ---------------------------
echo "Setting OS..."

# Command line tools
xcode-select --instal

defaults write com.apple.screencapture disable-shadow -bool true # No shadow on screeshots
defaults write com.apple.screencapture location ~/Downloads # Screenshots location
defaults write com.apple.finder QuitMenuItem -bool true # cmd Q for Finder
defaults write com.apple.finder AppleShowAllFiles -bool TRUE # Show hidden files

# Launchpad diplay
defaults write com.apple.dock springboard-columns -int 10
defaults write com.apple.dock springboard-rows -int 7

# Action choice when power button for 2 seconds
defaults write com.apple.loginwindow PowerButtonSleepsSystem -bool no
# defaults write com.apple.loginwindow PowerButtonSleepsSystem -bool yes # To revert to default

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

/usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"

brew tap homebrew/cask-fonts

# Brew
# ---------------------------
echo "Running brew..."

brew install alexjs
brew install bibclean
brew install clang-format
brew install clinfo # OpenCL info
brew install cmake
brew install cmatrix
brew install coreutils
brew install emojify
brew install gcc
brew install git
brew install make # gmake
brew install gnu-go
brew install htop
brew install jupyter
brew install leela-zero
brew install macvim
brew install mpv
brew install osx-cpu-temp
brew install pandoc
brew install prettier
brew install python
brew install pwgen
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
brew install youtube-dl

# Python packages
# ---------------------------
echo "Installing python packages..."

pip install -r requirements.txt

# Brew cask
# ---------------------------
echo "Runing brew cask..."

brew cask install android-file-transfer
brew cask install cgoban
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
brew cask install postgres
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

# zsh and vim
# ---------------------------
echo "Setting zsh and vim..."

sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
cp .vimrc ~
cp .zshrc ~

# Vim Plug
# ---------------------------
echo "Installing Vim Plug..."

curl -fLo ~/.vim/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
cp pycodestyle ~/.config
cp flake8 ~/.config
