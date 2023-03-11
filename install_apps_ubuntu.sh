#!/bin/zsh

# zsh installation
sudo apt -y install zsh
chsh -s $(which zsh)

# Others
sudo apt -y install git
sudo apt -y install curl

# Launch common script
./install_apps_common.sh

# You can launch the script from here

# APT
# ------------------------------------------

echo "Running apt packages..."

# All packages in /etc/apt/sources.list(d)
sudo add-apt-repository -y main
sudo add-apt-repository -y universe
sudo add-apt-repository -y multiverse
sudo add-apt-repository -y restricted
sudo apt update

# From main
sudo apt -y install acl
sudo apt -y install apache2
sudo apt -y install build-essential
sudo apt -y install cheese
sudo apt -y install cmake
sudo apt -y install coreutils
sudo apt -y install cryptsetup
sudo apt -y install firefox
sudo apt -y install gcc
sudo apt -y install ghostscript
sudo apt -y install htop
sudo apt -y install libappindicator3-dev
sudo apt -y install libasound2-dev
sudo apt -y install libbz2-dev
sudo apt -y install libcairo2-dev
sudo apt -y install libgpgme-dev
sudo apt -y install libplist-dev
sudo apt -y install libspeex-dev
sudo apt -y install libtool-bin
sudo apt -y install libusbmuxd-dev
sudo apt -y install linux-headers-$(uname -r)
sudo apt -y install network-manager
sudo apt -y install ocl-icd-opencl-dev
sudo apt -y install openssh-server
sudo apt -y install python3
sudo apt -y install screen
sudo apt -y install software-properties-gtk
sudo apt -y install wget

# From universe
sudo apt -y install audacity
sudo apt -y install bibclean
sudo apt -y install blender
sudo apt -y install calibre
sudo apt -y install clang
sudo apt -y install clang-format
sudo apt -y install clinfo
sudo apt -y install cloudcompare
sudo apt -y install cmatrix
sudo apt -y install dconf-editor
sudo apt -y install djvulibre-bin
sudo apt -y install dos2unix
sudo apt -y install exfat-fuse
sudo apt -y install ffmpeg
sudo apt -y install ffmpegthumbnailer
sudo apt -y install fonts-firacode
sudo apt -y install gimp
sudo apt -y install gmsh
sudo apt -y install gnome-panel
sudo apt -y install gnome-shell-extensions
sudo apt -y install gnome-tweak-tool
sudo apt -y install graphviz
sudo apt -y install hardinfo
sudo apt -y install imagemagick
sudo apt -y install leela-zero
sudo apt -y install libavdevice-dev
sudo apt -y install libavformat-dev
sudo apt -y install libboost-all-dev
sudo apt -y install libcups2-dev
sudo apt -y install libgeos++-dev
sudo apt -y install libgirepository1.0-dev
sudo apt -y install libopencv-dev
sudo apt -y install libproj-dev
sudo apt -y install librecad
sudo apt -y install libreoffice
sudo apt -y install libsdl2-dev
sudo apt -y install libswscale-dev
sudo apt -y install libtiff-tools
sudo apt -y install libusb-1.0-0-dev
sudo apt -y install libzip-dev
sudo apt -y install lm-sensors
sudo apt -y install lmms
sudo apt -y install lynx
sudo apt -y install meson
sudo apt -y install mpv
sudo apt -y install ncdu
sudo apt -y install neofetch
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
sudo apt -y install python3-tk
sudo apt -y install python3-venv
sudo apt -y install rawtherapee
sudo apt -y install ruby-full
sudo apt -y install sassc
sudo apt -y install sshfs
sudo apt -y install sumo
sudo apt -y install swi-prolog
sudo apt -y install swig
sudo apt -y install tesseract-ocr
sudo apt -y install tesseract-ocr-fra
sudo apt -y install texlive-full
sudo apt -y install texstudio
sudo apt -y install tldr
sudo apt -y install tmux
sudo apt -y install tor
sudo apt -y install torbrowser-launcher
sudo apt -y install tree
sudo apt -y install uncrustify
sudo apt -y install xclip
sudo apt -y install xtrlock

