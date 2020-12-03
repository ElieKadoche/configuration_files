# System specific
# ------------------------------------------
# ------------------------------------------

# MacOS
# CAREFUL: not actively maintained
if [ "$OSTYPE" = "darwin" ]; then
    SYSTEM="0"
    ORIGIN="/Volumes/marvin_data"
    export ZSH="/Users/eliekadoche/.oh-my-zsh"
    PROMPT="%F{red}%n%B%F{yellow}MacOS%b%f%f%F{green}[%f%F{cyan}%D%f%F{blue}--%f%F{cyan}%T%f%F{green}]%F{magenta}%~%f%F{green}$%f"

    alias rmtrash="rm -rf ~/.Trash/*"
    openfi() {open -a /Applications/Firefox.app/ $1}
    alias rmdsstore="find . -type f -name '*.DS_Store' -ls -delete"

# Ubuntu
elif [ "$OSTYPE" = "linux-gnu" ]; then
    SYSTEM="1"
    ORIGIN="/home/elie_kadoche/data"
    export ZSH="/home/elie_kadoche/.oh-my-zsh"
    PROMPT="%F{red}%n%B%F{yellow}MARVIN%b%f%f%F{green}[%f%F{cyan}%D%f%F{blue}--%f%F{cyan}%T%f%F{green}]%F{magenta}%~%f%F{green}$%f"

    alias xx="xtrlock"
    alias open="xdg-open"
    alias pbcopy="xclip -selection clipboard"
    alias pbpaste="xclip -selection clipboard -o"
    export PATH="/home/elie_kadoche/.local/bin:$PATH"
    eval $(/home/linuxbrew/.linuxbrew/bin/brew shellenv)

    export LD_LIBRARY_PATH="/usr/lib/cuda/lib64:/usr/lib/cuda/include:$LD_LIBRARY_PATH"
    export LD_LIBRARY_PATH="/home/elie_kadoche/data/miscellaneous/cudnn-10.2-linux-x64-v7.6.5.32/cuda/lib64:/home/elie_kadoche/data/miscellaneous/cudnn-10.2-linux-x64-v7.6.5.32/cuda/include:$LD_LIBRARY_PATH"

# Termux (Android)
elif [ "$OSTYPE" = "linux-android" ]; then
    SYSTEM="2"
    export ZSH="/data/data/com.termux/files/home/.oh-my-zsh"
    ORIGIN="/data/data/com.termux/files/home/storage/shared/marvin_data"
    PROMPT="%F{red}%n%B%F{yellow}termux%b%f%f%F{green}[%f%F{cyan}%D%f%F{blue}--%f%F{cyan}%T%f%F{green}]%F{magenta}%~%f%F{green}$%f"

    alias pbcopy="termux-clipboard-set"
fi

# From template
# ------------------------------------------
# ------------------------------------------

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
HIST_STAMPS="dd/mm/yyyy"

# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=/path/to/new-custom-folder

# Which plugins would you like to load?
# Standard plugins can be found in ~/.oh-my-zsh/plugins/*
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
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
# ------------------------------------------

# Vim bindkeys
bindkey -v

# TheFuck
if [ "$SYSTEM" != "2" ]; then
    eval $(thefuck --alias)
    eval $(thefuck --alias damn)
fi

# Small ls
alias ll="ls -1 -a --group-directories-first"

# Complete ls
if [ "$SYSTEM" = "0" ]; then
    alias l="gls --all --author --color=auto --group-directories-first --human-readable --size -l"
else
    alias l="ls --all --author --color=auto --group-directories-first --human-readable --size -lv"
fi

# Git
alias gitp="git pull"
alias gits="git status"
alias gitc="git cherry -v"
alias gitu="git config --get remote.origin.url"
gitd() {git add -A; git commit -m "Done"; git push}
gitpp() {for i in */.git; do ( echo $i; cd $i/..; git pull; ); done}
gitss() {for i in */.git; do ( echo "-----> " $i; cd $i/../; git status; ); done}

# Music
alias mpva="mpv --shuffle --no-video $ORIGIN/music/**/*"
alias mpvo="mpv --shuffle --no-video $ORIGIN/music/others/**/*"
alias mpvc="mpv --shuffle --no-video $ORIGIN/music/classical/**/*"

# Others
alias ...="cd ../../"
alias ..="cd ../"
alias du="du -ah --max-depth=1 . | sort -hr"
alias e="exit"
alias grep="grep --color=auto"
alias lpl="python $ORIGIN/git_apps/lesspass/cli/lesspass/core.py"
alias m="cd $ORIGIN"
alias pip="pip3"
alias python="python3"
alias rm__="find . -name '._*' -ls -delete"
alias rmr="rm -rf"
alias src="source ~/.zshrc"
alias vim=nvim

