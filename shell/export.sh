export EDITOR=vim
export LESSCHARSET=utf-8

export LS_COLORS=$LS_COLORS:'di=34:fi=0:ln=4:or=33:ex=35'
# on Mac OS X you should install coreutils
export LS_OPTIONS='--color'

export GOPATH="$HOME/go"
export PATH="$PATH:$GOPATH/bin"

export NVM_DIR="/home/isqua/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && . "$NVM_DIR/nvm.sh"  # This loads nvm