# From multiverse
sudo apt -y install unrar

# Others
# ------------------------------------------

echo "Other packages..."

# Inkscape
sudo add-apt-repository ppa:inkscape.dev/stable
sudo apt update
sudo apt -y install inkscape

# openrazer
sudo add-apt-repository -y ppa:openrazer/stable
sudo add-apt-repository -y ppa:polychromatic/stable
sudo apt update
sudo apt -y install openrazer-meta
sudo apt -y install polychromatic

# Other Python versions
sudo add-apt-repository ppa:deadsnakes/ppa
sudo apt update
sudo apt install python3.6
sudo apt install python3.6-venv

# Peek
sudo add-apt-repository -y ppa:peek-developers/stable
sudo apt update
sudo apt -y install peek

# Transmission
sudo add-apt-repository ppa:transmissionbt/ppa
sudo apt update
sudo apt -y install transmission
sudo apt -y install transmission-cli
sudo apt -y install transmission-common
sudo apt -y install transmission-daemon

# jekyll
gem install jekyll bundler

# CUDA
# ------------------------------------------

# nvcc --version and nvidia-smi to check CUDA version

# Nvidia drivers
# Option 1: use default driver in "Additional drivers"
# Option 2 (better): download appropriate drivers from https://www.nvidia.com/Download/index.aspx

# Download CUDA from https://developer.nvidia.com/cuda-toolkit-archive
# Choose carefully the version, it musts be adapted to your applications and libraries
# A conflict can appear between Ubuntu NVIDIA drivers and the installer --> install CUDA Toolkit and CUDA Samples only
wget https://developer.download.nvidia.com/compute/cuda/X.X.X/local_installers/cuda_X.X.X_X.X.X_linux.run
sudo sh cuda_X.X.X_X.X.X_linux.run

# Download cuDNN from https://developer.nvidia.com/rdp/cudnn-archive
# Choose carefully the version, it musts be adapted to your CUDA version, applications and libraries
sudo cp cuda/include/cudnn*.h /usr/local/cuda/include
sudo cp cuda/lib64/libcudnn* /usr/local/cuda/lib64
sudo chmod a+r /usr/local/cuda/include/cudnn*.h /usr/local/cuda/lib64/libcudnn*

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
sudo add-apt-repository -y \
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

# Others
# ------------------------------------------

# Configure SSH and Apache2

# Activate firewall linux
sudo ufw enable

# Detect sensors
sudo sensors-detect

# Remove kdeconnect
sudo apt remove kdeconnect

# Disable Apache2 at startup
sudo systemctl disable apache2

# Set default permissions
setfacl -R -d -m u::rwx,g::-,o::- $ORIGIN

# node.js latest version
sudo npm install -g n
sudo n latest

# Neovim and Prettier
sudo npm install -g neovim
npm install --save-dev --save-exact prettier

# SSH notifier script
# Enable Google Calendar API on server
# Generate credentials.json and put it in ~/ssh_notifier
mkdir ~/ssh_notifier
cp others/ssh_notifier.py ~/ssh_notifier

# Install https://github.com/balena-io/etcher/releases
# Install https://github.com/libjpeg-turbo/libjpeg-turbo/releases/
# Install https://github.com/textext/textext/releases, then python setup.py
# Install https://gitlab.com/CalcProgrammer1/OpenRGB/-/releases
# Install CGoban, Source-Sans-Pro, GoPanda, TeamViewer, Google Earth, Google Chrome
# Remove plymouth: [sudo vim /etc/default/grub] nomodeset

# Extensions
# ------------------------------------------

# Application View Columns
# Emoji selector
# NetSpeed
# Night Light Slider
# Sound Input & Output Device Chooser
# User Themes

# Compile and update everything
# ------------------------------------------

master_all