# Find files of a given extension
findSameExtension() {find . -iname \*.$1}

# Create a password of size $1
pwgenn() {pwgen -cny --secure $1 1 | pbcopy}

# Copy folder with progress bar
cpr() {rsync --archive --human-readable --info=progress2 $1 $2}

# Special grep for projects
grepp() {grep -R "$1" . --exclude-dir={.git,docs,ressources,data,materials}}

# Fatal kill
fatalKill() {ps aux | grep $1 | grep -v grep | awk '{print $2}' | xargs kill -9}

# Get command history
getHistory() {history | awk '{print $2}' | sort | uniq -c | sort -nr | head -n $1}

# youtube-dl -F to see formats
yyy() {youtube-dl --output "%(title)s.mp3" $1 -f 251 -x --audio-format "mp3" --rm-cache-dir}

# Clean Tex files
rmtex() {find . -maxdepth 1 -regex ".*\.\(aux\|log\|out\|toc\|bbl\|blg\|synctex.gz\|acn\|acr\|alg\|bcf\|glg\|glo\|gls\|ist\|run.xml\|nav\|snm\|vrb\|fls\|fdb_latexmk\)" -delete}

# Find out the pid of a specified process
# Note that the command name can be specified via a regex
# E.g. findPid '/d$/' finds pids of all processes with names ending in 'd'
# Without the 'sudo' it will only find processes of the current user
findPID () { lsof -t -c "$@" ; }

# Send computer to sleep
dodo() {
    t=`echo "scale=0;$2*3600/1" | bc`;
    sudo sleep $1;
    sudo rtcwake -m mem -s $t -v;
}

# Clean Python files
pyclean() {
    find . -name "*.pyc" -ls -delete;
    find . -name "__pycache__" -ls -delete;
    find . -name ".pytest_cache" -exec rm -rf "{}" \;
}

# Rename all files in a folder
# ls -tr: oldest modified file will have index 0
renameAll() {
    IDX=0;
    find . -type f | ls -tr | while read FILE; do
        # EXTENSION=`echo $FILE | sed -n -e 's/^.*\.//p'`;  # But without the point
        EXTENSION=$(python -c 'import os, sys; _, ext = os.path.splitext(sys.argv[1]); print(ext)' $FILE);
        mv $FILE ${IDX}_$1${EXTENSION};
        IDX=$((IDX+1));
    done;
}

# Clear string: replace [spaces / tabs / new lines], special characters, etc., by _, and remove capital letters
clearString() {
    echo $1 | sed -E -e 's/\: |\-|\, |\; |\. /_/g' | sed -E -e 's/[[:blank:]]+/_/g' | sed -e 's/\(.*\)/\L\1/' | pbcopy
}

# Master command to compile latex projects
compiletex() {
    pdflatex "$1.tex";
    # bibtex "$1";
    biber "$1";  # Both can be used, depending on how the bibliography is made
    makeglossaries "$1";
    pdflatex "$1.tex";
    pdflatex "$1.tex";
}

# Kill Ray processes
fatalKillRay() {
    fatalKill ray::ReplayBuffer;
    fatalKill ray::SharedStorage;
    fatalKill ray::IDLE;
    fatalKill ray::Trainer;
    fatalKill ray::Reanalyse;
    fatalKill ray::SelfPlay;
}

# Fix zsh_history file
zsh_history_fix() {
    cd ~
    mv .zsh_history .zsh_history_bad
    strings .zsh_history_bad > .zsh_history
    fc -R .zsh_history
    rm .zsh_history_bad
}

# Start KataGo on KGS
startKataWhat() {
    cd $ORIGIN/miscellaneous/KataWhatBot;
    nohup java -jar /home/elie_kadoche/data/miscellaneous/KataWhatBot/kgsGtp.jar /home/elie_kadoche/data/miscellaneous/KataWhatBot/config.properties &;
    cd $ORIGIN;
}

# fzf
# ------------------------------------------
# ------------------------------------------

# Open files with nvim
vv() {
  IFS=$'\n' files=($(find $ORIGIN/ -type f | fzf-tmux --query="$1" --multi --select-1 --exit-0))
  [[ -n "$files" ]] && vim "${files[@]}"
}

# fkill - kill process (from fzf)
fkill() {
  local pid
  pid=$(ps -ef | sed 1d | fzf -m | awk '{print $2}')

  if [ "x$pid" != "x" ]
  then
    echo $pid | xargs kill -${1:-9}
  fi
}

