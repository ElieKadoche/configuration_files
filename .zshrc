plugins=(
    autopep8
    colored-man-pages
    colorize
    cp
    extract
    pep8
    pip
    python
    rand-quote
    vi-mode
    web-search
)

# System specific
# ------------------------------------------

# 0 for MacOS, 1 for Ubuntu, 2 for Termux
SYSTEM="1"

if [ "$SYSTEM" = "0" ]; then
    # Path to your oh-my-zsh installation.
    export ZSH="/Users/eliekadoche/.oh-my-zsh"
    ORIGIN="/Volumes/marvin_data"
    alias rmdsstore="find . -type f -name '*.DS_Store' -ls -delete"
    openfi() {open -a /Applications/Firefox.app/ $1}

elif [ "$SYSTEM" = "1" ]; then
    export ZSH="/home/elie_kadoche/.oh-my-zsh"
    ORIGIN="/home/elie_kadoche/data"
    eval $(/home/linuxbrew/.linuxbrew/bin/brew shellenv)
    export PATH="/home/elie_kadoche/.local/bin:$PATH"
    alias pbcopy="xclip -selection clipboard"
    alias pbpaste="xclip -selection clipboard -o"
    alias xx="xtrlock"
    alias open="xdg-open"
    export LD_LIBRARY_PATH="/usr/lib/cuda/lib64:/usr/lib/cuda/include:$LD_LIBRARY_PATH"

elif [ "$SYSTEM" = "2" ]; then
    # Path to your oh-my-zsh installation.
    export ZSH="/data/data/com.termux/files/home/.oh-my-zsh"
    ORIGIN="/data/data/com.termux/files/home/storage/shared/marvin_data"
    alias pbcopy="termux-clipboard-set"
fi

# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:/usr/local/bin:$PATH

# Set name of the theme to load --- if set to "random", it will
# load a random theme each time oh-my-zsh is loaded, in which case,
# to know which specific one was loaded, run: echo $RANDOM_THEME
# See https://github.com/ohmyzsh/ohmyzsh/wiki/Themes
# ZSH_THEME="robbyrussell"

# Set list of themes to pick from when loading at random
# Setting this variable when ZSH_THEME=random will cause zsh to load
# a theme from this variable instead of looking in ~/.oh-my-zsh/themes/
# If set to an empty array, this variable will have no effect.
# ZSH_THEME_RANDOM_CANDIDATES=( "robbyrussell" "agnoster" )

# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment the following line to use hyphen-insensitive completion.
# Case-sensitive completion must be off. _ and - will be interchangeable.
HYPHEN_INSENSITIVE="true"

# Uncomment the following line to disable bi-weekly auto-update checks.
# DISABLE_AUTO_UPDATE="true"

# Uncomment the following line to automatically update without prompting.
# DISABLE_UPDATE_PROMPT="true"

# Uncomment the following line to change how often to auto-update (in days).
# export UPDATE_ZSH_DAYS=13

# Uncomment the following line if pasting URLs and other text is messed up.
# DISABLE_MAGIC_FUNCTIONS=true

# Uncomment the following line to disable colors in ls.
# DISABLE_LS_COLORS="true"

# Uncomment the following line to disable auto-setting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment the following line to enable command auto-correction.
# ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
# COMPLETION_WAITING_DOTS="true"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Uncomment the following line if you want to change the command execution time
# stamp shown in the history command output.
# You can set one of the optional three formats:
# "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
# or set a custom format using the strftime function format specifications,
# see 'man strftime' for details.
# HIST_STAMPS="mm/dd/yyyy"

# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=/path/to/new-custom-folder

# Which plugins would you like to load?
# Standard plugins can be found in ~/.oh-my-zsh/plugins/*
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
# plugins=(git)

source $ZSH/oh-my-zsh.sh

# User configuration

export MANPATH="/usr/local/man:$MANPATH"

# You may need to manually set your language environment
export LANG=en_US.UTF-8

