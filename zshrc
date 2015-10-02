# export MANPATH="/usr/local/man:$MANPATH"
autoload -U colors && colors
# Разворачивание ввода
autoload -U compinit && compinit
autoload -U promptinit && promptinit

source $HOME/.dotfiles/shell/export.sh
source $HOME/.dotfiles/shell/alias.sh
source $HOME/.dotfiles/shell/prompt_z.sh

HISTSIZE=5000
SAVEHIST=5000
HISTFILE=~/.histfile

setopt hist_ignore_all_dups
setopt hist_ignore_space

# Комплит со стрелками
zstyle ':completion:*' menu yes select
zstyle ':completion:*' list-colors ${(s.:.)LS_COLORS}
zstyle ':completion:*' group-name ''
zstyle ':completion:*' completer _expand _complete _ignored
zstyle ':completion:*' matcher-list 'm:{a-z}={A-Z}'

# Комплишн для kill
zstyle ':completion:*:*:kill:*:processes' list-colors "=(#b) #([0-9]#)*=$color[blue]=$color[yellow]"

# Исправлять команды
setopt CORRECT_ALL

# Туда-сюда по истории
bindkey "^[[A" history-beginning-search-backward
bindkey "^[[B" history-beginning-search-forward
