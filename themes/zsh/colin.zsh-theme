#! /usr/bin/env zsh

local ret_status="%(?:%{$fg_bold[green]%}❯❯❯:%{$fg_bold[red]%}❯❯❯)%{$reset_color%}"
local virtualenv='%{$FG[243]%}‹$(virtualenv_prompt_info)›%{$reset_color%}'
local current_dir="%{$terminfo[bold]$FG[226]%}${PWD/#$HOME/~}%{$reset_color%}"
local git_info='$(git_prompt_info)'
local date_info='%{$FG[239]%}[%D %*]%{$reset_color%}'
local user='%{$FG[040]%}%n%{$reset_color%}'
local hostname="%{$FG[033]%}%m%{$reset_color%}"
local at="%{$FG[239]%}at%{$reset_color%}"
local in="%{$FG[239]%}in%{$reset_color%}"
local using="%{$FG[239]%}using%{$reset_color%}"

PROMPT="╭─$user $at $hostname $in $current_dir $git_info $using $virtualenv
╰─$ret_status "
RPROMPT=$date_info

ZSH_THEME_GIT_PROMPT_PREFIX=" %{$FG[239]%}on%{$reset_color%} %{$fg[255]%}"
ZSH_THEME_GIT_PROMPT_SUFFIX="%{$reset_color%}"
ZSH_THEME_GIT_PROMPT_DIRTY="%{$FG[202]%}✘✘✘"
ZSH_THEME_GIT_PROMPT_CLEAN="%{$FG[040]%}✔"