# Preferred editor for local and remote sessions
# if [[ -n $SSH_CONNECTION ]]; then
#   export EDITOR="vim"
# else
#   export EDITOR="mvim"
# fi

# Compilation flags
export ARCHFLAGS="-arch x86_64"

# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.
#
# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"

# My custom .zshrc
# ------------------------------------------

PROMPT="%F{red}%n%f%F{green}[%f%F{cyan}%D%f%F{blue}--%f%F{cyan}%T%f%F{green}]%f%F{magenta}%~%f%F{green}$%f"
# PROMPT="%F{red}%n%f%F{green}[%f%F{cyan}%D%f%F{blue}--%f%F{cyan}%T%f%F{green}]%B%F{yellow}[MARVIN]%b%f%F{magenta}%~%f%F{green}$%f"  # Only for server

alias vim=nvim
alias python="python3"
alias pip="pip3"

if [ "$SYSTEM" != "2" ]; then
    eval $(thefuck --alias)
    eval $(thefuck --alias damn)
fi

if [ "$SYSTEM" = "0" ]; then
    alias ls="gls --all \
                  --author \
                  --color=auto \
                  --group-directories-first \
                  --human-readable \
                  --size \
                  -l"
else
    alias ls="ls --all \
                  --author \
                  --color=auto \
                  --group-directories-first \
                  --human-readable \
                  --size \
                  -lv"
fi

alias m="cd $ORIGIN"
alias e="exit"
alias ..="cd ../"
alias ...="cd ../../"
alias du="du -shc * | sort -h"
alias grep="grep --color=auto"
alias rmtrash="rm -rf ~/.Trash/*"
alias rm__="find . -name '._*' -ls -delete"
alias lpl="python $ORIGIN/git_apps/lesspass/cli/lesspass/core.py"
alias mpva="mpv --shuffle --no-video $ORIGIN/music/**/*"
alias mpvo="mpv --shuffle --no-video $ORIGIN/music/others/**/*"
alias mpvc="mpv --shuffle --no-video $ORIGIN/music/classical/**/*"
alias gitp="git pull"
alias gits="git status"
alias gitc="git cherry -v"
alias gitu="git config --get remote.origin.url"

gitd() {
    git add -A; git commit -m "Done"; git push
}

gitpp() {
    for i in */.git; do ( echo $i; cd $i/..; git pull; ); done
}

gitss() {
    for i in */.git; do ( echo "-----> " $i; cd $i/../; git status; ); done
}

# Special grep for projects
grepp() {
    grep -R "$1" . --exclude-dir={.git,docs,ressources,data,materials}
}

pyclean() {
    find . -name "*.pyc" -ls -delete;
    find . -name "__pycache__" -ls -delete;
    find . -name ".pytest_cache" -exec rm -rf "{}" \;
}

# youtube-dl -F to see formats
yyy() {
    youtube-dl --output "%(title)s.mp3" $1 -f 251 -x --audio-format "mp3" --rm-cache-dir
}

# Create a password of size $1
pwgenn() {
    pwgen -cny --secure $1 1 | pbcopy
}

rmtex() {
    rm *.aux;
    rm *.log;
    rm *.out;
    rm *.toc;
    rm *.bbl;
    rm *.blg;
    rm *.synctex.gz;
    rm *.acn;
    rm *.acr;
    rm *.alg;
    rm *.bcf;
    rm *.glg;
    rm *.glo;
    rm *.gls;
    rm *.ist;
    rm *.run.xml;
    rm *.nav;
    rm *.snm;
    rm *.vrb;
}

getHistory() {
    history | awk '{print $2}' | sort | uniq -c | sort -nr | head -n $1
}

compiletex() {
    pdflatex "$1.tex";
    bibtex "$1";
    # biber "$1";  # Both are usuable, depending on how the bibliography is made
    makeglossaries "$1";
    pdflatex "$1.tex";
    pdflatex "$1.tex";
}

