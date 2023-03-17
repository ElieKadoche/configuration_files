# Get system
if [[ $(uname -o) = "GNU/Linux" ]]; then
    _SYSTEM="linux";
elif [[ $(uname -o) = "Android" ]]; then
    _SYSTEM="android";
elif [[ $(uname -o) = "Darwin" ]]; then
    _SYSTEM="darwin";
fi

# System specific
# ------------------------------------------
# ------------------------------------------

# Linux
if [[ $_SYSTEM = "linux" ]]; then
    ORIGIN="/home/$USERNAME/data";

    alias python="python3";
    alias pip="pip3";
    alias open="xdg-open";
    alias pbcopy="xclip -selection clipboard";
    alias pbpaste="xclip -selection clipboard -o";
    alias xx="xtrlock";

    export ZSH="/home/$USERNAME/.oh-my-zsh";
    export PATH="/home/$USERNAME/.local/bin:$PATH";
    export PATH=/usr/local/cuda/bin${PATH:+:${PATH}};
    export LD_LIBRARY_PATH=/usr/local/cuda/lib64${LD_LIBRARY_PATH:+:${LD_LIBRARY_PATH}};

# Termux (Android)
elif [[ $_SYSTEM = "android" ]]; then
    ORIGIN="/data/data/com.termux/files/home/storage/shared/data";

    alias python="python3";
    alias pip="pip3";
    alias mm="cd $ORIGIN/../Download";
    alias open="termux-open";
    alias pbcopy="termux-clipboard-set";

    export ZSH="/data/data/com.termux/files/home/.oh-my-zsh";

    # For Termux only, display (or not) extra keys
    ek() {
        if [[ "$1" = 0 ]]; then
            cfg="extra-keys = [[]]\nfullscreen = true";
        elif [[ "$1" = 1 ]]; then
            cfg="extra-keys = [['F1','F2','F3','F4','F5','F6','F9','F12'], ['ESC','ALT','FN','/','PGUP','KEYBOARD','UP','DRAWER'], ['TAB','CTRL','HOME','|','PGDN','LEFT','DOWN','RIGHT']]\nfullscreen = true";
        fi
        echo "$cfg" > ~/.termux/termux.properties;
        termux-reload-settings;
    }

# MacOS darwin (M chips)
elif [[ $_SYSTEM = "darwin" ]]; then
    ORIGIN="/Users/$USER/data"
    set termguicolors

    alias rmtrash="rm -rf ~/.Trash/*";
    alias rmdsstore="find . -type f -name '*.DS_Store' -ls -delete"
    alias python="python3.10";
    alias pip="pip3.10";

    export ZSH="/Users/elie_kadoche/.oh-my-zsh";
    export PATH="/opt/homebrew/opt/openjdk/bin:$PATH";
    export PATH="/opt/homebrew/opt/coreutils/libexec/gnubin:$PATH"
fi

# Custom prompt
PROMPT="%F{red}%n%B%F{yellow}%m%b%f%f%F{green}[%f%F{cyan}%D%f%F{blue}--%f%F{cyan}%T%f%F{green}]%F{magenta}%~%f%F{green}$%f";

# gems
export GEM_HOME="$HOME/gems"
export PATH="$HOME/gems/bin:$PATH"

# Vim bindkeys
bindkey -v;

# Colors
# ------------------------------------------
# ------------------------------------------

# Reset
Color_Off='\033[0m';   # Text Reset

# Bold
BBlack='\033[1;30m';   # Black
BRed='\033[1;31m';     # Red
BGreen='\033[1;32m';   # Green
BYellow='\033[1;33m';  # Yellow
BBlue='\033[1;34m';    # Blue
BPurple='\033[1;35m';  # Purple
BCyan='\033[1;36m';    # Cyan
BWhite='\033[1;37m';   # White

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
HYPHEN_INSENSITIVE="true";

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
HIST_STAMPS="dd/mm/yyyy";

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
    genpass
    pep8
    pip
    python
    rand-quote
    vi-mode
    web-search
)

