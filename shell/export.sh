export EDITOR=vim
export LESSCHARSET=utf-8

export LS_COLORS=$LS_COLORS:'di=34:fi=0:ln=4:or=33:ex=35'
# on Mac OS X you should install coreutils
export LS_OPTIONS='--color'

export GOPATH="$HOME/go"
export PATH="$PATH:$GOPATH/bin"

# Node Version Manager https://github.com/creationix/nvm
export NVM_DIR="$HOME/.nvm"
if [ -s "$NVM_DIR/nvm.sh" ]; then
    source "$NVM_DIR/nvm.sh"
elif [ -s "/usr/local/opt/nvm/nvm.sh" ]; then
    source "/usr/local/opt/nvm/nvm.sh"
fi
