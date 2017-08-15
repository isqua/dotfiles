# Predictable SSH authentication socket location for tmux/screen

SOCK="$HOME/.ssh/ssh-auth-sock"

if [[ -S "$SSH_AUTH_SOCK" && $SSH_AUTH_SOCK != $SOCK ]]; then
    ln -sf "$SSH_AUTH_SOCK" "$SOCK"
    export SSH_AUTH_SOCK=$SOCK
fi
