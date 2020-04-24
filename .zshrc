plugins=(
    autopep8
    brew
    colored-man-pages
    colorize
    cp
    extract
    osx
    pep8
    pip
    python
    rand-quote
    vi-mode
    web-search
)

# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:/usr/local/bin:$PATH

# Path to your oh-my-zsh installation. MacOS or Termux
# ------------------------------------------
export ZSH="/Users/eliekadoche/.oh-my-zsh"
# export ZSH="/data/data/com.termux/files/home/.oh-my-zsh"
# ------------------------------------------

# Set name of the theme to load --- if set to "random", it will
# load a random theme each time oh-my-zsh is loaded, in which case,
# to know which specific one was loaded, run: echo $RANDOM_THEME
# See https://github.com/ohmyzsh/ohmyzsh/wiki/Themes
ZSH_THEME="robbyrussell"

# Set list of themes to pick from when loading at random
# Setting this variable when ZSH_THEME=random will cause zsh to load
# a theme from this variable instead of looking in ~/.oh-my-zsh/themes/
# If set to an empty array, this variable will have no effect.
# ZSH_THEME_RANDOM_CANDIDATES=( "robbyrussell" "agnoster" )

# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment the following line to use hyphen-insensitive completion.
# Case-sensitive completion must be off. _ and - will be interchangeable.
# HYPHEN_INSENSITIVE="true"

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
if [[ -n $SSH_CONNECTION ]]; then
  export EDITOR='vim'
else
  export EDITOR='mvim'
fi

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

# ------------------------------------------
# ------------------------------------------

PROMPT="%F{red}%n%f%F{green}[%f%F{cyan}%D%f%F{blue}--%f%F{cyan}%T%f%F{green}]%f%F{magenta}%~%f%F{green}$%f"

alias python="python3"
alias pip="pip3"

# For Termux only
# ------------------------------------------
# alias pbcopy="termux-clipboard-set"
# ------------------------------------------

# Main directory. MacOS or Termux
# ------------------------------------------
# alias m="cd /data/data/com.termux/files/home/storage/shared/marvin_data"
alias m="cd /Volumes/marvin_data"
# ------------------------------------------

# MacOS only
# ------------------------------------------
alias tree="find . -print | sed -e 's;[^/]*/;|____;g;s;____|; |;g'"
alias rmtrash="rm -rf ~/.Trash/*"
# ------------------------------------------

# For Termux, change gls to ls
# ------------------------------------------
alias ls="gls --all \
              --author \
              --color=auto \
              --group-directories-first \
              --human-readable \
              --size \
              -l"

alias e="exit"
alias ..='cd ../'
alias ...='cd ../../'
alias du="du -shc * | sort -h"
alias grep="grep --color=auto"
alias lpl="python lesspass/cli/lesspass/core.py"
alias mpva="mpv --shuffle --no-video music/**/*"
alias mpvo="mpv --shuffle --no-video music/others/**/*"
alias mpvc="mpv --shuffle --no-video music/classical/**/*"
alias cleanupDS="find . -type f -name '*.DS_Store' -ls -delete"

alias gitp="git pull"
alias gits="git status"
alias gitc="git cherry -v"
gitd() { git add -A; git commit -m "Done"; git push }
gitpp() { for i in */.git; do ( echo $i; cd $i/..; git pull; ); done }

pyclean() {
    find . -name "*.pyc" -exec rm -f {} \;
    find . -name "__pycache__" -ls -delete;
}

openfi() {
    open -a /Applications/Firefox.app/ $1
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
}

compiletex() {
    pdflatex "$1.tex"; pdflatex "$1.tex"; biber "$1"; makeglossaries "$1"; pdflatex "$1.tex"
}

# findPid: find out the pid of a specified process
# Note that the command name can be specified via a regex
# E.g. findPid '/d$/' finds pids of all processes with names ending in 'd'
# Without the 'sudo' it will only find processes of the current user
findPID () { lsof -t -c "$@" ; }

findSameExtension() {
    find . -iname \*.$1
}

# Arguments: name extension beginAt
renameSameExtension() {
    a = $3
    for i in *.$2; do
        new=$(printf "$1_%d.$2" "$a")
        mv -i -- "$i" "$new"
        let a=a+1
    done
}

FILE=~/habreu
ADDRESS=""

lamgate() {
    cat $FILE | pbcopy
    ssh $ADDRESS
}
