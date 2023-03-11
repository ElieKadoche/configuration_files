#!/bin/zsh

# Command line tools
xcode-select --install

# Install Homebrew
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"

# Install ZSH
brew install zsh
chsh -s /usr/local/bin/zsh

# Check Python with system version
brew install python@3.10

# Install Brew packages
brew install bibclean
brew install cgoban
brew install clang-format
brew install cmake
brew install cmatrix
brew install coreutils
brew install curl
brew install docker
brew install dos2unix
brew install ffmpeg
brew install ffmpegthumbnailer
brew install fzf
brew install gcc
brew install ghostscript
brew install git
brew install gmsh
brew install graphviz
brew install htop
brew install imagemagick
brew install jpeg-turbo
brew install katago
brew install leela-zero
brew install lynx
brew install meson
brew install mpv
brew install ncdu
brew install neofetch
brew install neovim
brew install nmap
brew install node
brew install openssh
brew install pandoc
brew install prettier
brew install pwgen
brew install ruby
brew install sassc
brew install scrcpy
brew install screen
brew install swi-prolog
brew install swig
brew install tesseract
brew install tldr
brew install tmux
brew install tor
brew install transmission-cli
brew install tree
brew install uncrustify
brew install wget
brew install xclip

# Install Brew cask packages
brew install --cask adobe-acrobat-reader
brew install --cask android-file-transfer
brew install --cask audacity
brew install --cask balenaetcher
brew install --cask blender
brew install --cask calibre
brew install --cask cloudcompare
brew install --cask cyberduck
brew install --cask discord
brew install --cask firefox
brew install --cask gimp
brew install --cask google-chrome
brew install --cask google-earth-pro
brew install --cask gopanda
brew install --cask inkscape
brew install --cask intellij-idea-ce
brew install --cask librecad
brew install --cask libreoffice
brew install --cask lmms
brew install --cask mathpix-snipping-tool
brew install --cask microsoft-office-businesspro
brew install --cask mpv
brew install --cask pycharm-ce
brew install --cask raspberry-pi-imager
brew install --cask rawtherapee
brew install --cask sabaki
brew install --cask teamviewer
brew install --cask texstudio
brew install --cask tor-browser
brew install --cask transmission

# Install fonts
brew tap homebrew/cask-fonts
brew install --cask font-fira-code
brew install --cask font-source-sans-pro

# LaTeX
# brew install texlive
brew install --cask mactex

# Install Jekyll
gem install bundler jekyll

# Apple toolbox for machine learning
pip install coremltools

# Others
# Install https://github.com/textext/textext/releases, then python setup.py
