"                                ___           ___           ___     
"      ___                      /\  \         /\  \         /\__\    
"     /\  \        ___         |::\  \       /::\  \       /:/  /    
"     \:\  \      /\__\        |:|:\  \     /:/\:\__\     /:/  /     
"      \:\  \    /:/__/      __|:|\:\  \   /:/ /:/  /    /:/  /  ___ 
"  ___  \:\__\  /::\  \     /::::|_\:\__\ /:/_/:/__/___ /:/__/  /\__\
" /\  \ |:|  |  \/\:\  \__  \:\~~\  \/__/ \:\/:::::/  / \:\  \ /:/  /
" \:\  \|:|  |   ~~\:\/\__\  \:\  \        \::/~~/~~~~   \:\  /:/  / 
"  \:\__|:|__|      \::/  /   \:\  \        \:\~~\        \:\/:/  /  
"   \::::/__/       /:/  /     \:\__\        \:\__\        \::/  /   
"    ~~~~           \/__/       \/__/         \/__/         \/__/    
"
"neobundle設定
set nocompatible
filetype off

if has('vim_starting')
	set runtimepath+=~/.bundle/neobundle.vim
		call neobundle#rc(expand('~/.bundle'))
endif

NeoBundle 'git://github.com/Shougo/neobundle.vim.git'
NeoBundle 'git://github.com/Shougo/vimfiler.git'
NeoBundle 'git://github.com/Shougo/vimshell.git'
NeoBundle 'git://github.com/thinca/vim-quickrun'
NeoBundle 'git://github.com/thinca/vim-guicolorscheme.git'
NeoBundle 'git://github.com/Lokaltog/vim-powerline.git'
NeoBundle 'git://github.com/altercation/vim-colors-solarized.git'

filetype plugin on
filetype indent on

"vim一時ファイル設定
set viminfo+=n~/.vim/.viminfo
"vimbackupファイル保存場所
set backupdir=~/.vim
"swpファイル保存場所
set directory=~/.vim

"カラースキーマの設定
syntax enable
set background=dark
colorscheme solarized
let g:solarized_termcolors=256
let g:solarized_contrast="hight"
let g:solarized_visibility="low" 

"tabstop（タブ表示スペース数）
set ts=4
"行番号の表示
set number 
"カーソルライン
set cursorline
"自動インデント
set autoindent
"Cインデント
set cindent
"コマンドラインの高さ
set cmdheight=2
"エンコードutf-8
set encoding=utf-8
"powerline
"let g:Powerline_symbols = 'fancy'

"キーマップ
"ミスタッチ防止設定
imap <C-@> <C-[>
