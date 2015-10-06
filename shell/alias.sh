# enable color support of ls and also add handy aliases
alias grep='grep --color=auto'
alias fgrep='fgrep --color=auto'
alias egrep='egrep --color=auto'

###############################################################################
# System
alias fuck='sudo !!'
alias ls='ls $LS_OPTIONS'
alias ll='ls -alF'
alias la='ls -A'
alias l='ls -CF'

###############################################################################
# git
alias gst='git status'

alias ga='git add'
alias gp='git push'
alias gl='git pull'
alias gf='git fetch'

alias gc='git commit -v'
alias gca='git commit -v --amend'

alias gcv='git cherry -v'

alias gcp='git cherry-pick'
alias gcpa='git cherry-pick --abort'
alias gcpc='git cherry-pick --continue'
alias grb='git rebase -i'
alias grba='git rebase --abort'
alias grbc='git rebase --continue'

alias gd='git diff'
alias gdca='git diff --cached'

###############################################################################
compress () {
    if [ $1 ] ; then
        case $1 in
            tbz)  tar cjvf $2.tar.bz2 $2   ;;
            tgz)  tar czvf $2.tar.gz  $2   ;;
            tar)  tar cpvf $2.tar  $2      ;;
            bz2)  bzip $2                  ;;
            gz)   gzip -c -9 -n $2 > $2.gz ;;
            zip)  zip -r $2.zip $2         ;;
            7z)   7z a $2.7z $2            ;;
            *)    echo "'$1' cannot be packed via >compress<" ;;
        esac
    else
        echo "'$1' is not a valid file"
    fi
}

extract () {
    if [ -f $1 ] ; then
        case $1 in
            *.tar.bz2) tar xvjf $1   ;;
            *.tar.gz)  tar xvzf $1   ;;
            *.bz2)     bunzip2 $1    ;;
            *.rar)     unrar x $1    ;;
            *.gz)      gunzip $1     ;;
            *.tar)     tar xvf $1    ;;
            *.tbz2)    tar xvjf $1   ;;
            *.tgz)     tar xvzf $1   ;;
            *.zip)     unzip $1      ;;
            *.Z)       uncompress $1 ;;
            *.7z)      7z x $1       ;;
            *)         echo "'$1' cannot be extracted via >extract<" ;;
        esac
    else
        echo "'$1' is not a valid file"
    fi
}
