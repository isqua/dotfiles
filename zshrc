# export MANPATH="/usr/local/man:$MANPATH"
autoload -U colors && colors
# Разворачивание ввода
autoload -U compinit && compinit
autoload -U promptinit && promptinit

# History
HISTSIZE=10000
SAVEHIST=10000
HISTFILE=~/.zsh_history

setopt APPEND_HISTORY # don’t replace history, just append
setopt EXTENDED_HISTORY # save time and duration
#setopt SHARE_HISTORY # share history between sessions
setopt HIST_IGNORE_ALL_DUPS # remove old dup
setopt HIST_IGNORE_SPACE # don’t save commands start with space
setopt HIST_REDUCE_BLANKS # Remove superfluous blanks from each command line
setopt INC_APPEND_HISTORY # save on exec, not on logout

source $HOME/.dotfiles/shell/export.sh
source $HOME/.dotfiles/shell/alias.sh
source $HOME/.dotfiles/shell/bureau/prompt_bureau_setup.zsh

alias mv='nocorrect mv -i'
alias cp='nocorrect cp -iR'
alias rm='nocorrect rm -i'
alias mkdir='nocorrect mkdir'

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

bindkey -e
zmodload zsh/terminfo
# Туда-сюда по истории
bindkey "^[[A" history-beginning-search-backward
bindkey "^[[B" history-beginning-search-forward
# Delete
if [[ -n "${terminfo[kdch1]}" ]]; then bindkey "${terminfo[kdch1]}" delete-char; fi

# Вправо-влево по словам по нажатию Alt+стрелки
bindkey '^[^[[C' emacs-forward-word
bindkey '^[^[[D' emacs-backward-word