# findPid: find out the pid of a specified process
# Note that the command name can be specified via a regex
# E.g. findPid '/d$/' finds pids of all processes with names ending in 'd'
# Without the 'sudo' it will only find processes of the current user
findPID () { lsof -t -c "$@" ; }

findSameExtension() {
    find . -iname \*.$1
}

renameSameExtension() {
    # ls -tr: oldest modified file will have index 0
    ls -tr | find . -regex "...*" | cat -n | while read n f; do mv "$f" `printf "%d_$1.${f##*.}" $n-1`; done

}

# Git master
# ------------------------------------------

_private_gitpp() {
    cd $1;
    for i in */.git; do (
        echo $i;
        echo "------------------------------------------"
        cd $i/..;
        git $2;
        echo "";
    );
    done
}

# Argument is the command to execute (status, pull, etc.)
master_git() {
    _private_gitpp $ORIGIN/git_apps $1;
    _private_gitpp $ORIGIN/git_apps/0_personnal_projects $1;
    _private_gitpp $ORIGIN/git_apps/1_git_others $1;
    _private_gitpp $ORIGIN $1;
    cd $ORIGIN;
}

# Master compile
# ------------------------------------------

master_compile() {
    # Lesspass
    python3 -m pip install $ORIGIN/git_apps/lesspass/cli;

    if [ "$SYSTEM" != "2" ]; then
        # YouCompleteMe
        python3 ~/.config/nvim/plugged/YouCompleteMe/install.py --all;

        # Sabaki
        cd $ORIGIN/git_apps/Sabaki;
        npm install;
        npm run build;

        # Katago
        cd $ORIGIN/git_apps/KataGo/cpp;
        if [ -d "./build" ]; then rm -rf ./build; fi
        mkdir build; cd build;
        cmake .. -DUSE_BACKEND=CUDA -DCUDNN_INCLUDE_DIR=/home/elie_kadoche/data/miscellaneous/cudnn-10.2-linux-x64-v7.6.5.32/cuda/include -DCUDNN_LIBRARY=/home/elie_kadoche/data/miscellaneous/cudnn-10.2-linux-x64-v7.6.5.32/cuda/lib64/libcudnn.so
        # When Katago will work with cuDNN 8*
        # cmake .. -DUSE_BACKEND=CUDA -DCUDNN_INCLUDE_DIR=/usr/lib/cuda/include -DCUDNN_LIBRARY=/usr/lib/cuda/lib64/libcudnn.so
        make;

        if [ "$SYSTEM" = "1" ]; then
            cd $ORIGIN/git_apps/materia-theme;
            sudo ./install.sh --color dark --size compact;

            cd $ORIGIN/git_apps/dash-to-dock;
            make;
            make install;
            killall -3 gnome-shell;
        fi
    fi
    cd $ORIGIN;
}

# Master update
# ------------------------------------------

master_update() {
    if [ "$SYSTEM" = "2" ]; then
        # Termux
        pkg upgrade;
        pkg update;

    else
        # Node
        npm install -g npm;

        # Homebrew
        brew update;
        brew upgrade;
        brew cleanup;
        brew doctor;

        if [ "$SYSTEM" = "0" ]; then
            # MacOS
            brew cask upgrade --greedy;
            softwareupdate --install --all;

        elif [ "$SYSTEM" = "1" ]; then
            # Ubuntu
            sudo apt update;
            sudo apt upgrade;
            sudo snap refresh;
            sudo apt dist-upgrade;
        fi
    fi

    # Global
    upgrade_oh_my_zsh;
    python3 -m pip install --upgrade pip;
    pip-review --local --auto;
    vim +"PlugUpgrade" +qa;
    vim +"PlugUpdate" +qa;
    vim +"PlugClean" +qa;
    vim +"PlugInstall" +qa;
}

# Master all
# ------------------------------------------

master_all() {
    master_git pull;
    master_git status;
    master_update;
    master_compile;
}

source $ORIGIN/git_apps/zsh-autosuggestions/zsh-autosuggestions.zsh
source $ORIGIN/git_apps/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
