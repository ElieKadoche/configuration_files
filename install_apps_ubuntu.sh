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
sudo add-apt-repository ppa:openrazer/stable
sudo add-apt-repository ppa:polychromatic/stable
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
sudo apt install libbz2-dev
sudo apt install libcairo2-dev
sudo apt install linux-headers-$(uname -r)
sudo apt install ocl-icd-opencl-dev
sudo apt install openssh-server
sudo apt install python3
sudo apt install screen
sudo apt install wget

# From universe
sudo apt install audacity
sudo apt install alacritty
sudo apt install bibclean
sudo apt install blender
sudo apt install calibre
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
sudo apt install hardinfo
sudo apt install inkscape
sudo apt install imagemagick
sudo apt install leela-zero
sudo apt install libgeos++-dev
sudo apt install libgirepository1.0-dev
sudo apt install libboost-all-dev
sudo apt install libcups2-dev
sudo apt install libopencv-dev
sudo apt install libproj-dev
sudo apt install libreoffice
sudo apt install libzip-dev
sudo apt install lm-sensors
sudo apt install mpv
sudo apt install neofetch
sudo apt install neovim
sudo apt install nmap
sudo apt install npm
sudo apt install pandoc
sudo apt install papirus-icon-theme
sudo apt install pavucontrol
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

# openrazer
# ------------------------------------------

sudo apt install openrazer-meta
sudo apt install polychromatic

# CUDA
# ------------------------------------------

sudo apt install nvidia-cuda-toolkit
# nvcc --version to check version

# Download cuDNN 10.2 on Nvidia Developper site
sudo cp cuda/include/* /usr/lib/cuda/include/
sudo cp cuda/lib64/libcudnn* /usr/lib/cuda/lib64/
sudo chmod a+r /usr/lib/cuda/include/* /usr/lib/cuda/lib64/libcudnn*

# Docker
# ------------------------------------------

# Or simply this command: curl https://get.docker.com | sh

# Packages
sudo apt install \
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
sudo apt install docker-ce docker-ce-cli containerd.io
sudo docker run hello-world

# NVIDIA part
distribution=$(. /etc/os-release;echo $ID$VERSION_ID)
curl -s -L https://nvidia.github.io/nvidia-docker/gpgkey | sudo apt-key add -
curl -s -L https://nvidia.github.io/nvidia-docker/$distribution/nvidia-docker.list | sudo tee /etc/apt/sources.list.d/nvidia-docker.list
sudo apt update
sudo apt-get install -y nvidia-docker2
sudo systemctl restart docker

# Snap
# ------------------------------------------

echo "Running snap packages..."

sudo snap install discord
sudo snap install intellij-idea-community --classic
sudo snap install pycharm-community --classic
sudo snap install mathpix-snipping-tool

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

# Alacritty configuration
mkdir ~/.config/alacritty
cp others/alacritty.yml ~/.config/alacritty/alacritty.yml

# Install cgoban, source-sans-pro, gopanda and balena-etcher (miscellaneous folder)
# Install teamviewer and google earth
# Install and activate extensions, themes, icons, etc.
# Extensions: application view columns, dash to dock, night light slider, openweather, etc.
