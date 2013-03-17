#!/opt/local/bin/zsh
source ~/.zsh/zsh-git-prompt/zshrc.sh
export FPATH="$FPATH:/opt/local/share/zsh/site-functions/"
if [ -f /opt/local/etc/profile.d/autojump.sh ]; then
        . /opt/local/etc/profile.d/autojump.sh
fi

export LANG=ja_JP.UTF-8
export CLICOLOR=1
alias vi='env LANG=ja_JP.UTF-8 /Applications/MacVim.app/Contents/MacOS/Vim "$@"'
alias vim='env LANG=ja_JP.UTF-8 /Applications/MacVim.app/Contents/MacOS/Vim "$@"'
export EDITOR=vim

# コマンド履歴
HISTFILE=~/.zsh_history
HISTSIZE=6000000
SAVEHIST=6000000
setopt hist_ignore_dups     # ignore duplication command history list
setopt share_history        # share command history data

## Default shell configuration
#
# set prompt

# 色の設定を$fg[red]のように人がわかるような書き方ができる
autoload -Uz colors
colors
autoload -U compinit
compinit

zmodload zsh/complist
bindkey -M menuselect 'h' vi-backward-char
bindkey -M menuselect 'j' vi-down-line-or-history
bindkey -M menuselect 'k' vi-up-line-or-history
bindkey -M menuselect 'l' vi-forward-char

bindkey -M viins '^j' vi-cmd-mode

# コマンド履歴検索
autoload history-search-end
zle -N history-beginning-search-backward-end history-search-end
zle -N history-beginning-search-forward-end history-search-end
bindkey "^P" history-beginning-search-backward-end
bindkey "^N" history-beginning-search-forward-end

# BEEP音をオフに
setopt NO_BEEP
# cd 時に自動で push
setopt auto_pushd
# 同じディレクトリを pushd しない
setopt pushd_ignore_dups
# 補完候補の感覚を短く
setopt list_packed
# ディレクトリ名のみでCD
setopt auto_cd

#zstyle ':completion:*' list-colors 'di=34' 'ln=35' 'so=32' 'ex=31' 'bd=46;34' 'cd=43;34'
zstyle ':completion:*' list-colors '' 
zstyle ':completion:*' matcher-list 'm:{a-z}={A-Z}' 
zstyle ':completion:*:default' menu select=1

# 色の定義
DEFAULT=$"%{\e[0;0m%}"
RESET="%{${reset_color}%}"
GREEN="%{${fg[green]}%}"
BLUE="%{${fg[blue]}%}"
RED="%{${fg[red]}%}"
CYAN="%{${fg[cyan]}%}"
YELLOW="%{${fg[yellow]}%}"
MAGENTA="%{${fg[magenta]}%}"
WHITE="%{${fg[white]}%}"

# プロンプトでエスケープシーケンスを展開する
setopt prompt_subst
PROMPT='$WHITE [%/$RESET$(git_super_status)$WHITE]
$WHITE%m%# '
function zle-line-init zle-keymap-select {
  case $KEYMAP in
    vicmd)
      PROMPT='$YELLOW [%/$RESET$(git_super_status)$YELLOW]
$YELLOW%m%# '
    ;;
    main|viins)
      PROMPT='$WHITE [%/$RESET$(git_super_status)$WHITE]
$WHITE%m%# '
    ;;
  esac
  zle reset-prompt
}
zle -N zle-line-init
zle -N zle-keymap-select

PROMPT2="%_%% "
SPROMPT="%r is correct? [n,y,a,e]: "

function chpwd() { ls -a }
function cdup() {
    echo
    cd ..
    zle reset-prompt
}
zle -N cdup
bindkey '\^' cdup

function p33 { source ~/tests/python/env3.3/bin/activate }
function p27 { source ~/tests/python/env2.7/bin/activate }
