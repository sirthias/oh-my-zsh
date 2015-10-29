local user_host='%F{green}%n@%m%f'
local current_dir='%F{cyan}%$PWD_LENGTH<...<${PWD/#$HOME/~}%<<%f' # don't use %~ so we do not have directory shortcuts abbreviated
local git_info='$(git_prompt_info)'
local prompt_char='%F{green}>%f'

PROMPT="${user_host} ${current_dir} ${git_info}${prompt_char} "

ZSH_THEME_GIT_PROMPT_PREFIX="%F{magenta}("
ZSH_THEME_GIT_PROMPT_SUFFIX=")%f "
