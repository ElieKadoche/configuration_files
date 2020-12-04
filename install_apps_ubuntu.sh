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

sudo apt -y install curl
sudo apt -y install git

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
sudo apt -y install build-essential
sudo apt -y install cheese
sudo apt -y install cmake
sudo apt -y install coreutils
sudo apt -y install cryptsetup
sudo apt -y install firefox
sudo apt -y install gcc
sudo apt -y install ghostscript
sudo apt -y install htop
sudo apt -y install libbz2-dev
sudo apt -y install libcairo2-dev
sudo apt -y install libgpgme-dev
sudo apt -y install linux-headers-$(uname -r)
sudo apt -y install network-manager
sudo apt -y install ocl-icd-opencl-dev
sudo apt -y install openssh-server
sudo apt -y install python3
sudo apt -y install screen
sudo apt -y install wget

# From universe
sudo apt -y install audacity
sudo apt -y install bibclean
sudo apt -y install blender
sudo apt -y install calibre
sudo apt -y install clang-format
sudo apt -y install clinfo
sudo apt -y install cloudcompare
sudo apt -y install cmatrix
sudo apt -y install exfat-fuse
sudo apt -y install ffmpeg
sudo apt -y install fonts-firacode
sudo apt -y install gimp
sudo apt -y install gnome-panel
sudo apt -y install gnome-shell-extensions
sudo apt -y install gnome-tweak-tool
sudo apt -y install graphviz
sudo apt -y install hardinfo
sudo apt -y install imagemagick
sudo apt -y install inkscape
sudo apt -y install leela-zero
sudo apt -y install libboost-all-dev
sudo apt -y install libcups2-dev
sudo apt -y install libgeos++-dev
sudo apt -y install libgirepository1.0-dev
sudo apt -y install libopencv-dev
sudo apt -y install libproj-dev
sudo apt -y install librecad
sudo apt -y install libreoffice
sudo apt -y install libzip-dev
sudo apt -y install lm-sensors
sudo apt -y install mpv
sudo apt -y install ncdu
sudo apt -y install neofetch
sudo apt -y install neovim
sudo apt -y install nmap
sudo apt -y install npm
sudo apt -y install okular
sudo apt -y install pandoc
sudo apt -y install papirus-icon-theme
sudo apt -y install pavucontrol
sudo apt -y install pulseeffects
sudo apt -y install pwgen
sudo apt -y install python-box2d
sudo apt -y install python-dev
sudo apt -y install python3-cartopy
sudo apt -y install python3-distutils-extra
sudo apt -y install python3-pip
sudo apt -y install python3-pygame
sudo apt -y install rawtherapee
sudo apt -y install scrcpy
sudo apt -y install sshfs
sudo apt -y install swi-prolog
sudo apt -y install swig
sudo apt -y install texlive-full
sudo apt -y install texstudio
sudo apt -y install thefuck
sudo apt -y install tldr
sudo apt -y install tor
sudo apt -y install torbrowser-launcher
sudo apt -y install tree
sudo apt -y install uncrustify
sudo apt -y install xclip
sudo apt -y install xtrlock

# From multiverse
sudo apt -y install flashplugin-installer
sudo apt -y install unrar

# Peek
# ------------------------------------------

sudo add-apt-repository ppa:peek-developers/stable
sudo apt update
sudo apt -y install peek

# Alacritty
# ------------------------------------------

sudo add-apt-repository ppa:mmstick76/alacritty
sud apt update
sudo apt -y install alacritty

# Etcher
# ------------------------------------------

echo "deb https://deb.etcher.io stable etcher" | sudo tee /etc/apt/sources.list.d/balena-etcher.list
sudo apt-key adv --keyserver hkps://keyserver.ubuntu.com:443 --recv-keys 379CE192D401AB61
sudo apt-get update
sudo apt-get install balena-etcher-electron

# openrazer
# ------------------------------------------

