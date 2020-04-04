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

# System-wide profile for interactive zsh(1) shells.

# Setup user specific overrides for this in ~/.zhsrc. See zshbuiltins(1)
# and zshoptions(1) for more details.

# Correctly display UTF-8 with combining characters.
if [[ "$(locale LC_CTYPE)" == "UTF-8" ]]; then
    setopt COMBINING_CHARS
fi

# Disable the log builtin, so we don't conflict with /usr/bin/log
disable log

# Save command history
HISTFILE=${ZDOTDIR:-$HOME}/.zsh_history
HISTSIZE=2000
SAVEHIST=1000

# Beep on error
setopt BEEP

export ZSH="$HOME/.oh-my-zsh"
source $ZSH/oh-my-zsh.sh

# Use keycodes (generated via zkbd) if present, otherwise fallback on
# values from terminfo
if [[ -r ${ZDOTDIR:-$HOME}/.zkbd/${TERM}-${VENDOR} ]] ; then
    source ${ZDOTDIR:-$HOME}/.zkbd/${TERM}-${VENDOR}
else
    typeset -g -A key

    [[ -n "$terminfo[kf1]" ]] && key[F1]=$terminfo[kf1]
    [[ -n "$terminfo[kf2]" ]] && key[F2]=$terminfo[kf2]
    [[ -n "$terminfo[kf3]" ]] && key[F3]=$terminfo[kf3]
    [[ -n "$terminfo[kf4]" ]] && key[F4]=$terminfo[kf4]
    [[ -n "$terminfo[kf5]" ]] && key[F5]=$terminfo[kf5]
    [[ -n "$terminfo[kf6]" ]] && key[F6]=$terminfo[kf6]
    [[ -n "$terminfo[kf7]" ]] && key[F7]=$terminfo[kf7]
    [[ -n "$terminfo[kf8]" ]] && key[F8]=$terminfo[kf8]
    [[ -n "$terminfo[kf9]" ]] && key[F9]=$terminfo[kf9]
    [[ -n "$terminfo[kf10]" ]] && key[F10]=$terminfo[kf10]
    [[ -n "$terminfo[kf11]" ]] && key[F11]=$terminfo[kf11]
    [[ -n "$terminfo[kf12]" ]] && key[F12]=$terminfo[kf12]
    [[ -n "$terminfo[kf13]" ]] && key[F13]=$terminfo[kf13]
    [[ -n "$terminfo[kf14]" ]] && key[F14]=$terminfo[kf14]
    [[ -n "$terminfo[kf15]" ]] && key[F15]=$terminfo[kf15]
    [[ -n "$terminfo[kf16]" ]] && key[F16]=$terminfo[kf16]
    [[ -n "$terminfo[kf17]" ]] && key[F17]=$terminfo[kf17]
    [[ -n "$terminfo[kf18]" ]] && key[F18]=$terminfo[kf18]
    [[ -n "$terminfo[kf19]" ]] && key[F19]=$terminfo[kf19]
    [[ -n "$terminfo[kf20]" ]] && key[F20]=$terminfo[kf20]
    [[ -n "$terminfo[kbs]" ]] && key[Backspace]=$terminfo[kbs]
    [[ -n "$terminfo[kich1]" ]] && key[Insert]=$terminfo[kich1]
    [[ -n "$terminfo[kdch1]" ]] && key[Delete]=$terminfo[kdch1]
    [[ -n "$terminfo[khome]" ]] && key[Home]=$terminfo[khome]
    [[ -n "$terminfo[kend]" ]] && key[End]=$terminfo[kend]
    [[ -n "$terminfo[kpp]" ]] && key[PageUp]=$terminfo[kpp]
    [[ -n "$terminfo[knp]" ]] && key[PageDown]=$terminfo[knp]
    [[ -n "$terminfo[kcuu1]" ]] && key[Up]=$terminfo[kcuu1]
    [[ -n "$terminfo[kcub1]" ]] && key[Left]=$terminfo[kcub1]
    [[ -n "$terminfo[kcud1]" ]] && key[Down]=$terminfo[kcud1]
    [[ -n "$terminfo[kcuf1]" ]] && key[Right]=$terminfo[kcuf1]
fi

# Default key bindings
[[ -n ${key[Delete]} ]] && bindkey "${key[Delete]}" delete-char
[[ -n ${key[Home]} ]] && bindkey "${key[Home]}" beginning-of-line
[[ -n ${key[End]} ]] && bindkey "${key[End]}" end-of-line
[[ -n ${key[Up]} ]] && bindkey "${key[Up]}" up-line-or-search
[[ -n ${key[Down]} ]] && bindkey "${key[Down]}" down-line-or-search

# Default prompt
PS1="%n@%m %1~ %# "

# Useful support for interacting with Terminal.app or other terminal programs
[ -r "/etc/zshrc_$TERM_PROGRAM" ] && . "/etc/zshrc_$TERM_PROGRAM"

########################################################
########################################################
########################################################
########################################################

PROMPT="%F{red}%n%f%F{green}[%f%F{cyan}%D%f%F{blue}--%f%F{cyan}%T%f%F{green}]%f%F{magenta}%~%f%F{green}$%f"

# For Termux only
# alias pbcopy="termux-clipboard-set"
# alias lpl="python ~/storage/downloads/lesspass/cli/lesspass/core.py"
# alias m="cd storage/downloads"

alias e="exit"
alias ..='cd ../'
alias ...='cd ../../'
alias ls="ls -lahGF"
alias grep="grep --color=auto"
alias rmtrash="rm -rf ~/.Trash/*"
alias mpva="mpv --shuffle --no-video music/**/*"
alias mpvo="mpv --shuffle --no-video music/others/**/*"
alias mpvc="mpv --shuffle --no-video music/classical/**/*"
alias lpl="python ~/Desktop/lesspass/cli/lesspass/core.py"
alias cleanupDS="find . -type f -name '*.DS_Store' -ls -delete"
alias tree="find . -print | sed -e 's;[^/]*/;|____;g;s;____|; |;g'"

alias gitp="git pull"
alias gits="git status"
alias gitc="git cherry -v"
gitd() { git add -A; git commit -m "Done"; git push }
gitpp() { for i in */.git; do ( echo $i; cd $i/..; git pull; ); done }

pyclean() {
    find . -name "*.pyc" -exec rm -f {} \;
}

openfi() {
    open -a /Applications/Firefox.app/ $1
}

rmtex() {
    rm *.aux; rm *.log; rm *.out; rm *.toc; rm *.bbl; rm *.blg; rm *.synctex.gz
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
