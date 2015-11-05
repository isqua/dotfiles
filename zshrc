# export MANPATH="/usr/local/man:$MANPATH"
autoload -U colors && colors
# Разворачивание ввода
autoload -U compinit && compinit
autoload -U promptinit && promptinit

# History
HISTSIZE=5000
SAVEHIST=5000
HISTFILE=~/.histfile

setopt append_history
setopt extended_history
setopt share_history # share command history data
setopt inc_append_history # save on exec, not on logout
setopt hist_ignore_all_dups
setopt hist_ignore_space
setopt hist_reduce_blanks

source $HOME/.dotfiles/shell/export.sh
source $HOME/.dotfiles/shell/alias.sh
source $HOME/.dotfiles/shell/prompt_bureau_setup.sh

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
if [[ -n "${terminfo[kcuu1]}" ]]; then bindkey "${terminfo[kcuu1]}" up-line-or-search; fi
if [[ -n "${terminfo[kcud1]}" ]]; then bindkey "${terminfo[kcud1]}" down-line-or-search; fi
# Delete
if [[ -n "${terminfo[kdch1]}" ]]; then bindkey "${terminfo[kdch1]}" delete-char; fi

# Вправо-влево по словам по нажатию Alt+стрелки
bindkey '^[^[[C' emacs-forward-word
bindkey '^[^[[D' emacs-backward-word
