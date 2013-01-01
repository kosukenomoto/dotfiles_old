#!/opt/local/bin/zsh
export LANG=ja_JP.UTF-8

## Default shell configuration
#
# set prompt
#
autoload colors
colors

autoload -U compinit
compinit

setopt NO_BEEP
export CLICOLOR=1
export EDITOR=/Applications/MacVim.app/Contents/MacOS/Vim
alias vi='env LANG=ja_JP.UTF-8 /Applications/MacVim.app/Contents/MacOS/Vim "$@"'
alias vim='env LANG=ja_JP.UTF-8 /Applications/MacVim.app/Contents/MacOS/Vim "$@"'

#zstyle ':completion:*' list-colors 'di=34' 'ln=35' 'so=32' 'ex=31' 'bd=46;34' 'cd=43;34'
zstyle ':completion:*' list-colors '' 
zstyle ':completion:*' matcher-list 'm:{a-z}={A-Z}' 


#color
#
DEFAULT=$'%{\e[1;0m%}'
GREEN=$'%{\e[1;32m%}'
BLUE=$'%{\e[1;34m%}'
local RIGHTC=$'%{\e[38;5;88m%}'
local LEFTC=$'%{\e[38;5;30m%}'
###
### Prompt
###
setopt prompt_subst
PROMPT='${LEFTC}%U${USER}@${HOST} ${GREEN}%~${DEFAULT}
%(!.#.$) '

#local LEFTC=$'%{\e[38;5;30m%}'
#local RIGHTC=$'%{\e[38;5;88m%}'
#local DEFAULTC=$'%{\e[m%}'
#export PROMPT=$LEFTC"%U$USER%%%u "$DEFAULTC
#export RPROMPT=$RIGHTC"[%~]"$DEFAULTC

bindkey -v
