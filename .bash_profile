
# Setting PATH for Python 3.6
# The original version is saved in .bash_profile.pysave
PATH="/Library/Frameworks/Python.framework/Versions/3.6/bin:${PATH}"

export PAT

export PS1="\[\e[31m\]\\$\[\e[m\][\[\e[31m\]\u\[\e[m\]_\[\e[31m\]\s\[\e[m\]_\[\e[31m\]\w\[\e[m\]]\[\e[33m\]_\[\e[m\]\[\e[33m\]:\[\e[m\]"

alias e="exit"
alias m="cd storage/downloads"
alias p="open ~/Desktop/lesspass/packages/lesspass-pure/src/index.html"
alias mpvc="mpv --shuffle --no-video music/classical/**/*"
alias mpva="mpv --shuffle --no-video music/**/*"
alias tree="find . -print | sed -e 's;[^/]*/;|____;g;s;____|; |;g'"

alias ls="ls -lahG"
alias ..='cd ../'                           # Go back 1 directory level
alias ...='cd ../../'                       # Go back 2 directory levels
alias .3='cd ../../../'                     # Go back 3 directory levels
alias .4='cd ../../../../'                  # Go back 4 directory levels
alias .5='cd ../../../../../'               # Go back 5 directory levels
alias .6='cd ../../../../../../'            # Go back 6 directory levels

alias cleanupDS="find . -type f -name '*.DS_Store' -ls -delete"
alias rmtrash="rm -rf ~/.Trash/*"

alias gits="git status"
alias gitp="git pull"
alias gitc="git cherry -v"
gitd() {
    git add -A; git commit -m "Done"; git push
}

# Recursive
#	find . -name "*.bak" -type f
#	find . -name "*.bak" -type f -delete
rmtex() {
    rm *.aux; rm *.log; rm *.out; rm *.toc; rm *.bbl; rm *.blg; rm *.synctex.gz
}

compiletex() {
    # pdflatex $1; bibtex $1; pdflatex $1; pdflatex $1
    pdflatex $1; pdflatex $1; pdflatex $1
}

openfi() {
    open -a /Applications/Firefox.app/ $1
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


