export PATH=~/bin:/opt/local/bin:/opt/local/sbin:$PATH
export MANPATH=/opt/local/man:$MANPATH
export CLICOLOR=1
export LSCOLORS=gxfxcxdxbxegedabagacad
export EDITOR=/Applications/MacVim.app/Contents/MacOS/Vim
alias vi='env LANG=ja_JP.UTF-8 /Applications/MacVim.app/Contents/MacOS/Vim "$@"'
alias vim='env LANG=ja_JP.UTF-8 /Applications/MacVim.app/Contents/MacOS/Vim "$@"'

#############################################################
#色エスケープシーケンス定義
#############################################################
export CR="$(echo -ne '\r')"
export LF="$(echo -ne '\n')"
export TAB="$(echo -ne '\t')"
export ESC="$(echo -ne '\033')"
export COLOUR_BLACK="${ESC}[30m"
export COLOUR_RED="${ESC}[31m"
export COLOUR_GREEN="${ESC}[32m"
export COLOUR_YELLOW="${ESC}[33m"
export COLOUR_BLUE="${ESC}[34m"
export COLOUR_CYAN="${ESC}[35m"
export COLOUR_MAGENTA="${ESC}[36m"
export COLOUR_WHITE="${ESC}[37m"
export COLOUR_HIGHLIGHT_BLACK="${ESC}[30;1m"
export COLOUR_HIGHLIGHT_RED="${ESC}[31;1m"
export COLOUR_HIGHLIGHT_GREEN="${ESC}[32;1m"
export COLOUR_HIGHLIGHT_YELLOW="${ESC}[33;1m"
export COLOUR_HIGHLIGHT_BLUE="${ESC}[34;1m"
export COLOUR_HIGHLIGHT_CYAN="${ESC}[35;1m"
export COLOUR_HIGHLIGHT_MAGENTA="${ESC}[36;1m"
export COLOUR_HIGHLIGHT_WHITE="${ESC}[37;1m"
export COLOUR_DEFAULT="${ESC}[m"
