source $HOME/.dotfiles/shell/prompt.sh

_get_color() {
    local n=0

    case "$1" in
        "reset")    n=0  ;;
        "white")    n=1  ;;
        "red")      n=31 ;;
        "green")    n=32 ;;
        "bold")     n=97 ;;
    esac

    echo "\e[${n}m"
}

# returns user@host for prompt
_prompt_user() {
    echo "$(_get_color bold)$(_get_color white)\u$(_get_color reset)@\H"
}

# returns current path for prompt (home is ~)
_prompt_path() {
    echo "$(_get_color bold)$(_get_color white)\w$(_get_color reset)"
}

# returns green $ for users and red # for root
_prompt_prompt() {
    local color=green
    if [ "$UID" = "0" ]; then color=red; fi
    echo "> $(_get_color ${color})\$$(_get_color reset) "
}

# returns current time
_prompt_time() {
    echo "\t"
}

PS1="\n$(_prompt_user) $(_prompt_path)\n$(_prompt_time)$(_prompt_prompt)"
