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

"neobundle設定"{{{
set nocompatible
filetype off

if has('vim_starting')
	set runtimepath+=~/.bundle/neobundle.vim
		call neobundle#rc(expand('~/.bundle'))
endif

NeoBundle 'git://github.com/Shougo/neobundle.vim.git'
NeoBundle 'git://github.com/Shougo/unite.vim.git'
NeoBundle 'git://github.com/Shougo/vimproc.git'
NeoBundle 'git://github.com/thinca/vim-ref.git'
NeoBundle 'git://github.com/Shougo/vimfiler.git'
NeoBundle 'git://github.com/Shougo/vimshell.git'
NeoBundle 'git://github.com/thinca/vim-quickrun'
NeoBundle 'git://github.com/Lokaltog/vim-powerline.git'
NeoBundle 'git://github.com/vim-scripts/Smooth-Scroll.git'
NeoBundle 'git://github.com/scrooloose/nerdtree.git'
NeoBundle 'git://github.com/scrooloose/nerdcommenter.git'
NeoBundle 'git://github.com/tomasr/molokai.git'
NeoBundle 'git://github.com/jmcantrell/vim-virtualenv.git'
NeoBundle 'git://github.com/kana/vim-smartchr.git'
NeoBundle 'git://github.com/mattn/gist-vim.git'
NeoBundle 'git://github.com/mattn/webapi-vim.git'
NeoBundle 'git://github.com/tpope/vim-markdown.git'
NeoBundle 'gtags.vim'
NeoBundle 'L9'
NeoBundle 'FuzzyFinder'

filetype plugin on
filetype indent on
"}}}

"vim環境ファイル保存先"{{{
"vim一時ファイル設定
set viminfo& viminfo+=n~/.vim/.viminfo
"vimbackupファイル保存場所
set backupdir=~/.vim
"swpファイル保存場所
set directory=~/.vim
"}}}

"カラースキーマの設定"{{{
syntax enable
"colorscheme solarized
colorscheme molokai
set background=light
"}}}

"fold設定"{{{
set foldenable
"makerでのfold
set foldmethod=marker
"閉じていても開いていてもウィンドウ左端を指定列分表示
"set foldcolumn=1
"fold chars(fold垂直 fold水平文字の設定)
"set fillchars=vert:\|
"foldカラー設定
"hi Folded gui=bold term=standout cterm=bold ctermfg=125
"                               \ guibg=Grey30 guifg=Grey80
"hi FoldColumn gui=bold term=standout cterm=bold ctermfg=125
"                                   \  guibg=Grey guifg=DarkBlue
"}}}

"vim set baseset"{{{
"tabを常に表示
set showtabline=2
"行番号の表示
set number
"ウィンドウ幅
set winwidth=80
"tabstop（タブ表示スペース数）
set ts=4
"tab挿入時には適切な数の空白を使う
set expandtab
"自動インデントや"<<",">>"でずれる幅"
set sw=4
"Always indent/outdent to the nearest tabstop
set shiftround
"タブやバックスペースでカーソルが動く幅
set softtabstop=4
"カーソルライン
set cursorline
"自動インデント
set autoindent
"検索文字大小文字区別なしの設定
set ignorecase
"検索文字大文字含む時のみ大小区別設定
set smartcase
"Cインデント
set nocindent
"検索結果をハイライト
set hlsearch
"括弧の対応表示
set showmatch
"エンコードutf-8
set encoding=utf-8
"コマンドラインの高さ
set cmdheight=2
"変更された行の報告が出る最小値
set report=0
"タブ・行末スペースの表示形式設定
set listchars=tab:>-,trail:-,extends:>,precedes:<
"タブ・行末スペースの表示
set list
" Display another buffer when current buffer isn't saved.
set hidden
"ビープ音ではなくビジュアルベル（画面フラッシュ）を使う
set vb

" Windows
set splitbelow  " 横分割したら新しいウィンドウは下に
set splitright  " 縦分割したら新しいウィンドウは右に
set noequalalways "分割時はウィンドウにサイズを合わせる
"}}}

"quickrun設定"{{{
let g:quickrun_config = {}
let g:quickrun_config.markdown = {
      \ 'outputter' : 'null',
      \ 'command'   : 'open',
      \ 'cmdopt'    : '-a',
      \ 'args'      : 'Marked',
      \ 'exec'      : '%c %o %a %s',
      \ }
"}}}

"python開発環境"{{{
let g:virtualenv_directory = '~/tests/python/'
"}}}

" Keymap Base {{{
imap <C-j> <ESC>

"検索時のハイライト解除
nmap <silent><ESC><ESC> :noh<CR><ESC>

" 検索後画面の中心に。
nnoremap n nzz
nnoremap N Nzz
"}}}

" e[Alt]:  ex) eo ep "{{{
" The prefix key.
nnoremap [Alt]   <Nop>
xnoremap [Alt]   <Nop>
nmap    e  [Alt]
xmap    e  [Alt]

" Indent paste.
nnoremap <silent> [Alt]p o<Esc>pm``[=`]``^
xnoremap <silent> [Alt]p o<Esc>pm``[=`]``^
nnoremap <silent> [Alt]P O<Esc>Pm``[=`]``^
xnoremap <silent> [Alt]P O<Esc>Pm``[=`]``^

" Insert blank line.
nnoremap <silent> [Alt]o o<Space><BS><ESC>
nnoremap <silent> [Alt]O O<Space><BS><ESC>
"}}}

" [Space]: Other useful commands "{{{
" Smart space mapping.
" Notice: when starting other <Space> mappings in noremap, disappeared [Space].
nmap  <Space>   [Space]
xmap  <Space>   [Space]
nnoremap  [Space]   <Nop>
xnoremap  [Space]   <Nop>
"}}}

"[Space]: ex) aq:quitall fq:quitforceall save key mapping"{{{
nnoremap <silent>  [Space]w  :<C-u>update<CR>
nnoremap <silent>  [Space]fw :<C-u>write!<CR>
nnoremap <silent>  [Space]aq :<C-u>quitall<CR>
nnoremap <silent>  [Space]fq :<C-u>quitall!<CR>
"}}}

"[Space]: ex) fm:foldmake fd:folddel fold key moving"{{{
"次の
noremap [Space]j  zjzz
"前の
noremap [Space]k  zkzz
"FOLDクローズ
noremap [Space]h  zczz
"FOLDオープン
noremap [Space]l  zozz
"FOLD全部閉じる
noremap [Space]ah  zMzz
"全FOLDを開く
noremap [Space]al zR
"FOLDを作る
noremap [Space]fm  zf
"FOLDを削除
noremap [Space]fd  zd
"}}}

"[Space]: ex) ev er ez et rv dotfile再読み込み簡易化"{{{
nnoremap [Space]rv :<C-u>source ~/.vimrc<Return>
nnoremap [Space]ev :<C-u>edit ~/.vimrc<Return>
nnoremap [Space]er :<C-u>edit ~/readme.md<Return>
nnoremap [Space]ez :<C-u>edit ~/.zshrc<Return>
nnoremap [Space]et :<C-u>edit ~/.tmux.conf<Return>

"}}}

"[Space]: ex) ltp lty lth ltj ltv ltc 言語テストファイル作成(Language test)"{{{
"cdはかえてくれないから、実行時のrequire設定などに注意すること
nnoremap [Space]ltp :<C-u>call <SID>get_cdir_filelist('pl')<CR>
nnoremap [Space]lty :<C-u>call <SID>get_cdir_filelist('py')<CR>
nnoremap [Space]lth :<C-u>call <SID>get_cdir_filelist('html')<CR>
nnoremap [Space]ltj :<C-u>call <SID>get_cdir_filelist('js')<CR>
nnoremap [Space]ltv :<C-u>call <SID>get_cdir_filelist('vim')<CR>
nnoremap [Space]ltc :<C-u>call <SID>get_cdir_filelist('cpp')<CR>

"言語テストファイル作成"
let s:codetest_working_path = {
	\ 'pl' : '~/tests/perl',
	\ 'html' : '~/tests/html',
	\ 'js' : '~/tests/javascript',
	\ 'vim' : '~/tests/vim',
	\ 'cpp' : '~/tests/cpp',
	\ 'py' : '~/tests/python'
    \ }

function! s:get_cdir_filelist(target_lang)
	let l:list =[]
	let l:target_path  = s:codetest_working_path[a:target_lang]
	
	let l:files = split(glob( l:target_path."**/*" , '\n'))
	for l:i in l:files
		if !isdirectory(l:i)
			if getfsize(l:i)
			else
				call delete(l:i)
			endif
		endif
	endfor
	let l:filename  = l:target_path . '/edit' . strftime('\%y%m%d_%H%M%S')
	let l:filename .= '.'  . a:target_lang
	execute 'edit ' . l:filename
endfunction
"}}}

" <C-t>[Tabbed]: ex) [tabbed]d:tabclose [tabbed]t:unitetab Tab pages"{{{
" The prefix key.
nmap <C-t> [Tabbed]
nnoremap [Tabbed]   <Nop>
" Create tab page.
nnoremap <silent> [Tabbed]n  :<C-u>tabnew<CR>
nnoremap <silent> [Tabbed]d  :<C-u>tabclose<CR>
" Move to other tab page.
nnoremap <silent> [Tabbed]j
            \ :execute 'tabnext' 1 + (tabpagenr() + v:count1 - 1) % tabpagenr('$')<CR>
nnoremap <silent> [Tabbed]k  :<C-u>tabprevious<CR>
nnoremap <silent> [Tabbed]l
            \ :<C-u>execute 'tabmove' min([tabpagenr() + v:count1 - 1, tabpagenr('$')])<CR>
nnoremap <silent> [Tabbed]h
            \ :<C-u>execute 'tabmove' max([tabpagenr() - v:count1 - 1, 0])<CR>
nnoremap <silent> [Tabbed]L  :<C-u>tabmove<CR>
nnoremap <silent> [Tabbed]H  :<C-u>tabmove 0<CR>
nnoremap <silent> [Tabbed]<C-t>       :<C-u>Unite tab<CR>
"}}}

"TABKEY:  ex) tabkey shift-tab cursur move splitwindow"{{{
nnoremap <silent> <Tab> :call <SID>NextWindow()<CR>
nnoremap <silent> <S-Tab> :call <SID>PreviousWindowOrTab()<CR>"

"window移動
function! s:NextWindow()
  if winnr('$') == 1
    silent! normal! ``z.
  else
    wincmd w
  endif
endfunction

function! s:PreviousWindowOrTab()
  if winnr() > 1
    wincmd W
  else
    tabprevious
    execute winnr("$") . "wincmd w"
  endif
endfunction
"}}}

" s[Window]: window control"{{{
nnoremap  [Window]   <Nop>
nmap  s   [Window]
""}}}

"s[Window]: ex) p v c o d D en window split vsplit close only"{{{
nnoremap <silent> [Window]p  :<C-u>call <SID>split_nicely()<CR>
nnoremap <silent> [Window]v  :<C-u>vsplit<CR>
nnoremap <silent> [Window]c  :<C-u>call <sid>smart_close()<CR>
nnoremap <silent> [Window]o  :<C-u>only<CR>
" Delete current buffer."
nnoremap <silent> [Window]d  :<C-u>call <SID>CustomBufferDelete(0)<CR>
" Force delete current buffer.
nnoremap <silent> [Window]D  :<C-u>call <SID>CustomBufferDelete(1)<CR>
nnoremap <silent> [Window]en  :<C-u>new<CR>

" .vimrc snippet that allows you to move around windows beyond tabs
"最後のウィンドウでなければ閉じる
function! s:smart_close()
  if winnr('$') != 1
      close
  endif
endfunction

"ウィンドウ幅が標準の二倍より多き場合のみ縦スプリット
command! SplitNicely call s:split_nicely()
function! s:split_nicely()
  if winwidth(0) > 2 * &winwidth
    vsplit
  else
    split
  endif
  wincmd p
endfunction

function! s:CustomBufferDelete(is_force)
  let current = bufnr('%')

  if a:is_force
    silent! execute 'bdelete! ' . current
  else
    silent! execute 'bdelete ' . current
  endif
endfunction
""}}}

" f[Util]: baseclass"{{{
nnoremap  [Util]   <Nop>
nmap  f   [Util]
""}}}

" f[Util]: ff fb ff fm fc FuzzyFinder NERDTree"{{{
nnoremap <silent> [Util]f :<C-u>NERDTree<CR>
nnoremap          [Util]b :FufBuffer!<CR>
nnoremap          [Util]i :FufFile!<CR>
nnoremap          [Util]m :FufMruFile!<CR>
nnoremap          [Util]c :FufRenewCache<CR>
autocmd FileType fuf nmap <C-j> <ESC>
let g:fuf_patternSeparator = ' '
let g:fuf_modesDisable = ['mrucmd']
let g:fuf_mrufile_exclude = '\v\.DS_Store|\.git|\.swp|\.svn'
let g:fuf_mrufile_maxItem = 100
let g:fuf_enumeratingLimit = 20
let g:fuf_file_exclude = '\v\.DS_Store|\.git|\.swp|\.svn'
"}}}

" GIST  [Window][Space]: Gist Window"{{{
nnoremap <silent> [Window]g
      \ :<C-u>Gist -l urinurin<CR>
nnoremap [Space]gm
      \ :<C-u>Gist -s ''<Left>
vnoremap [Space]gm
      \ :Gist -s ''<Left>
""}}}

" t[BLANK]: baseclass"{{{
nnoremap  [BLANK]   <Nop>
nmap  t   [BLANK]

""}}}
