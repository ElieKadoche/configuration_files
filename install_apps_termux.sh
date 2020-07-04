#!/bin/zsh

# Before all
# ------------------------------------------

pkg install zsh
pkg install git

sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
termux-setup-storage
pkg install vim

curl -fLo ~/.vim/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

cp .vimrc ~
cp .zshrc ~

mkdir ~/.vim/syntax
cp cypher.vim ~/.vim/syntax
cp sparql.vim ~/.vim/syntax
cp log.vim ~/.vim/syntax

# You can launch the script from here
# ------------------------------------------

# Configuration
# ------------------------------------------

echo "Configuring Termux..."

cfg = "extra-keys = [ \
    ['ESC','|','/','HOME','UP','END','PGUP','DEL'], \
    ['TAB','CTRL','ALT','LEFT','DOWN','RIGHT','PGDN','BKSP'] \
]"

echo "$cfg$" > ~/.termux/termux.properties

termux-reload-settings

# Git
# ------------------------------------------

echo "Configuring git..."

git config --global user.name "Elie KADOCHE"
git config --global user.email eliekadoche78@gmail.com
git config --global core.editor vim
git config --global core.filemode false
git config --global credential.helper store

# pkg
# ------------------------------------------

pkg install cmatrix
pkg install ffmpeg
pkg install imagemagick
pkg install ghostscript
pkg install git
pkg install htop
pkg install mpv
pkg install openssl-tool
pkg install pwgen
pkg install termux-api

# 2 different options
pkg install texlive-full
# pkg install texlive
# tlmgr update --list
# tlmgr install scheme-full

pkg install tor
pkg install zip
pkg install unrar
pkg install unzip

# Python packages (all packages will not work, be careful)
# ------------------------------------------

echo "Installing python packages..."

sudo pip3 install -r requirements.txt
