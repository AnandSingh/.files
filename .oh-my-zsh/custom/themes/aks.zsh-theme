# Put your custom themes in this folder.
# Example:

#PROMPT="%{$fg[red]%}%n%{$reset_color%}@%{$fg[blue]%}%m %{$fg[yellow]%}%~ %{$reset_color%}%% "
#
#
#
NEWLINE=$'\n'
function get_pwd() {
  echo "${PWD/$HOME/~}"
}


PROMPT='${NEWLINE} %{$fg[cyan]%}$(get_pwd)%{$reset_color%} $(git_prompt_info)${NEWLINE}'
PROMPT+="%(?:%{$fg_bold[green]%}➜ :%{$fg_bold[red]%}➜ )"

ZSH_THEME_GIT_PROMPT_PREFIX="%{$fg_bold[blue]%}git:(%{$fg[red]%}"
ZSH_THEME_GIT_PROMPT_SUFFIX="%{$reset_color%} "
ZSH_THEME_GIT_PROMPT_DIRTY="%{$fg[blue]%}) %{$fg[yellow]%}✗"
ZSH_THEME_GIT_PROMPT_CLEAN="%{$fg[blue]%})"


#function put_spacing() {
 

#}

#function git_prompt_info() {
#  ref=$(git symbolic-ref HEAD 2> /dev/null) || return
#  echo "$(parse_git_dirty)$ZSH_THEME_GIT_PROMPT_PREFIX$(current_branch)$ZSH_THEME_GIT_PROMPT_SUFFIX"
#}

#function battery_charge() {
#    if [ -e ~/bin/batcharge.py ]
#    then
#        echo `python ~/bin/batcharge.py`
#    else
#        echo '';
#    fi
#}

#local bat=$(battery_charge)
#if [ ${#bat} != 0 ]; then
#    ((bat = ${#bat} - 18))
#else
#    bat=0
#fi

#local termwidth
#(( termwidth = ${COLUMNS} - 3 - ${#HOST} - ${#$(get_pwd)} - ${bat} - ${git} ))

#local git=$(git_prompt_info)
#if [ ${#git} != 0 ]; then
#    ((git=${#git} - 10))
#else
#    git=0
#fi
#PROMPT='${NEWLINE}$fg[cyan]%m: $fg[yellow]$(get_pwd)$(put_spacing)  $(git_prompt_info) ${NEWLINE}$fg[white]--> '

#ZSH_THEME_GIT_PROMPT_PREFIX="[git:"
#ZSH_THEME_GIT_PROMPT_SUFFIX="]$reset_color"
#ZSH_THEME_GIT_PROMPT_DIRTY="$fg[red]+"
#ZSH_THEME_GIT_PROMPT_CLEAN="$fg[green]"
