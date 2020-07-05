#!/bin/zsh

# Activating repo
# ------------------------------------------

echo "Activating repo..."

# All packages in /etc/apt/sources.list(d)
sudo add-apt-repository main
sudo add-apt-repository universe
sudo add-apt-repository multiverse
sudo add-apt-repository restricted
sudo apt-get update

# Installation de zsh
# ------------------------------------------

sudo apt-get install zsh
chsh

# Then, type /bin/zsh
# See /etc/zshrc

# You can launch the script from here
# ------------------------------------------

# APT
# ------------------------------------------

echo "Running apt packages..."

sudo apt-get install audacity
sudo apt-get install bibclean
sudo apt-get install blender
sudo apt-get install clang-format
sudo apt-get install clinfo
sudo apt-get install cloudcompare
sudo apt-get install cmake
sudo apt-get install cmatrix
sudo apt-get install coreutils
sudo apt-get install exfat-fuse
sudo apt-get install ffmpeg
sudo apt-get install firefox
sudo apt-get install flashplugin-installer
sudo apt-get install gcc
sudo apt-get install geos
sudo apt-get install ghostscript
sudo apt-get install gimp
sudo apt-get install git
sudo apt-get install googleearth-package
sudo apt-get install graphviz
sudo apt-get install htop
sudo apt-get install imagemagick
sudo apt-get install leela-zero
sudo apt-get install libav
sudo apt-get install libreoffice
sudo apt-get install mpv
sudo apt-get install neofetch
sudo apt-get install nmap
sudo apt-get install pandoc
# sudo apt-get install prettier
sudo apt-get install proj
sudo apt-get install pwgen
sudo apt-get install python3
sudo apt-get install sshfs
sudo apt-get install swi-prolog
sudo apt-get isntall texlive-full
sudo apt-get install texstudio
sudo apt-get install thefuck
sudo apt-get install tldr
sudo apt-get install tor
sudo apt-get install tree
sudo apt-get install uncrustify
sudo apt-get install unrar
sudo apt-get install vim
sudo apt-get install watch
sudo apt-get install wget

# Snap
# ------------------------------------------

echo "Running snap packages..."

sudo snap install discord
sudo snap install intellij-idea-community --classic
sudo snap install pycharm-community --classic

# Git
# ------------------------------------------

echo "Configuring git..."

git config --global user.name "Elie KADOCHE"
git config --global user.email eliekadoche78@gmail.com
git config --global core.editor vim
git config --global core.filemode false
git config --global credential.helper store

# zsh and vim
# ------------------------------------------

echo "Setting zsh and vim..."

sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
cp .vimrc ~
cp .zshrc ~

mkdir ~/.vim/syntax
cp cypher.vim ~/.vim/syntax
cp sparql.vim ~/.vim/syntax
cp log.vim ~/.vim/syntax

# Vim Plug
# ------------------------------------------

echo "Installing Vim Plug..."

curl -fLo ~/.vim/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

# Python packages
# ------------------------------------------

echo "Installing python packages..."

sudo pip install -r requirements.txt

# Others
# ------------------------------------------

# Install cgoban from https://www.gokgs.com/download.jsp
# Install source-sans-pro in Font Manager
# Install gopanda, sabaki and teamviewer
