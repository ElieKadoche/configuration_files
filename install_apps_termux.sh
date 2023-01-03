#!/bin/zsh

# Update
pkg upgrade
pkg update

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

# For Numpy, use
MATHLIB="m" pip3 install numpy

# You can launch the script from here

# pkg
# ------------------------------------------

echo "Running pkg packages..."

pkg install -y cmatrix
pkg install -y e2fsprogs
pkg install -y ffmpeg
pkg install -y fzf
pkg install -y ghostscript
pkg install -y htop
pkg install -y imagemagick
pkg install -y iproute2
pkg install -y libxml2
pkg install -y libxslt
pkg install -y libzmq
pkg install -y mpv
pkg install -y neofetch
pkg install -y netcat-openbsd
pkg install -y nmap
pkg install -y nodejs
pkg install -y openssh
pkg install -y openssl-tool
pkg install -y pwgen
pkg install -y python
pkg install -y rsync
pkg install -y ruby
pkg install -y screen
pkg install -y termux-api
pkg install -y tesseract
pkg install -y tmux
pkg install -y tor
pkg install -y tree
pkg install -y unrar
pkg install -y unzip
pkg install -y zip

# LaTeX
pkg install -y texlive-installer
termux-install-tl

# jekyll
gem install jekyll bundler

# Termux configuration
# ------------------------------------------

echo "Configuring Termux..."

# Keyboard
# Enable / disable extra keys (see ek custom function)

# Download fira code font ttf file
mv fira_code.ttf ~/.termux/font.ttf

termux-reload-settings

# Compile and update everything
# ------------------------------------------

master_all
