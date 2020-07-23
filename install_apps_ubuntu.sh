#!/bin/zsh

# Activating repo
# ------------------------------------------

echo "Activating repo..."

# All packages in /etc/apt/sources.list(d)
sudo add-apt-repository main
sudo add-apt-repository universe
sudo add-apt-repository multiverse
sudo add-apt-repository restricted
sudo apt update

# Installation de zsh
# ------------------------------------------

sudo apt install zsh
chsh -s $(which zsh)

# You can launch the script from here
# ------------------------------------------

# Homebrew
# ------------------------------------------

echo "Installing Linuxbrew..."

/bin/zsh -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install.sh)"

eval $(/home/linuxbrew/.linuxbrew/bin/brew shellenv)

# APT
# ------------------------------------------

echo "Running apt packages..."


# From main
sudo apt install build-essential
sudo apt install curl
sudo apt install cmake
sudo apt install coreutils
sudo apt install firefox
sudo apt install gcc
sudo apt install ghostscript
sudo apt install git
sudo apt install htop
sudo apt install libcairo2-dev
sudo apt install ocl-icd-opencl-dev
sudo apt install python3
sudo apt install vim
sudo apt install wget

# From universe
sudo apt install audacity
sudo apt install bibclean
sudo apt install blender
sudo apt install clang-format
sudo apt install clinfo
sudo apt install cloudcompare
sudo apt install cmatrix
sudo apt install exfat-fuse
sudo apt install ffmpeg
sudo apt install gimp
sudo apt install gnome-shell-extensions
sudo apt install gnome-tweak-tool
sudo apt install graphviz
sudo apt install inkscape
sudo apt install imagemagick
sudo apt install leela-zero
sudo apt install libgeos++-dev
sudo apt install libgirepository1.0-dev
sudo apt install libboost-all-dev
sudo apt install libcups2-dev
sudo apt install libproj-dev
sudo apt install libreoffice
sudo apt install libzip-dev
sudo apt install mpv
sudo apt install neofetch
sudo apt install nmap
sudo apt install npm
sudo apt install pandoc
sudo apt install papirus-icon-theme
sudo apt install pwgen
sudo apt install python-dev
sudo apt install python-box2d
sudo apt install python3-pip
sudo apt install python3-pygame
sudo apt install python3-cartopy
sudo apt install sshfs
sudo apt install swi-prolog
sudo apt install swigg
sudo apt isntall texlive-full
sudo apt install texstudio
sudo apt install thefuck
sudo apt install tldr
sudo apt install tor
sudo apt install tree
sudo apt install uncrustify
sudo apt install vim-gui-common
sudo apt install xclip
sudo apt install xtrlock

# From multiverse
sudo apt install flashplugin-installer
sudo apt install unrar

# Etcher
echo "deb https://deb.etcher.io stable etcher" | sudo tee /etc/apt/sources.list.d/balena-etcher.list
sudo apt-key adv --keyserver hkps://keyserver.ubuntu.com:443 --recv-keys 379CE192D401AB61
sudo apt update
sudo apt install balena-etcher-electron

# Snap
# ------------------------------------------

echo "Running snap packages..."

sudo snap install discord
sudo snap install intellij-idea-community --classic
sudo snap install pycharm-community --classic

# Linuxbrew
# ------------------------------------------

echo "Installing brew..."

# Carefull here, linuxbrew may install its own python3 for certain package
brew install prettier

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

mkdir ~/.vim
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

pip install -r requirements.txt

# Others
# ------------------------------------------

# Install cgoban, source-sans-pro and gopand (miscellaneous folder)
# Install teamviewer and google earth
# Install and activate extensions, themes, icons, etc.
