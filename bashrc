# If not running interactively, don't do anything
case $- in
    *i*) ;;
      *) return;;
esac

# Ввод имени директории без cd bash@4.0
# shopt -s autocd

# Не хранить повторяющиеся команды
HISTCONTROL=ignoreboth

# append to the history file, don't overwrite it
shopt -s histappend

# for setting history length see HISTSIZE and HISTFILESIZE in bash(1)
HISTSIZE=1000
HISTFILESIZE=2000

# Хранить таймстемпы в истории
export HISTTIMEFORMAT='%F %T '

# Записывать команды сразу
PROMPT_COMMAND='history -a;history -n'

# Реагировать на ресайз и менять COLUMNS and LINES
shopt -s checkwinsize

# If set, the pattern "**" used in a pathname expansion context will
# match all files and zero or more directories and subdirectories.
# shopt -s globstar

# make less more friendly for non-text input files, see lesspipe(1)
[ -x /usr/bin/lesspipe ] && eval "$(SHELL=/bin/sh lesspipe)"

# enable programmable completion features (you don't need to enable
# this, if it's already enabled in /etc/bash.bashrc and /etc/profile
# sources /etc/bash.bashrc).
if ! shopt -oq posix; then
  if [ -f /usr/share/bash-completion/bash_completion ]; then
    . /usr/share/bash-completion/bash_completion
  elif [ -f /etc/bash_completion ]; then
    . /etc/bash_completion
  fi
fi

source $HOME/.dotfiles/shell/export.sh
source $HOME/.dotfiles/shell/alias.sh
source $HOME/.dotfiles/shell/prompt_b.sh
