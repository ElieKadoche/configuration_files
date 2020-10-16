#!/bin/zsh

# Before all
# ------------------------------------------

pkg install zsh
pkg install git

sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
cp .zshrc ~
termux-setup-storage
pkg install neovim

sh -c 'curl -fLo "${XDG_DATA_HOME:-$HOME/.local/share}"/nvim/site/autoload/plug.vim --create-dirs \
       https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'

# You can launch the script from here
# ------------------------------------------

mkdir ~/.config/nvim
cp init.vim ~/.config/nvim/init.vim

mkdir ~/.config/nvim/syntax
cp others/cypher.vim ~/.config/nvim/syntax/cypher.vim
cp others/sparql.vim ~/.config/nvim/syntax/sparql.vim
cp others/log.vim ~/.config/nvim/syntax/log.vim

mkdir ~/.config/nvim/custom_snippets
cp others/all.snippets ~/.config/nvim/custom_snippets/all.snippets
cp others/python.snippets ~/.config/nvim/custom_snippets/python.snippets

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
git config --global core.editor nvim
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
pkg install neofetch
pkg install openssh
pkg install openssl-tool
pkg install pwgen
pkg install rsync
pkg install screen
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
