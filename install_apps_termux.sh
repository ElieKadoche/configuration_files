#!/bin/zsh

# zsh installation
pkg install -y zsh

# Others
pkg install -y git
pkg install -y wget
pkg install -y neovim

# Activate storage
termux-setup-storage

# Launch common script
./install_apps_common.sh

# You can launch the script from here

# pkg
# ------------------------------------------

echo "Running pkg packages..."

pkg install -y cmatrix
pkg install -y e2fsprogs
pkg install -y ffmpeg
pkg install -y fzf
pkg install -y ghostscript
pkg install -y git
pkg install -y htop
pkg install -y imagemagick
pkg install -y libxml2
pkg install -y libxslt
pkg install -y libzmq
pkg install -y mpv
pkg install -y neofetch
pkg install -y nmap
pkg install -y nodejs
pkg install -y openssh
pkg install -y openssl-tool
pkg install -y pwgen
pkg install -y python
pkg install -y rsync
pkg install -y screen
pkg install -y termux-api
pkg install -y tesseract
pkg install -y tmux
pkg install -y tor
pkg install -y tree
pkg install -y unrar
pkg install -y unzip
pkg install -y zip

# 2 different options
pkg install -y texlive-full
# pkg install texlive
# tlmgr update --list
# tlmgr install scheme-full

# Python packages (all packages will not work, be careful)
# ------------------------------------------

echo "Installing python packages..."

pip3 install -r requirements.txt

# Configuration
# ------------------------------------------

echo "Configuring Termux..."

# Keyboard
cfg="extra-keys = [['ESC','|','/','HOME','UP','END','PGUP','DEL'], ['TAB','CTRL','ALT','LEFT','DOWN','RIGHT','PGDN','BKSP']]"
echo "$cfg" > ~/.termux/termux.properties

# Fira Code font
wget https://github.com/tonsky/FiraCode/raw/master/distr/ttf/FiraCode-Retina.ttf -O ~/.termux/font.ttf

termux-reload-settings

# Compile and update everything
# ------------------------------------------

master_all
