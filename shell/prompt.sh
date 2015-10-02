# returns current git branch
_prompt_git_branch() {
    ref=$(command git symbolic-ref HEAD 2> /dev/null) || \
    ref=$(command git rev-parse --short HEAD 2> /dev/null) || return
    echo "${ref#refs/heads/}"
}

_prompt_git_status () {
    local GIT_PROMPT_CLEAN="%{$fg_bold[green]%}✓%{$reset_color%}"
    local GIT_PROMPT_AHEAD="%{$fg[cyan]%}▴%{$reset_color%}"
    local GIT_PROMPT_BEHIND="%{$fg[magenta]%}▾%{$reset_color%}"
    local GIT_PROMPT_STAGED="%{$fg_bold[green]%}●%{$reset_color%}"
    local GIT_PROMPT_UNSTAGED="%{$fg_bold[yellow]%}●%{$reset_color%}"
    local GIT_PROMPT_UNTRACKED="%{$fg_bold[red]%}●%{$reset_color%}"
    local _STATUS=""
    local _INDEX=""

    if [[ $(command git status --short 2> /dev/null) != "" ]]; then
        _INDEX=$(command git status --porcelain -b 2> /dev/null)
        if $(echo "$_INDEX" | command grep '^[AMRD]. ' &> /dev/null); then
            _STATUS="$_STATUS$GIT_PROMPT_STAGED"
        fi
        if $(echo "$_INDEX" | command grep '^.[MTD] ' &> /dev/null); then
            _STATUS="$_STATUS$GIT_PROMPT_UNSTAGED"
        fi
        if $(echo "$_INDEX" | command grep -E '^\?\? ' &> /dev/null); then
            _STATUS="$_STATUS$GIT_PROMPT_UNTRACKED"
        fi
        if $(echo "$_INDEX" | command grep '^UU ' &> /dev/null); then
            _STATUS="$_STATUS$GIT_PROMPT_UNMERGED"
        fi
        if $(command git rev-parse --verify refs/stash >/dev/null 2>&1); then
            _STATUS="$_STATUS$GIT_PROMPT_STASHED"
        fi
        if $(echo "$_INDEX" | command grep '^## .*ahead' &> /dev/null); then
            _STATUS="$_STATUS$GIT_PROMPT_AHEAD"
        fi
        if $(echo "$_INDEX" | command grep '^## .*behind' &> /dev/null); then
            _STATUS="$_STATUS$GIT_PROMPT_BEHIND"
        fi
        if $(echo "$_INDEX" | command grep '^## .*diverged' &> /dev/null); then
            _STATUS="$_STATUS$GIT_PROMPT_DIVERGED"
        fi
      else
          _STATUS="$_STATUS$GIT_PROMPT_CLEAN"
      fi

      echo $_STATUS
}

_prompt_git () {
    local GIT_PROMPT_PREFIX="[%{$fg_bold[green]%}±%{$reset_color%}%{$fg_bold[white]%}"
    local GIT_PROMPT_SUFFIX="%{$reset_color%}]"
    local _branch=$(_prompt_git_branch)
    local _status=$(_prompt_git_status)
    local _result=""
    if [[ "${_branch}x" != "x" ]]; then
        _result="$GIT_PROMPT_PREFIX$_branch"
        if [[ "${_status}x" != "x" ]]; then
            _result="$_result $_status"
        fi
        _result="$_result$GIT_PROMPT_SUFFIX"
    fi
    echo $_result
}