source $ZSH/oh-my-zsh.sh;

# User configuration
export MANPATH="/usr/local/man:$MANPATH";

# You may need to manually set your language environment
export LANG=en_US.UTF-8;

# Preferred editor for local and remote sessions
# if [[ -n $SSH_CONNECTION ]]; then
#   export EDITOR="vim"
# else
#   export EDITOR="mvim"
# fi

# Compilation flags
export ARCHFLAGS="-arch x86_64";

# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.
#
# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"

# Aliases
# ------------------------------------------
# ------------------------------------------

# Complete and small ls
alias l="ls --all --author --color=auto --group-directories-first --human-readable --size -lv";
alias ll="ls -1 -a -v --group-directories-first";

# Open Firefox with default websites
alias fff="nohup firefox $ORIGIN/internet/{google/mail.html,phd/telecomparis/zimbra.html,google/calendar.html,google/contacts.html,google/scholar.html,news/lemonde.html} > /dev/null 2>&1 &; disown";

# Display markdown files in terminal
alias mdd="python -m rich.markdown";

# Music
mpva() {find $ORIGIN/music -type f -exec mpv --shuffle --no-video {} +}
mpvc() {find $ORIGIN/music/classical -type f -exec mpv --shuffle --no-video {} +}
mpvo() {find $ORIGIN/music/others -type f -exec mpv --shuffle --no-video {} +}
mpvs() {find $ORIGIN/music -type f -ipath "*$1*" -exec mpv --shuffle --no-video {} +}

# Others
alias ...="cd ../../";
alias ..="cd ../";
alias :q="exit";
alias duu="du -ah --max-depth=1 . | sort -hr";
alias e="exit";
alias lpl="python $ORIGIN/git_apps/lesspass/cli/lesspass/core.py";
alias m="cd $ORIGIN";
alias rm__="find . -name '._*' -ls -delete";
alias rmr="rm -rf";
alias src="source ~/.zshrc";
alias vim=nvim;

# Backup
# ------------------------------------------
# ------------------------------------------

# !!!!! WARNING !!!!!
# The rsync command is powerful but dangerous if misused
# Always use --dry-run if you are unsure of your actions
# Do not use rsync on git folders, use gitpp command instead
# Arguments --> $1 disk name and $2 dry (eventually)
#
# On disk
# rsync -vruh --delete --exclude={"general_files/*","git_apps/*","life_s_backup/completed/*"} $ORIGIN/ /Volumes/random_backup/data/;
#
# On disk, with same file system (add links, permissions and executability options)
# rsync -vrulpEh --delete --exclude={"general_files/*","git_apps/*","life_s_backup/completed/*"} $ORIGIN/ /Volumes/random_backup/data/;
#
# From Android to Darwin
# rsync -vruh --delete --iconv=utf-8,utf-8-mac --rsync-path=/opt/homebrew/bin/rsync --exclude={"general_files/*","git_apps/*","life_s_backup/*","miscellaneous_/*"} $_SSH_USER_NAME@$_SSH_PUBLIC_IP:~/data/ $ORIGIN/
#
# With IPv6
# rsync -vruEh --delete --exclude={"general_files/*","git_apps/*","life_s_backup/completed/*","life_s_backup/buffering/*","miscellaneous_/*"} -e "ssh -p $_SSH_PORT" "$_SSH_USER_NAME@[$_SSH_PUBLIC_IP]":~/data/ $ORIGIN/;
bbb() {
    if [[ "$2" = "dry" ]]; then
        if [[ $_SYSTEM = "android" ]]; then
            rsync -vruh --dry-run --delete --iconv=utf-8,utf-8-mac --rsync-path=/opt/homebrew/bin/rsync --exclude={"general_files/*","git_apps/*","life_s_backup/*","miscellaneous_/*"} -e "ssh -p $_SSH_PORT" $_SSH_USER_NAME@$_SSH_PUBLIC_IP:~/data/ $ORIGIN/;
        else
            rsync -vrulpEh --dry-run --delete --exclude={"general_files/*","git_apps/*","life_s_backup/completed/*"} $ORIGIN/ /Volumes/$1/data/;
        fi

    else
        if [[ $_SYSTEM = "android" ]]; then
            rsync -vruh --delete --iconv=utf-8,utf-8-mac --rsync-path=/opt/homebrew/bin/rsync --exclude={"general_files/*","git_apps/*","life_s_backup/*","miscellaneous_/*"} -e "ssh -p $_SSH_PORT" $_SSH_USER_NAME@$_SSH_PUBLIC_IP:~/data/ $ORIGIN/;
        else
            rsync -vrulpEh --delete --exclude={"general_files/*","git_apps/*","life_s_backup/completed/*"} $ORIGIN/ /Volumes/$1/data/;
        fi
    fi
}

