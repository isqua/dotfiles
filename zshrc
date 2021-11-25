. ~/.profile
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
setopt CORRECT_ALL # Correct commands

source $HOME/.dotfiles/shell/detect_os.sh
source $HOME/.dotfiles/shell/export.sh
source $HOME/.dotfiles/shell/alias.sh
source $HOME/.dotfiles/shell/nvm.sh
source $HOME/.dotfiles/shell/bureau/prompt_bureau_setup.zsh magenta

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

# Какие символы не считать в составе слов при ^W и подобном
WORDCHARS=${WORDCHARS//[?=\/&;^.]}

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
export PATH="/opt/homebrew/bin:$PATH"

# If you need to have ruby first in your PATH, run:
export PATH="/opt/homebrew/opt/ruby/bin:$PATH"
# For compilers to find ruby you may need to set:
# export LDFLAGS="-L/opt/homebrew/opt/ruby/lib"
# export CPPFLAGS="-I/opt/homebrew/opt/ruby/include"

# For pkg-config to find ruby you may need to set:
# export PKG_CONFIG_PATH="/opt/homebrew/opt/ruby/lib/pkgconfig"
