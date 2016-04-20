_prompt_color() {
    local c=sgr0

    case "$1" in
        "reset")    c="sgr0"       ;;
        "white")    c="setaf 254"  ;;
        "red")      c="setaf 124"  ;;
        "green")    c="setaf 64"   ;;
        "blue")     c="setaf 33"   ;;
        "bold")     c="bold"       ;;
    esac

    echo "$(tput $c)"
}

_prompt_git() {
    ref=$(command git symbolic-ref HEAD 2> /dev/null) || \
    ref=$(command git rev-parse --short HEAD 2> /dev/null) || return
    echo "$(_prompt_color blue)${ref#refs/heads/}$(_prompt_color reset)"
}

# returns user@host for prompt
_prompt_user() {
    echo "$(_prompt_color bold)$(_prompt_color white)\u$(_prompt_color reset)@\H"
}

# returns current path for prompt (home is ~)
_prompt_path() {
    echo "$(_prompt_color bold)$(_prompt_color white)\w$(_prompt_color reset)"
}

# returns green $ for users and red # for root
_prompt_prompt() {
    local color=green
    if [ "$UID" = "0" ]; then color=red; fi
    echo "$(_prompt_color ${color})\$$(_prompt_color reset) "
}

PS1="\n"
PS1+="$(_prompt_user) "
PS1+="$(_prompt_path) "
PS1+="$(_prompt_git) "
PS1+="\n$(_prompt_prompt)"
