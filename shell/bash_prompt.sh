if [ -f /usr/lib/git-core/git-sh-prompt ]; then
    git_prompt_file=/usr/lib/git-core/git-sh-prompt
elif [ -f /usr/local/git/contrib/completion/git-prompt.sh ]; then
    git_prompt_file=/usr/local/git/contrib/completion/git-prompt.sh
fi

if [ -n "$git_prompt_file" ]; then

    source $git_prompt_file

    GIT_PS1_SHOWDIRTYSTATE=y
    GIT_PS1_SHOWUNTRACKEDFILES=y
    GIT_PS1_SHOWCOLORHINTS=y

    PROMPT_COMMAND='__git_ps1 "\n\e[1;37m\u\e[0m@\H \e[1;37m\w\e[0m " "\n> \$ "'

else

    Color_Off='\e[0m'       # Text Reset

    # Bold
    BWhite='\e[1;37m'       # White

    _prompt_user() {
        echo "${BWhite}\u${Color_Off}@\H"
    }

    # returns current path for prompt (home is ~)
    _prompt_path() {
        echo "${BWhite}\w${Color_Off}"
    }

    PS1="\n"
    PS1+="$(_prompt_user) "
    PS1+="$(_prompt_path)"
    PS1+="\n> \$ "

fi
