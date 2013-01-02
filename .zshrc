#!/opt/local/bin/zsh
export LANG=ja_JP.UTF-8
export CLICOLOR=1
alias vi='env LANG=ja_JP.UTF-8 /Applications/MacVim.app/Contents/MacOS/Vim "$@"'
alias vim='env LANG=ja_JP.UTF-8 /Applications/MacVim.app/Contents/MacOS/Vim "$@"'
export EDITOR=vim

#=============================
# source auto-fu.zsh
#=============================
if [ -f ~/.zsh/auto-fu.zsh/auto-fu.zsh ]; then
    source ~/.zsh/auto-fu.zsh/auto-fu.zsh
    function zle-line-init () {
        auto-fu-init
    }
    zle -N zle-line-init
    zstyle ':completion:*' completer _oldlist _complete
fi

## Default shell configuration
#
# set prompt
#
autoload colors
colors
autoload -U compinit
compinit

bindkey -v
zmodload zsh/complist
bindkey -M menuselect 'h' vi-backward-char
bindkey -M menuselect 'j' vi-down-line-or-history
bindkey -M menuselect 'k' vi-up-line-or-history
bindkey -M menuselect 'l' vi-forward-char

setopt NO_BEEP
setopt auto_pushd
setopt list_packed

#zstyle ':completion:*' list-colors 'di=34' 'ln=35' 'so=32' 'ex=31' 'bd=46;34' 'cd=43;34'
zstyle ':completion:*' list-colors '' 
zstyle ':completion:*' matcher-list 'm:{a-z}={A-Z}' 
zstyle ':completion:*:default' menu select=1

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
