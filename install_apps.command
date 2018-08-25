#!/bin/bash
echo 'Process begins...'

echo 'Setting OS X...'
defaults write com.apple.finder AppleShowAllFiles -bool true
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

killall Dock
killall Finder

echo 'Setting vim and bash...'
cp .vimrc ~
cp .bash_profile ~ # for termux: termux-setup-storage and vim ~/../usr/etc/bash.bashrc

echo 'Installing Homebrew...'
/usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"

echo 'Running brew...'
brew tap homebrew/cask-fonts
brew install coreutils
brew install git
brew install python
brew install swi-prolog # swipl to run
brew install tor
brew install emojify
brew install macvim
brew install sl
brew install mpv

echo 'Runing brew cask...'
brew cask install firefox # HTTPS everywhere, Adblock for Firefox, SAMLtracer, Popup Blocker, OctoTree, LessPass, DuckDuckGo Privacy Essentials, Markdown Here
brew cask install font-source-sans-pro
brew cask install mpv
brew cask install adobe-acrobat-reader
brew cask install android-file-transfer
brew cask install texstudio
brew cask install mactex
brew cask install spectacle
brew cask install discord
brew cask install teamviewer
brew cask install lulu
brew cask install pycharm-ce
brew cask install intellij-idea-ce
brew cask install cgoban
brew cask install gopanda
brew cask install avast-security

echo 'Please install JDK, Office, PostregeSQL, StarUML and DocAtor'

echo 'Configuring git'

git config --global user.name "Elie Kadoche"
git config --global user.email eliekadoche78@gmail.com
git config --global core.editor vim

echo 'Install Vim Plug'
# curl -fLo ~/.vim/autoload/plug.vim --create-dirs \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
# https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

echo 'End of process'
