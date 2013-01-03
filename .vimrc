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
"neobundle設定"{{{
set nocompatible
filetype off

if has('vim_starting')
	set runtimepath+=~/.bundle/neobundle.vim
		call neobundle#rc(expand('~/.bundle'))
endif

NeoBundle 'git://github.com/Shougo/neobundle.vim.git'
NeoBundle 'git://github.com/Shougo/unite.vim.git'
NeoBundle 'git://github.com/Shougo/neosnippet.git'
NeoBundle 'git://github.com/Shougo/neocomplcache.git'
NeoBundle 'git://github.com/thinca/vim-ref.git'
NeoBundle 'git://github.com/Shougo/vimfiler.git'
NeoBundle 'git://github.com/Shougo/vimshell.git'
NeoBundle 'git://github.com/thinca/vim-quickrun'
NeoBundle 'git://github.com/thinca/vim-guicolorscheme.git'
NeoBundle 'git://github.com/Lokaltog/vim-powerline.git'
NeoBundle 'git://github.com/altercation/vim-colors-solarized.git'
NeoBundle 'git://github.com/vim-scripts/newspaper.vim.git'
NeoBundle 'git://github.com/LeafCage/foldCC.git'
NeoBundle 'git://github.com/mattn/zencoding-vim.git'
NeoBundle 'git://github.com/jmcantrell/vim-virtualenv.git'
NeoBundle 'git://github.com/kana/vim-smartchr.git'

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
"colorscheme newspaper
colorscheme solarized
"set background=light
set background=dark
"let g:solarized_contrast="hight"
"let g:solarized_visibility="low"
"}}}

"fold設定"{{{
set foldenable
"makerでのfold
set foldmethod=marker
"閉じていても開いていてもウィンドウ左端を指定列分表示
set foldcolumn=4
"fold chars(fold垂直 fold水平文字の設定)
set fillchars=vert:\|
"foldCC.vimを使用したfoldレイアウト変更
set foldtext=FoldCCtext()
"foldカラー設定
hi Folded gui=bold term=standout cterm=bold ctermfg=125
                               \ guibg=Grey30 guifg=Grey80

hi FoldColumn gui=bold term=standout cterm=bold ctermfg=125
                                   \  guibg=Grey guifg=DarkBlue

"}}}

"vim基本設定"{{{
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

"キーマップ {{{
"
""ミスタッチ防止設定
imap <C-@> <C-[>
"カッコやクオートなどを入力した際に左に自動で移動します
inoremap {} {}<Left>
inoremap [] []<Left>
inoremap () ()<Left>
inoremap "" ""<Left>
inoremap '' ''<Left>
inoremap <> <><Left>

"検索時のハイライト解除
nmap <silent><ESC><ESC> :noh<CR><ESC>

" 検索後画面の中心に。
nnoremap n nzz
nnoremap N Nzz

" e: Change basic commands "{{{
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

"save key mapping"{{{
noremap <silent>  [Space]w  :<C-u>update<CR>
noremap <silent>  [Space]fw :<C-u>write!<CR>
noremap <silent>  [Space]aq :<C-u>quitall<CR>
noremap <silent>  [Space]fq :<C-u>quitall!<CR>
"}}}

"fold key moving"{{{
"次の
noremap [Space]j  zjzz
"前の
noremap [Space]k  zkzz
"FOLD先頭
noremap [Space]n  ]zzz
"FOLD最終
noremap [Space]p  [zzz
"FOLDクローズ
noremap [Space]h  zczz
"FOLDオープン
noremap [Space]l  zozz
"FOLD閉じたり開いたり
noremap [Space]a  zazz
"FOLD全部閉じる
noremap [Space]m  zMzz
"現在FOLD以外全部閉じる
noremap [Space]i  zMzv
"全FOLDを開く
noremap [Space]rr zR
"FOLDを作る
noremap [Space]f  zf
"FOLDを削除
noremap [Space]d  zd
"現在FOLD表示
noremap [Space]gg  :<C-u>echo FoldCCnavi()<CR>
"}}}

"check registers and marks"{{{
nnoremap <silent> [Space]mk :<C-u>marks<CR>
nnoremap <silent> [Space]re :<C-u>registers<CR>
"}}}

"}}}

" <C-t>: Tab pages"{{{
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
nnoremap <silent> [Tabbed]K  :<C-u>tabfirst<CR>
nnoremap <silent> [Tabbed]J  :<C-u>tablast<CR>
nnoremap <silent> [Tabbed]l
            \ :<C-u>execute 'tabmove' min([tabpagenr() + v:count1 - 1, tabpagenr('$')])<CR>
nnoremap <silent> [Tabbed]h
            \ :<C-u>execute 'tabmove' max([tabpagenr() - v:count1 - 1, 0])<CR>
nnoremap <silent> [Tabbed]L  :<C-u>tabmove<CR>
nnoremap <silent> [Tabbed]H  :<C-u>tabmove 0<CR>
nnoremap <silent> [Tabbed]<C-t>       :<C-u>Unite tab<CR>
"}}}

"window"{{{
nnoremap  [Window]   <Nop>
nmap  s   [Window]

nnoremap <silent> [Window]p  :<C-u>call <SID>split_nicely()<CR>
nnoremap <silent> [Window]v  :<C-u>vsplit<CR>
nnoremap <silent> [Window]c  :<C-u>call <sid>smart_close()<CR>
nnoremap <silent> [Window]o  :<C-u>only<CR>

" .vimrc snippet that allows you to move around windows beyond tabs
nnoremap <silent> <Tab> :call <SID>NextWindow()<CR>
nnoremap <silent> <S-Tab> :call <SID>PreviousWindowOrTab()<CR>

" Unite Window
nnoremap <silent> [Window]s
      \ :<C-u>Unite -buffer-name=files -no-split
      \ jump_point file_point buffer_tab file file/new file_mru<CR>
nnoremap <silent> [Window]t
      \ :<C-u>Unite -buffer-name=files tab<CR>
nnoremap <silent> [Window]w
      \ :<C-u>Unite window<CR>
nnoremap <silent> [Space]b
      \ :<C-u>UniteBookmarkAdd<CR>

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

" Delete current buffer."{{{
nnoremap <silent> [Window]d  :<C-u>call <SID>CustomBufferDelete(0)<CR>

" Force delete current buffer.
nnoremap <silent> [Window]D  :<C-u>call <SID>CustomBufferDelete(1)<CR>

function! s:CustomBufferDelete(is_force)
  let current = bufnr('%')

  if a:is_force
    silent! execute 'bdelete! ' . current
  else
    silent! execute 'bdelete ' . current
  endif
endfunction
"}}}

" Edit"{{{
nnoremap <silent> [Window]en  :<C-u>new<CR>
"}}}

"}}}

".vimrc再読み込み簡易化"{{{
noremap [Space]rv :<C-u>source ~/.vimrc<Return>
noremap [Space]ev :<C-u>edit ~/.vimrc<Return>
noremap [Space]er :<C-u>edit ~/readme.txt<Return>
"}}}

"言語テストファイル作成(Language test)"{{{
"cdはかえてくれないから、実行時のrequire設定などに注意すること
nnoremap [Space]ltp :<C-u>call <SID>get_cdir_filelist('pl')<CR>
nnoremap [Space]lty :<C-u>call <SID>get_cdir_filelist('py')<CR>
nnoremap [Space]lth :<C-u>call <SID>get_cdir_filelist('html')<CR>
nnoremap [Space]ltj :<C-u>call <SID>get_cdir_filelist('js')<CR>
nnoremap [Space]ltv :<C-u>call <SID>get_cdir_filelist('vim')<CR>
nnoremap [Space]ltc :<C-u>call <SID>get_cdir_filelist('cpp')<CR>
"}}}
"}}}

"コード試し打ち"{{{
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

"python開発環境"{{{
let g:virtualenv_directory = '~/tests/python/'
"}}}
"
"vimfiler Setting"{{{
"vimfilerセーフモード無効化
let g:vimfiler_safe_mode_by_default = 0
"vimfilerデフォルトファイラー設定
let g:vimfiler_as_default_explorer = 1
"}}}

" Unite vim {{{
" The prefix key.
nnoremap [unite] <Nop>
xnoremap [unite] <Nop>
nmap f [unite]
xmap f [unite]

nnoremap [unite]u       q:Unite<SPACE>
"}}}

" ネオコン設定:"{{{
"
""ネオコンの有効化
"let g:neocomplcache_enable_at_startup = 1
""区切りの補完を有効化
"let g:neocomplcache_enable_underbar_completion = 1
""シンタックスキャッシュの最小文字数
"let g:neocomplcache_min_syntax_length = 3
""相性の悪いバッファは無効にする
"let g:neocomplcache_lock_buffer_name_pattern = '\*ku\*'
""大文字が入力されるまで大文字小文字の区別をしない
"let g:neocomplcache_enable_smart_case = 1
""大文字を区切り文字としたワイルドカードの様に振る舞う
"let g:neocomplcache_enable_camel_case_completion = 1
"
""tabでポップアップ選択制御：pumvisible()(ポップアップメニューが閉じてたら0)
"inoremap <expr><TAB> pumvisible() ? "\<C-n>" : "\<TAB>"
"
"
""ctagsファイル生成定義(ctags -R -h ".pm" 再起的に-R 拡張子pmを対象に-h)
"let g:neocomplcache_ctags_arguments_list = {
"  \ 'perl' : '-R -h ".pm"'
"  \ }
""スニペット登録先ディレクトリ
"let g:neocomplcache_snippets_dir = "~/.vim/snippets"
""補完文字の辞書定義
"let g:neocomplcache_dictionary_filetype_lists = {
"    \ 'default'    : '',
"    \ 'perl'       : '~/.vim/dict/perl.dict'
"    \ }
""記録するキーワードの正規表現定義
"if !exists('g:neocomplcache_keyword_patterns')
"  let g:neocomplcache_keyword_patterns = {}
"endif
"let g:neocomplcache_keyword_patterns['default'] = '\h\w*'
"
""スニペット展開キーマップ
"imap <expr><C-k> neocomplcache#sources#snippets_complete#expandable() ? "\<Plug>(neocomplcache_snippets_expand)" : "\<C-n>"
"smap <C-k> <Plug>(neocomplcache_snippets_expand)
"}}}
