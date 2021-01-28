#!/bin/zsh

# Before all
# ------------------------------------------

pkg install -y zsh
pkg install -y git

sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
cp .zshrc ~
termux-setup-storage
pkg install -y neovim

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

# Fira Code font
wget https://github.com/tonsky/FiraCode/raw/master/distr/ttf/FiraCode-Retina.ttf -O ~/.termux/font.ttf

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

pkg install -y cmatrix
pkg install -y ffmpeg
pkg install -y fzf
pkg install -y ghostscript
pkg install -y git
pkg install -y htop
pkg install -y imagemagick
pkg install -y mpv
pkg install -y neofetch
pkg install -y openssh
pkg install -y openssl-tool
pkg install -y pwgen
pkg install -y rsync
pkg install -y screen
pkg install -y termux-api
pkg install -y tmux
pkg install -y tree
pkg install -y wget

# 2 different options
pkg install -y texlive-full
# pkg install texlive
# tlmgr update --list
# tlmgr install scheme-full

pkg install -y tor
pkg install -y zip
pkg install -y unrar
pkg install -y unzip

# Python packages (all packages will not work, be careful)
# ------------------------------------------

echo "Installing python packages..."

pip3 install -r requirements.txt

# Compile and update everything
# ------------------------------------------

master_all
