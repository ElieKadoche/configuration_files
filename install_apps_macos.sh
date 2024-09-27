#!/bin/zsh

# Command line tools
xcode-select --install

# Rosetta 2
sudo softwareupdate --install-rosetta

# Install Homebrew
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"

# Install ZSH
brew install zsh
chsh -s /usr/local/bin/zsh

# Check Python with system version
brew install python@3.10

# Install Brew packages
brew install bibclean
brew install box2d
brew install cgoban
brew install clang-format
brew install cmake
brew install cmatrix
brew install coreutils
brew install curl
brew install docker
brew install dos2unix
brew install ffmpeg
brew install fzf
brew install gcc
brew install ghostscript
brew install git
brew install gmsh
brew install gnu-sed
brew install go
brew install graphviz
brew install htop
brew install imagemagick
brew install jpeg-turbo
brew install katago
brew install languagetool
brew install latexindent
brew install leela-zero
brew install lua
brew install lynx
brew install meson
brew install ncdu
brew install neovim
brew install nmap
brew install node
brew install openjdk
brew install openssh
brew install pandoc
brew install pastel
brew install poppler
brew install prettier
brew install pwgen
brew install rsync
brew install ruby
brew install sassc
brew install scrcpy
brew install screen
brew install swi-prolog
brew install swig
brew install swig
brew install tesseract
brew install tldr
brew install tmux
brew install tor
brew install transmission-cli
brew install tree
brew install uncrustify
brew install watch
brew install wget
brew install xclip

# Install Brew cask packages
brew install --cask adobe-acrobat-reader
brew install --cask calibre
brew install --cask discord
brew install --cask firefox
brew install --cask google-chrome
brew install --cask google-earth-pro
brew install --cask gopanda
brew install --cask inkscape
brew install --cask keepassxc
brew install --cask libreoffice
brew install --cask microsoft-teams
brew install --cask mpv
brew install --cask rawtherapee
brew install --cask sabaki
brew install --cask skim
brew install --cask texstudio
brew install --cask tor-browser
brew install --cask transmission
brew install --cask vlc
brew install --cask whatsapp
brew install --cask zoom

# Install fonts
brew tap homebrew/cask-fonts
brew install --cask font-fira-code
brew install --cask font-source-sans-pro

# LaTeX
# brew install texlive
brew install --cask mactex

# Install Jekyll
gem install bundler jekyll

# Install neovim node package
npm install -g neovim

# Apple toolbox for machine learning
pip3.10 install coremltools

# For greenlet
ARCHFLAGS="-arch arm64" pip3.10 install box2d --compile --no-cache-dir
ARCHFLAGS="-arch arm64" pip3.10 install box2d-py --compile --no-cache-dir
ARCHFLAGS="-arch arm64" pip3.10 install greenlet --compile --no-cache-dir
ARCHFLAGS="-arch arm64" pip3.10 install grpcio --compile --no-cache-dir

# Change default parameters
defaults write com.apple.finder QuitMenuItem -bool YES
defaults write com.apple.screencapture location ~/Downloads
defaults write com.apple.finder DisableAllAnimations -bool true
defaults write com.apple.dock launchanim -bool false
defaults write -g NSAutomaticWindowAnimationsEnabled -bool false
defaults write -g QLPanelAnimationDuration -float 0

# Others
# Install https://github.com/textext/textext/releases, then python setup.py
