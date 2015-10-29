if [ $UID -eq 0 ]
  then CLR="red"
  else CLR="green"
fi

local user_host='%{$fg[$CLR]%}%n%{$fg[green]%}@%m%{$reset_color%}'
local current_dir='%{$fg[cyan]%}%$PWD_LENGTH<...<${PWD/#$HOME/~}%<<%{$reset_color%}' # don't use %~ so we do not have directory shortcuts abbreviated
local git_info='$(git_prompt_info)'
local prompt_char='%{$fg[green]%}>%{$reset_color%}'

PROMPT="${user_host} ${current_dir} ${git_info}${prompt_char} "

ZSH_THEME_GIT_PROMPT_PREFIX="%{$fg[magenta]%}("
ZSH_THEME_GIT_PROMPT_SUFFIX=")%{$reset_color%} "
