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
# Plug 'https://github.com/neoclide/coc.nvim.git', {'branch': 'release'}
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

# On Ubuntu, I use coc.nvim only for tex files
nvim tmp.tex +"CocInstall coc-texlab" +qa;

# For Termux only
nvim tmp +"CocInstall coc-pyright" +qa;

# nvim-treesitter languages
nvim tmp +"TSInstall bash" +qa;
nvim tmp +"TSInstall bibtex" +qa;
nvim tmp +"TSInstall cpp" +qa;
nvim tmp +"TSInstall html" +qa;
nvim tmp +"TSInstall json" +qa;
nvim tmp +"TSInstall latex" +qa;
nvim tmp +"TSInstall python" +qa;
nvim tmp +"TSInstall yaml" +qa;
