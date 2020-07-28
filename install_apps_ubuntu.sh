#!/bin/zsh

# Activating repo
# ------------------------------------------

echo "Activating repo..."

# All packages in /etc/apt/sources.list(d)
sudo add-apt-repository main
sudo add-apt-repository universe
sudo add-apt-repository multiverse
sudo add-apt-repository restricted
sudo add-apt-repository ppa:mmstick76/alacritty
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

/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install.sh)"

echo 'eval $(/home/linuxbrew/.linuxbrew/bin/brew shellenv)' >> /home/elie_kadoche/.zprofile
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
sudo apt install wget

# From universe
sudo apt install audacity
sudo apt install alacritty
sudo apt install bibclean
sudo apt install blender
sudo apt install clang-format
sudo apt install clinfo
sudo apt install cloudcompare
sudo apt install cmatrix
sudo apt install exfat-fuse
sudo apt install ffmpeg
sudo apt install fonts-firacode
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
sudo apt install neovim
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
sudo apt install sassc
sudo apt install sshfs
sudo apt install swi-prolog
sudo apt install swig
sudo apt install texlive-full
sudo apt install texstudio
sudo apt install thefuck
sudo apt install tldr
sudo apt install tor
sudo apt install tree
sudo apt install uncrustify
sudo apt install xclip
sudo apt install xtrlock

# From multiverse
sudo apt install flashplugin-installer
sudo apt install unrar

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
git config --global core.editor nvim
git config --global core.filemode false
git config --global credential.helper store

# zsh and vim
# ------------------------------------------

echo "Setting zsh and vim..."

sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

mkdir ~/.config/nvim
cp init.vim ~/.config/nvim/init.vim

mkdir ~/.config/nvim/syntax
cp others/cypher.vim ~/.config/nvim/syntax/cypher.vim
cp others/sparql.vim ~/.config/nvim/syntax/sparql.vim
cp others/log.vim ~/.config/nvim/syntax/log.vim

# Vim Plug
# ------------------------------------------

echo "Installing Vim Plug..."

sh -c 'curl -fLo "${XDG_DATA_HOME:-$HOME/.local/share}"/nvim/site/autoload/plug.vim --create-dirs \
       https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'

# Python packages
# ------------------------------------------

echo "Installing python packages..."

pip install -r requirements.txt

# Others
# ------------------------------------------

# Activate firewall linux
sudo ufw enable

# Custom modifications
cp others/gtk.css ~/.config/gtk-3.0/gtk.css

# Alacritty configuration
mkdir ~/.config/alacritty
cp others/alacritty.yml ~/.config/alacritty/alacritty.yml

# Install cgoban, source-sans-pro, gopanda and balena-etcher (miscellaneous folder)
# Install teamviewer and google earth
# Install and activate extensions, themes, icons, etc.
# Extensions: application view columns, dash to dock, night light slider, openweather, etc.
