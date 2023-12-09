alias e=$EDITOR

if [[ $machine == "Linux" ]]; then
    alias o='xdg-open'
elif [[ $machine == "Mac" ]]; then
    alias o='open'
fi

# enable color support of ls and also add handy aliases
alias grep='grep --color=auto'
alias fgrep='fgrep --color=auto'
alias egrep='egrep --color=auto'

###############################################################################
# System
alias fuck='sudo !!'
alias ls='ls $LS_OPTIONS'
alias ll='ls -alhF'
alias l1='ls -1'
alias la='ls -A'
alias l='ls -CF'

alias df='df -h'
alias du='du -h'
alias less='less -M'
alias wget='wget -c'

alias sshfingerprint='ssh-keygen -l -E md5 -f'
alias sshpasswd='ssh -o PreferredAuthentications=password -o PubkeyAuthentication=no'

alias trimleft="sed 's/^[ \t]*//'"

function title() {
    echo -ne "\033]0;$1\007"
}

###############################################################################
# git
alias gst='git status'

alias ga='git add'
alias gp='git push'
alias gl='git pull'
alias gf='git fetch'

alias gc='git commit -v'
alias gca='git commit -v --amend'
alias gfx='git commit -v --fixup'
alias gtemp='git commit -v --no-verify -m temp'

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
# virtualbox

virtstart () {
    VBoxManage startvm $1 --type headless
}

virtstop () {
    VBoxManage controlvm $1 poweroff
}

###############################################################################
# utils

alias servehttp='python -m SimpleHTTPServer'
alias wttr='curl wttr.in/saint-petersburg'
alias ipexternal='curl ident.me'

retinafy () {
    convert $1 -filter point -resize 200% $2
}

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

###############################################################################
# npm

# link npm package without npm install
npml () {
    node_modules_path="$(npm prefix -g)/lib/node_modules"
    package_name=$(npm run env | grep "npm_package_name" | cut -d "=" -f 2)

    echo "npm link ${package_name} with no install to ${node_modules_path}..."

    scope=$(dirname ${package_name})

    if [ -n "${scope}" ]; then
        mkdir -p ${node_modules_path}/${scope}
    fi

    ln -sfn $PWD ${node_modules_path}/${package_name}

    echo "Successfully linked ${package_name} to ${node_modules_path}/${package_name}"
}

###############################################################################
# nginx logs

alias nglog='tail -f /var/log/nginx/access.log'
alias ngerr='tail -f /var/log/nginx/error.log'