# fshow - git commit browser (from fzf)
fshow() {
  git log --graph --color=always \
      --format="%C(auto)%h%d %s %C(black)%C(bold)%cr" "$@" |
  fzf --ansi --no-sort --reverse --tiebreak=index --bind=ctrl-s:toggle-sort \
      --bind "ctrl-m:execute:
                (grep -o '[a-f0-9]\{7\}' | head -1 |
                xargs -I % sh -c 'git show --color=always % | less -R') << 'FZF-EOF'
                {}
FZF-EOF"
}

# Open firefox favorites with fzf
ff() {
  IFS=$'\n' files=($(find $ORIGIN/internet  -name "*.html"| fzf-tmux --query="$1" --multi --select-1 --exit-0))
  [[ -n "$files" ]] && firefox "${files[@]}"
}

# Open firefox favorites with fzf (private window)
ffp() {
  IFS=$'\n' files=($(find $ORIGIN/internet  -name "*.html"| fzf-tmux --query="$1" --multi --select-1 --exit-0))
  [[ -n "$files" ]] && firefox --private-window "${files[@]}"
}

# SSH aliases
# ------------------------------------------
# ------------------------------------------

# Private SSH variables are in a .zsh file located in $ZSH_CUSTOM

# Public IP
alias ssh0="ssh $_SSH_USER_NAME@$_SSH_PUBLIC_IP -p $_SSH_PORT"
alias sshX="ssh -X $_SSH_USER_NAME@$_SSH_PUBLIC_IP -p $_SSH_PORT"
alias sshL="ssh -L 16006:127.0.0.1:6006 $_SSH_USER_NAME@$_SSH_PUBLIC_IP -p $_SSH_PORT"
alias sshF="sshfs $_SSH_USER_NAME@$_SSH_PUBLIC_IP: -p $_SSH_PORT ssh_folder"

# Master git
# ------------------------------------------
# ------------------------------------------

# Clear all Git history
_removeGithistory() {
    URL_GIT=$(gitu)
    rmr .git;
    git init;
    git add .;
    git commit -m "Initial commit";
    git remote add origin $URL_GIT;
    git push --mirror --force;
}

# Execute git pull on folders
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
    _private_gitpp $ORIGIN/git_apps/0_public $1;
    _private_gitpp $ORIGIN/git_apps/1_others $1;
    _private_gitpp $ORIGIN $1;
    cd $ORIGIN;
}

# Master update
# ------------------------------------------
# ------------------------------------------

master_update() {
    if [ "$SYSTEM" = "2" ]; then
        # Termux
        pkg upgrade -y;
        pkg update -y;

    else
        # Node
        npm install -g npm;

        # Homebrew
        brew update;
        brew upgrade;
        brew doctor;

        if [ "$SYSTEM" = "0" ]; then
            # MacOS
            brew cask upgrade --greedy;
            softwareupdate --install --all;

        elif [ "$SYSTEM" = "1" ]; then
            # Ubuntu
            sudo apt -y update;
            sudo apt -y upgrade;
            sudo snap refresh;
            sudo apt dist-upgrade;
            # sudo update-grub;  # Only if necessary
        fi
    fi

    # Global
    omz update;
    python3 -m pip install --upgrade pip;
    pip-review --local --auto;
    vim +"PlugUpgrade" +qa;
    vim +"PlugUpdate" +qa;
    vim +"PlugInstall" +qa;
    vim +"CocUpdate" +qa;
}

# Master compile
# ------------------------------------------
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

        # fzf
        cd $ORIGIN/git_apps/fzf;
        ./install --all --no-bash --no-zsh;

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

# Master clean
# ------------------------------------------
# ------------------------------------------

master_clean() {
    if [ "$SYSTEM" = "2" ]; then
        # Termux
        pkg autoclean;
        pkg clean;

    else
        # Node
        npm cache clean;

        # Homebrew
        brew cleanup;

        # Logs
        journalctl --disk-usage
        sudo journalctl --vacuum-time=1d

        if [ "$SYSTEM" = "1" ]; then
            # Ubuntu
            sudo apt -y autoclean;
            sudo apt -y clean;
            sudo apt -y autoremove;

            # Snaps
            LANG=en_US.UTF-8 snap list --all | awk '/disabled/{print $1, $3}' |
            while read snapname revision; do
                sudo snap remove "$snapname" --revision="$revision";
            done
        fi
    fi

    # Global
    pip cache purge
    vim +"PlugClean" +qa;
}

# Master all
# ------------------------------------------
# ------------------------------------------

master_all() {
    master_git pull;
    master_git status;
    master_update;
    master_compile;
    master_clean;
}

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
source $ORIGIN/git_apps/zsh-autosuggestions/zsh-autosuggestions.zsh
source $ORIGIN/git_apps/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
