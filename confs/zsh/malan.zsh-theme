if [[ $LOGNAME != $USER ]]; then
    local user='%n'
else 
    local user='☻'
fi

if [[ -n $SSH_CONNECTION ]]; then
	local host='⬩ %m'
else
	local host='⬩ ⌂'
fi

local ret_status="%(?:%{$fg_bold[magenta]%}[ %{$fg_bold[green]%}⬢:%{$fg_bold[red]%}[ ⬢%s)"
local r_ret_status="%(?:%{$fg_bold[green]%}⬢%{$fg_bold[magenta]%} ]:%{$fg_bold[red]%}⬢ ]%s)"
PROMPT=$'
%{$fg[yellow]%}${user} %{$fg[green]%}${host} ⬩ %{$reset_color%}%{$fg[red]%}%2d %{$reset_color%} %{$reset_color%}
${ret_status} %{$reset_color%} '
RPROMPT='$(git_prompt_status)%{$reset_color%} %{$fg[magenta]%}$(git_prompt_info) ${r_ret_status}%{$reset_color%}'

PROMPT2="%{$fg_bold[black]%}%_> %{$reset_color%}"

ZSH_THEME_GIT_PROMPT_PREFIX="git:(%{$fg[cyan]%}"
ZSH_THEME_GIT_PROMPT_SUFFIX="%{$reset_color%}"
ZSH_THEME_GIT_PROMPT_DIRTY="%{$fg[magenta]%}) %{$fg[yellow]%}✗%{$reset_color%}"
ZSH_THEME_GIT_PROMPT_CLEAN="%{$fg[magenta]%})"

ZSH_THEME_GIT_PROMPT_ADDED="%{$fg[cyan]%} ✈"
ZSH_THEME_GIT_PROMPT_MODIFIED="%{$fg[yellow]%} ✭"
ZSH_THEME_GIT_PROMPT_DELETED="%{$fg[red]%} ✗"
ZSH_THEME_GIT_PROMPT_RENAMED="%{$fg[blue]%} ➦"
ZSH_THEME_GIT_PROMPT_UNMERGED="%{$fg[magenta]%} ✂"
ZSH_THEME_GIT_PROMPT_UNTRACKED="%{$fg[grey]%} ✱"
