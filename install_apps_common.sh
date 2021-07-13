#!/bin/zsh

# ZSH configuration
cp .zshrc ~

# Create folder if it does not exist
mkdir ~/.config

# tmux configuration
cp others/.tmux.conf ~

# Install oh-my-zsh
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

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

# For Termux only
# Change custom init.vim
# Comment the YouCompleteMe Plug line
mkdir ~/.config/nvim
cp init.vim ~/.config/nvim/init.vim

# Neovim specific syntax
mkdir ~/.config/nvim/syntax
cp others/cypher.vim ~/.config/nvim/syntax/cypher.vim
cp others/sparql.vim ~/.config/nvim/syntax/sparql.vim
cp others/log.vim ~/.config/nvim/syntax/log.vim

# Neovim custom snippets
mkdir ~/.config/nvim/custom_snippets
cp others/all.snippets ~/.config/nvim/custom_snippets/all.snippets
cp others/python.snippets ~/.config/nvim/custom_snippets/python.snippets

# Install vim-plug
sh -c 'curl -fLo "${XDG_DATA_HOME:-$HOME/.local/share}"/nvim/site/autoload/plug.vim --create-dirs \
       https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'

# Install plugins
nvim +"PlugInstall" +qa;

# On Ubuntu, I use coc.nvim only for tex and yml files
nvim tmp.tex +"CocInstall coc-texlab" +qa;
nvim tmp.yml +"CocInstall coc-yaml" +qa;

# For Termux only
nvim tmp +"CocInstall coc-pyright" +qa;

# nvim-treesitter languages
nvim tmp +"TSInstall bash bibtex cpp html json latex python yaml" +qa;

# Python packages
# ------------------------------------------

echo "Installing python packages..."

# All packages will not work on Termux, be careful
# Choose carefully which packages to install globally
# Packages can be used globally, in a virtual environment, in a Docker container, etc.
pip install -r requirements.txt
