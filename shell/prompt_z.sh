source $HOME/.dotfiles/shell/prompt.sh

prompt_bureau_user() {
    # user@host
    local _user="%{$fg_bold[white]%}%n%{$reset_color%}@%m"
    # current path (home is ~)
    local _path="%{$fg_bold[white]%}%~%{$reset_color%}"

    echo "$_user $_path"
}

# returns green $ for users and red # for root
prompt_bureau_prompt() {
    local color=green
    if [ "$UID" = "0" ]; then color=red; fi
    echo "> %{$fg[${color}]%}\$%{$reset_color%} "
}

# add user@host        [time] string before prompt
prompt_bureau_precmd() {
    LEFT=$(prompt_bureau_user)
    RIGHT="[%*]"
    RIGHTWIDTH=$(($COLUMNS-${#LEFT}))

    print -P "\n$LEFT${(l:$RIGHTWIDTH:: :)RIGHT}"
}

prompt_bureau_setup() {
    add-zsh-hook precmd prompt_bureau_precmd
    PROMPT="$(prompt_bureau_prompt)"
    RPROMPT="$(_prompt_git)"
}

autoload -U add-zsh-hook
prompt_bureau_setup
