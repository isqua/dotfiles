prompt_bureau_setup () {
    prompt_bureau_user_color=${1:-'white'}
    prompt_bureau_path_color=${2:-$prompt_bureau_user_color}
    prompt_bureau_vcs_color=${3:-$prompt_bureau_user_color}

    autoload -Uz vcs_info
    autoload -U colors && colors
    prompt_bureau_vcs_style
    add-zsh-hook precmd prompt_bureau_precmd

    setopt prompt_subst
    PROMPT=$(prompt_bureau_prompt)
}

prompt_bureau_prompt () {
    local color=green
    if [ "$UID" = "0" ]; then color=red; fi
    echo "> %{$fg[${color}]%}%(!.#.$)%{$reset_color%} "
}

prompt_bureau_string_width () {
    local str=$1
    echo ${#${(S%%)str//(\%([KF1]|)\{*\}|\%[Bbkf])}}
}

prompt_bureau_precmd () {
    vcs_info
    prompt_bureau_update_vcs

    # user@host path
    local left="%{$fg_bold[$prompt_bureau_user_color]%}%n%{$reset_color%}@%m %{$fg_bold[$prompt_bureau_path_color]%}%~%{$reset_color%}"
    # current time
    local right="[%*]"
    local offset=$(( $COLUMNS - $(prompt_bureau_string_width $left) - $(prompt_bureau_string_width $right) + 2 ))

    print -P "\n${left}" "${(l:$offset:: :)right}"
}

prompt_bureau_vcs_style () {
    setopt prompt_subst
    zstyle ':vcs_info:*' enable git
    # Check for staged and unstaged
    zstyle ':vcs_info:*' check-for-changes true
    zstyle ':vcs_info:*' max-exports 2
    zstyle ':vcs_info:git*' stagedstr "%{$fg_bold[green]%}●"
    zstyle ':vcs_info:git*' unstagedstr "%{$fg_bold[red]%}●"
    zstyle ':vcs_info:git*' formats "[%{$fg[green]%}±%{$fg_bold[white]%}%b %u%c%{$reset_color%}]"
    zstyle ':vcs_info:git*' actionformats "[%{$fg[green]%}±%{$fg_bold[white]%}%b %u%c %{$fg[magenta]%}⌘ %a%{$reset_color%}]"
}

prompt_bureau_update_vcs () {
    RPROMPT="$vcs_info_msg_0_"
}

prompt_bureau_setup $@
