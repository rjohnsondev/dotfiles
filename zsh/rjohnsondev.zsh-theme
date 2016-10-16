function vi_mode_prompt_info() {
    if test "$KEYMAP" != "vicmd"
    then
        echo "%{$fg[white]%}[%{$fg_bold[green]%}I%{$fg[white]%}] %{$reset_color%}"
    else
        echo "%{$fg[white]%}[%{$fg_bold[blue]%}N%{$fg[white]%}] %{$reset_color%}"
    fi
}

function virtualenv_prompt_info(){
    [[ -n ${VIRTUAL_ENV} ]] || return
    echo "%{$fg[grey]%}[${VIRTUAL_ENV:t}] %{$reset_color%}"
}

local ret_status="%(?:%{$fg[blue]%}➜ :%{$fg[red]%}➜ )"
PROMPT='$(virtualenv_prompt_info)$(vi_mode_prompt_info)%{$fg[white]%}%p[%{$fg[grey]%}${PWD/#$HOME/~}%{$fg[blue]%}$(git_prompt_info)%{$fg[white]%}]% ${ret_status}%{$reset_color%}'

RPROMPT="%{$fg[grey]%}---%{$reset_color%}"

ZSH_THEME_GIT_PROMPT_PREFIX=" git:(%{$fg[red]%}"
ZSH_THEME_GIT_PROMPT_SUFFIX="%{$reset_color%}"
ZSH_THEME_GIT_PROMPT_DIRTY="%{$fg[blue]%}) %{$fg[yellow]%}✗%{$reset_color%}"
ZSH_THEME_GIT_PROMPT_CLEAN="%{$fg[blue]%})"
