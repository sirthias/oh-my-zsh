if [ $UID -eq 0 ]
  then CLR="red"
  else CLR="green"
fi

local user_host='%{$fg[$CLR]%}%n%{$fg[green]%}@%m%{$reset_color%}'
local current_dir='%{$fg[cyan]%}%$PWD_LENGTH<...<${PWD/#$HOME/~}%<<%{$reset_color%}' # don't use %~ so we do not have directory shortcuts abbreviated
local git_info='$(git_prompt_info)'
local prompt_char='%{$fg[green]%}>%{$reset_color%}'

PROMPT="$user_host $current_dir $git_info$prompt_char "

ZSH_THEME_GIT_PROMPT_PREFIX="%{$fg[magenta]%}("
ZSH_THEME_GIT_PROMPT_SUFFIX=")%{$reset_color%} "

function git_prompt_info() {
  local ref
  if [[ "$(command git config --get oh-my-zsh.hide-status 2>/dev/null)" != "1" ]]; then
    ref=$(command git symbolic-ref HEAD 2> /dev/null) || \
    ref=$(command git rev-parse --short HEAD 2> /dev/null) || return 0
    echo "$ZSH_THEME_GIT_PROMPT_PREFIX${ref#refs/heads/}$(parse_git_dirty)$(git_current_tag)$ZSH_THEME_GIT_PROMPT_SUFFIX"
  fi
}

function git_current_tag() {
  local TAG
  TAG=$(command git describe --tags --exact-match HEAD 2> /dev/null)
  echo "${TAG:+|}$TAG"
}