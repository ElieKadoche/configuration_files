#!/bin/zsh

# Create folder if it does not exist
mkdir ~/.config

# tmux configuration
cp others/.tmux.conf ~

# Install oh-my-zsh
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

# ZSH configuration
cp .zshrc ~

# Git
# ------------------------------------------

echo "Configuring git..."

# Setup ssh for GitHub
ssh -T git@github.com

git config --global user.name "Elie KADOCHE"
git config --global user.email eliekadoche78@gmail.com
git config --global core.editor nvim
git config --global core.filemode false
git config --global credential.helper store

# Neovim
# ------------------------------------------

echo "Configuring neovim..."

# Configuration
mkdir ~/.config/nvim
cp init.lua ~/.config/nvim/init.lua

# Python packages
# ------------------------------------------

echo "Installing python packages..."

# TODO: carefully choose the python version
python3 -m venv ~/.venv

# Virtual environment
source ~/.venv/bin/activate

# All packages will not work on Termux, be careful
# Choose carefully which packages to install globally
# Packages can be used globally, in a virtual environment, in a Docker container, etc.
pip install -r python.txt