sudo add-apt-repository ppa:openrazer/stable
sudo add-apt-repository ppa:polychromatic/stable
sudo apt-get update
sudo apt -y install openrazer-meta
sudo apt -y install polychromatic

# CUDA
# ------------------------------------------

sudo apt -y install nvidia-cuda-toolkit
# nvcc --version to check version

# Download cuDNN 10.2 on Nvidia Developper site
sudo cp cuda/include/* /usr/lib/cuda/include/
sudo cp cuda/lib64/libcudnn* /usr/lib/cuda/lib64/
sudo chmod a+r /usr/lib/cuda/include/* /usr/lib/cuda/lib64/libcudnn*

# Docker
# ------------------------------------------

# Or simply this command: curl https://get.docker.com | sh

# Packages
sudo apt -y install \
    apt-transport-https \
    ca-certificates \
    curl \
    gnupg-agent \
    software-properties-common

# Add Docker’s official GPG key
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -

# Add stable repository
sudo add-apt-repository \
   "deb [arch=amd64] https://download.docker.com/linux/ubuntu \
   $(lsb_release -cs) \
   stable"
sudo apt update

# Install Docker and check installation
sudo apt -y install docker-ce docker-ce-cli containerd.io
sudo docker run hello-world

# NVIDIA part
distribution=$(. /etc/os-release;echo $ID$VERSION_ID)
curl -s -L https://nvidia.github.io/nvidia-docker/gpgkey | sudo apt-key add -
curl -s -L https://nvidia.github.io/nvidia-docker/$distribution/nvidia-docker.list | sudo tee /etc/apt/sources.list.d/nvidia-docker.list
sudo apt update
sudo apt -y install -y nvidia-docker2
sudo systemctl restart docker

# Snap
# ------------------------------------------

echo "Running snap packages..."

sudo snap install discord
sudo snap install intellij-idea-community --classic
sudo snap install mathpix-snipping-tool
sudo snap install pick-colour-picker
sudo snap install pycharm-community --classic
sudo snap install rpi-imager

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
cp .zshrc ~

mkdir ~/.config/nvim
cp init.vim ~/.config/nvim/init.vim

mkdir ~/.config/nvim/syntax
cp others/cypher.vim ~/.config/nvim/syntax/cypher.vim
cp others/sparql.vim ~/.config/nvim/syntax/sparql.vim
cp others/log.vim ~/.config/nvim/syntax/log.vim

mkdir ~/.config/nvim/custom_snippets
cp others/all.snippets ~/.config/nvim/custom_snippets/all.snippets
cp others/python.snippets ~/.config/nvim/custom_snippets/python.snippets

# Vim Plug
# ------------------------------------------

echo "Installing Vim Plug..."

sh -c 'curl -fLo "${XDG_DATA_HOME:-$HOME/.local/share}"/nvim/site/autoload/plug.vim --create-dirs \
       https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'

nvim +"PlugInstall" +qa;
nvim +"CocInstall coc-texlab" +qa;

# Python packages
# ------------------------------------------

echo "Installing python packages..."

pip install -r requirements.txt

# Others
# ------------------------------------------

# Detect sensors
sudo sensors-detect

# Activate firewall linux
sudo ufw enable

# Custom modifications
cp others/gtk.css ~/.config/gtk-3.0/gtk.css
cp others/_colors.scss $ORIGIN/git_apps/materia-theme/src/_colors.scss

# Alacritty configuration
mkdir ~/.config/alacritty
cp others/alacritty.yml ~/.config/alacritty/alacritty.yml

# Others: CGoban, Source-Sans-Pro, GoPanda, TeamViewer, Google Earth, Google Chrome

# Extensions
# ------------------------------------------

# Application View Columns
# Applications Menu
# Dash to Dock
# Emoji selector
# Freon
# NetSpeed
# Night Light Slider
# OpenWeather
# Removable Drive Menu
# Sound Input & Output Device Chooser
# User Themes
# Vitals
# windowNavigator

# Compile and update everything
# ------------------------------------------

master_all