# Functions
# ------------------------------------------
# ------------------------------------------

# Clear string: replace [spaces / tabs / new lines], special characters, etc., by _, and remove capital letters
clearString() {
    echo $1 | sed -E -e 's/ - /_/g' | sed -E -e 's/\: |\-|\, |\; |\. /_/g' | sed -E -e 's/[[:blank:]]+/_/g' | sed -e 's/\(.*\)/\L\1/' | pbcopy;
}

# Clear string of all files present in current path
clearStringAll() {
    for file_path in *; do (clearString $file_path; mv $file_path $(pbpaste)); done
}

# Clear thumbnails folders
clearThumbnails() {
    find . -name ".thumbnails" -ls -exec rm -rf "{}" \;
    find . -name ".Thumbnails" -ls -exec rm -rf "{}" \;
}

# Master command to compile latex projects (or use latexmk)
# bibtex / biber: both can be used, depending on how the bibliography is made
compiletex() {
    pdflatex "$1.tex";
    bibtex "$1";
    # biber "$1";
    makeglossaries "$1";
    pdflatex "$1.tex";
    pdflatex "$1.tex";
}

# Copy folder with progress bar
cpr() { rsync --archive --human-readable --info=progress2 $1 $2; }

# Display CSV files
csvv() { column -s, -t < $1 | less -#2 -N -S; }

# Find $1 largest files
duuu() { find . -type f -printf '%s %p\n' | sort -nr | head -$1; }

# Fatal kill
fatalKill() { ps aux | grep $1 | grep -v grep | awk '{print $2}' | xargs kill -9; }

# Kill Ray processes
fatalKillRay() {
    fatalKill ray::IDLE;
    fatalKill ray::Reanalyse;
    fatalKill ray::ReplayBuffer;
    fatalKill ray::RolloutWorker;
    fatalKill ray::SelfPlay;
    fatalKill ray::SharedStorage;
    fatalKill ray::Trainer;
}

# Find files and folders, case insensitive
findd() { find . -iname "*$1*" 2>/dev/null; }

# Find out the pid of a specified process
# Note that the command name can be specified via a regex
# E.g. findPid '/d$/' finds pids of all processes with names ending in 'd'
# Without the 'sudo' it will only find processes of the current user
findPID () { lsof -t -c "$@"; }

# Find files of a given extension
findSameExtension() { find . -iname \*.$1; }

# Get command history
getHistory() { history | awk '{print $2}' | sort | uniq -c | sort -nr | head -n $1; }

# Special grep for projects
grepp() { grep -R "$1" . --ignore-case --exclude-dir={.git,.venv,data,docs,materials,resources}; }

# Meteo
meteo() {
    curl wttr.in;
    curl v2.wttr.in/paris;
}

# Create a password of size $1
pwgenn() { pwgen -cny --secure $1 1 | pbcopy; }

# Clean Python files
pyclean() {
    find . -name "*.pyc" -ls -delete;
    find . -name "__pycache__" -ls -delete;
    find . -name ".pytest_cache" -ls -exec rm -rf "{}" \;
}

# Remove prefix from files
removePrefix() { for file in $1*; do mv "$file" "${file#$1}"; done; }

# Rename all files in a folder
# ls -tr: oldest modified file will have index 0
renameAll() {
    idx=0;
    nb_files=$(($(ls -1 | wc -l) - 1));  # Because it begins with 0
    nb_padding=$(echo "${#nb_files}");  # Number of 0 padding
    find . -maxdepth 1 -type f | xargs -r ls -tr | while read file; do
        # extension=`echo $file | sed -n -e 's/^.*\.//p'`;  # But without the point
        extension=$(python -c 'import os, sys; _, ext = os.path.splitext(sys.argv[1]); print(ext)' $file);
        idx_name=$(printf "%0${nb_padding}d\n" $idx);  # Write index with padding
        mv $file ${idx_name}_$1${extension};
        idx=$((idx+1));
    done;
}

# Clean Tex files, argument for maxdepth
rmtex() {
    find . -maxdepth $1 -name "main-blx.bib" -delete;  # Auxiliary file used by biblatex
    if [[ $_SYSTEM = "darwin" ]]; then
        find -E . -maxdepth $1 -regex ".*\.(aux|dvi|log|out|toc|bbl|blg|synctex.gz|acn|acr|alg|bcf|glg|glo|gls|ist|run.xml|nav|snm|vrb|fls|fdb_latexmk|brf|loc|soc)" -delete;
    else
        find . -maxdepth $1 -regex ".*\.\(aux\|dvi\|log\|out\|toc\|bbl\|blg\|synctex.gz\|acn\|acr\|alg\|bcf\|glg\|glo\|gls\|ist\|run.xml\|nav\|snm\|vrb\|fls\|fdb_latexmk\|brf\|loc\|soc\)" -delete;
    fi
}

# Private SSH variables are in a .zsh file located in $ZSH_CUSTOM
alias ssh0="ssh $_SSH_USER_NAME@$_SSH_PUBLIC_IP -p $_SSH_PORT";
alias sshF="sshfs $_SSH_USER_NAME@$_SSH_PUBLIC_IP: -p $_SSH_PORT ssh_folder";
alias sshX="ssh -X $_SSH_USER_NAME@$_SSH_PUBLIC_IP -p $_SSH_PORT";
sshL() { ssh -L 16006:127.0.0.1:$1 $_SSH_USER_NAME@$_SSH_PUBLIC_IP -p $_SSH_PORT; }
scpp() { scp -r -P $_SSH_PORT $1 $_SSH_USER_NAME@[$_SSH_PUBLIC_IP]:~/Downloads; }

# Functions to download videos: youtube-dl and yt-dl (much better)
_yyy() { youtube-dl --verbose --output "%(title)s.mp3" $1 -f 251 -x --audio-format "mp3" --rm-cache-dir; }
yyy() { yt-dlp --verbose --output "%(title)s.mp3" $1 -f 251 -x --audio-format "mp3" --rm-cache-dir; }


# fzf
# ------------------------------------------
# ------------------------------------------

# Find directory
cdd() {
  IFS=$'\n' directories=($(find $ORIGIN/ -type d | fzf-tmux --query="$1" --multi --select-1 --exit-0))
  [[ -n "$directories" ]] && cd "${directories[@]}"
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

# fkill - kill process (from fzf)
fkill() {
  local pid
  pid=$(ps -ef | sed 1d | fzf -m | awk '{print $2}')

  if [[ "x$pid" != "x" ]]
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

# Open files with nvim
vv() {
  IFS=$'\n' files=($(find $ORIGIN/ -type f | fzf-tmux --query="$1" --multi --select-1 --exit-0))
  [[ -n "$files" ]] && vim "${files[@]}"
}

# Master git
# ------------------------------------------
# ------------------------------------------

# Aliases
alias gitc="git cherry -v";
alias gitp="git pull";
alias gits="git status";
alias gitsi="git status --ignored";
alias gitu="git config --get remote.origin.url";

# Simple functions
gitd_() { git add -A; git commit -m "Done"; git push; }
gitpp() { for i in */.git; do ( echo $i; cd $i/..; git pull; ); done; }
gitss() { for i in */.git; do ( echo "-----> " $i; cd $i/../; git status; ); done; }

# Execute git pull on folders
_private_git_command() {
    cd $1;
    for i in */.git; do (
        printf "${BBlue}$i${Color_Off}\n";
        cd $i/..;
        git $2;
        echo "";
    );
    done
}

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

# Argument is the command to execute (status, pull, etc.)
master_git() {
    printf "\n${BPurple}------------------------------------------------------${Color_Off}\n";
    printf "${BPurple}--------------------- MASTER GIT ---------------------${Color_Off}\n";
    printf "${BPurple}------------------------------------------------------${Color_Off}\n\n";

    _private_git_command $ORIGIN/git_apps $1;
    _private_git_command $ORIGIN/git_apps/0_public $1;
    _private_git_command $ORIGIN/git_apps/1_others $1;
    _private_git_command $ORIGIN $1;

    cd $ORIGIN;
}

# Master update
# ------------------------------------------
# ------------------------------------------

master_update() {
    printf "\n${BPurple}---------------------------------------------------------${Color_Off}\n";
    printf "${BPurple}--------------------- MASTER UPDATE ---------------------${Color_Off}\n";
    printf "${BPurple}---------------------------------------------------------${Color_Off}\n\n";

    if [[ $_SYSTEM = "android" ]]; then
        # Termux (pkg)
        printf "${BBlue}PKG${Color_Off}\n\n";
        pkg upgrade -y;
        pkg update -y;

    elif [[ $_SYSTEM = "linux" ]]; then
        # Node
        printf "${BBlue}NPM${Color_Off}\n\n";
        sudo n latest;

        # APT
        printf "${BBlue}\nAPT${Color_Off}\n\n";
        sudo apt -y update;
        sudo apt -y upgrade;
        sudo apt dist-upgrade;
        # sudo update-grub;  # Only if necessary

        # Snap
        printf "${BBlue}\nSNAP${Color_Off}\n\n";
        sudo snap refresh;


    elif [[ $_SYSTEM = "darwin" ]]; then
        printf "${BBlue}darwin${Color_Off}\n\n";
        softwareupdate --install --all;

        printf "${BBlue}Homebrew${Color_Off}\n\n";
        brew update;
        brew outdated;
        brew upgrade;
        brew upgrade --cask --greedy;

        printf "${BBlue}Node.js${Color_Off}\n\n";
        npm install -g npm;

    fi

    # PIP
    printf "${BBlue}\nPIP${Color_Off}\n\n";
    python -m pip install --upgrade pip;
    pip-review --local --auto;

    # Neovim
    printf "${BBlue}\nneovim${Color_Off}\n\n";
    vim +"PlugUpgrade" +qa;
    vim +"PlugUpdate" +qa;
    vim +"PlugInstall" +qa;
    vim +"TSUpdate" +qa;

    # gems
    bundle-update;

    # Because coc is activated only for tex files
    vim tmp.tex +"CocUpdate" +qa;
}

# Master compile
# ------------------------------------------
# ------------------------------------------

master_compile() {
    printf "\n${BPurple}----------------------------------------------------------${Color_Off}\n";
    printf "${BPurple}--------------------- MASTER COMPILE ---------------------${Color_Off}\n";
    printf "${BPurple}----------------------------------------------------------${Color_Off}\n\n";

    # Lesspass
    printf "${BBlue}lesspass${Color_Off}\n\n";
    python -m pip install $ORIGIN/git_apps/lesspass/cli;

    if [[ $_SYSTEM = "linux" ]]; then
        # YouCompleteMe
        printf "${BBlue}\nYouCompleteMe${Color_Off}\n\n";
        python ~/.config/nvim/plugged/YouCompleteMe/install.py --all;

        # Neovim
        printf "${BBlue}\nneovim${Color_Off}\n\n";
        cd $ORIGIN/git_apps/neovim;
        sudo make CMAKE_BUILD_TYPE=RelWithDebInfo;
        sudo make install;

        # Sabaki
        printf "${BBlue}\nSabaki${Color_Off}\n\n";
        cd $ORIGIN/git_apps/Sabaki;
        npm install;
        npm run build;

        # scrcpy
        printf "${BBlue}\nscrcpy${Color_Off}\n\n";
        cd $ORIGIN/git_apps/scrcpy;
        ./install_release.sh;

        # Katago
        printf "${BBlue}\nKatago${Color_Off}\n\n";
        cd $ORIGIN/git_apps/KataGo/cpp;
        if [[ ! -d "./build" ]]; then mkdir build; fi
        cd build;
        cmake .. -DUSE_BACKEND=CUDA -DCUDNN_INCLUDE_DIR=/usr/local/cuda/include -DCUDNN_LIBRARY=/usr/local/cuda/lib64/libcudnn.so
        make;

        # Droidcam
        printf "${BBlue}\ndroidcam${Color_Off}\n\n";
        cd $ORIGIN/git_apps/droidcam;
        make clean;
        make droidcam-cli;
        sudo ./install-client;
        sudo ./install-video;
        sudo ./install-sound;

        # fzf
        printf "${BBlue}\nfzf${Color_Off}\n\n";
        cd $ORIGIN/git_apps/fzf;
        ./install --all --no-bash --no-zsh;
    fi

    cd $ORIGIN;
}

# Master clean
# ------------------------------------------
# ------------------------------------------

master_clean() {
    printf "\n${BPurple}--------------------------------------------------------${Color_Off}\n";
    printf "${BPurple}--------------------- MASTER CLEAN ---------------------${Color_Off}\n";
    printf "${BPurple}--------------------------------------------------------${Color_Off}\n\n";

    if [[ $_SYSTEM = "android" ]]; then
        # Termux (pkg)
        printf "${BBlue}PKG${Color_Off}\n\n";
        pkg autoclean;
        pkg clean;

    elif [[ $_SYSTEM = "linux" ]]; then
        # Node
        printf "${BBlue}NPM${Color_Off}\n\n";
        npm cache verify;
        npm cache clean;

        # Logs
        printf "${BBlue}\nLOGS${Color_Off}\n\n";
        journalctl --disk-usage;
        sudo journalctl --vacuum-time=1d;

        # APT
        printf "${BBlue}\nAPT${Color_Off}\n\n";
        sudo apt -y autoclean;
        sudo apt -y clean;
        sudo apt -y autoremove;

        # Snaps
        printf "${BBlue}\nSNAP${Color_Off}\n\n";
        LANG=en_US.UTF-8 snap list --all | awk '/disabled/{print $1, $3}' |
        while read snapname revision; do
            sudo snap remove "$snapname" --revision="$revision";
        done

    elif [[ $_SYSTEM = "darwin" ]]; then
        printf "${BBlue}\nHomebrew${Color_Off}\n\n";
        brew doctor;
        brew cleanup;
        brew autoremove;
    fi

    # PIP
    printf "${BBlue}\nPIP${Color_Off}\n\n";
    pip cache purge;

    # neovim
    printf "${BBlue}\nneovim${Color_Off}\n\n";
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
    omz update;

    if [[ $_SYSTEM = "linux" ]]; then
        sudo killall -3 gnome-shell;
    fi
}

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh;
source $ORIGIN/git_apps/zsh-autosuggestions/zsh-autosuggestions.zsh;
source $ORIGIN/git_apps/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh;

# Most used commands are kept in a custom history
# When a session is closed, history is reset to default
# zsh_history_clear is declared in a .zsh file located in $ZSH_CUSTOM
trap "zsh_history_clear" 0;
