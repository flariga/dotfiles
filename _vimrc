"""""""""""""""""""""""""""""""""""""""""""""""""
""" basics
""""""""""""""""""""""""""""""""""""""""""""""""""
set textwidth=0
set autoindent
"Window幅で折り返し
set wrap
"'検索末尾まで言ったら先頭から再検索
set wrapscan
set wildmenu

"検索時に大文字小文字区別しない
set ignorecase
set smartcase

"オートインデント、改行、インサートモード開始直後にBSで削除できるように
set backspace=indent,eol,start

"移動コマンド利用時に行頭移動しない
set nostartofline
"コマンドをステータスラインに表示
set showcmd
"ステータスラインを常に表示
set laststatus=2
"set statusline=%<%f\ %m%r%h%w%{'['.(&fenc!=''?&fenc:&enc).']['.&ff.']'}%=%l,%c%V%8P
set statusline=%F%m%r%h%w\ [FORMAT=%{&ff}]\ [TYPE=%Y]\ [ASCII=\%03.3b]\ [HEX=\%02.2B]\ [POS=%04l,%04v][%p%%]\ [LEN=%L]
"active windows statuslineをわかりやすく
highlight StatusLine  ctermfg=darkblue ctermbg=white cterm=bold,reverse
highlight StatusLineNC cterm=bold
"画面最下行にルーラー
set ruler
"クリップボードをOSと連携(要+clipboardでコンパイル =>viから :versionで確認)
set clipboard+=unnamed,autoselect

" 行末の空白文字を可視化
"highlight WhitespaceEOL cterm=underline ctermbg=red guibg=#FF0000
"match WhitespaceEOL /\s\+$/
"autocmd WinEnter * match WhitespaceEOL /\s\+$/

" 行頭のTAB文字を可視化
"highlight TabString ctermbg=red guibg=red
"au BufWinEnter * let w:m2 = matchadd("TabString", '^\t+')
"au WinEnter * let w:m2 = matchadd("TabString", '^\t+')

" 全角スペースの表示
highlight ZenkakuSpace cterm=underline ctermbg=red guibg=#666666
au BufWinEnter * let w:m3 = matchadd("ZenkakuSpace", '　')
au WinEnter * let w:m3 = matchadd("ZenkakuSpace", '　')

"行番号
set number
set title
"検索語をハイライト表示
set hlsearch

"インデントは2つ
set tabstop=2
set shiftwidth=2
set expandtab

"バックアップ
set nobackup

" カーソル行をハイライト
"set cursorline
" カレントウィンドウにのみ罫線を引く
"augroup cch
"  autocmd! cch
"  autocmd WinLeave * set nocursorline
"  autocmd WinEnter,BufRead * set cursorline
"augroup END

":hi clear CursorLine
":hi CursorLine gui=underline
"highlight CursorLine ctermbg=black guibg=black

"保存時に行末の空白を除去する
autocmd BufWritePre * :%s/\s\+$//ge
"保存時にtabをスペースに変換する
autocmd BufWritePre * :%s/\t/  /ge

"折りたたみ
"set foldmethod=manual
syntax enable



""""""""""""""""""""""""""""""""""""""""""""""""""
""" vundle
""""""""""""""""""""""""""""""""""""""""""""""""""
set nocompatible
filetype off
set rtp+=~/.vim/vundle.git/
call vundle#rc()

Bundle 'Shougo/neocomplcache'
Bundle 'hrp/EnhancedCommentify'
"Bundle 'vim-scripts/yanktmp.vim'
"Bundle 'tsaleh/vim-matchit'
"Bundle 'tpope/vim-rails'
Bundle 'tsaleh/vim-align'
Bundle 'janx/vim-rubytest'
"Bundle 'Shougo/unite.vim'
"Bundle 'rails.vim'
Bundle 'https://github.com/tpope/vim-fugitive.git'
"Bundle 'https://github.com/vim-scripts/Smooth-Scroll.git'

filetype plugin indent on

"""""""""""""""""""""""""""
"vim-rubytest
""""""""""""""""""""""""""
let g:rubytest_in_quickfix = 0

""""""""""""""""""""""""""""""""""""""""""""""""
" neocomplcache
""""""""""""""""""""""""""""""""""""""""""""""""
" Disable AutoComplPop.
let g:acp_enableAtStartup = 0
" Use neocomplcache.
let g:neocomplcache_enable_at_startup = 1
" Use smartcase.
let g:neocomplcache_enable_smart_case = 1
" Use camel case completion.
let g:neocomplcache_enable_camel_case_completion = 1
" Use underbar completion.
let g:neocomplcache_enable_underbar_completion = 1
" Set minimum syntax keyword length.
let g:neocomplcache_min_syntax_length = 3
let g:neocomplcache_lock_buffer_name_pattern = '\*ku\*'

" Define dictionary.
let g:neocomplcache_dictionary_filetype_lists = {
    \ 'default' : '',
    \ 'vimshell' : $HOME.'/.vimshell_hist',
    \ 'scheme' : $HOME.'/.gosh_completions'
        \ }

" Define keyword.
if !exists('g:neocomplcache_keyword_patterns')
    let g:neocomplcache_keyword_patterns = {}
endif
let g:neocomplcache_keyword_patterns['default'] = '\h\w*'

" Plugin key-mappings.
imap <C-k>     <Plug>(neocomplcache_snippets_expand)
smap <C-k>     <Plug>(neocomplcache_snippets_expand)
inoremap <expr><C-g>     neocomplcache#undo_completion()
inoremap <expr><C-l>     neocomplcache#complete_common_string()

" SuperTab like snippets behavior.
"imap <expr><TAB> neocomplcache#sources#snippets_complete#expandable() ? "\<Plug>(neocomplcache_snippets_expand)" : pumvisible() ? "\<C-n>" : "\<TAB>"

" Recommended key-mappings.
" <CR>: close popup and save indent.
inoremap <expr><CR>  neocomplcache#smart_close_popup() . "\<CR>"
" <TAB>: completion.
inoremap <expr><TAB>  pumvisible() ? "\<C-n>" : "\<TAB>"
" <C-h>, <BS>: close popup and delete backword char.
inoremap <expr><C-h> neocomplcache#smart_close_popup()."\<C-h>"
inoremap <expr><BS> neocomplcache#smart_close_popup()."\<C-h>"
inoremap <expr><C-y>  neocomplcache#close_popup()
inoremap <expr><C-e>  neocomplcache#cancel_popup()

" AutoComplPop like behavior.
"let g:neocomplcache_enable_auto_select = 1

" Shell like behavior(not recommended).
"set completeopt+=longest
"let g:neocomplcache_enable_auto_select = 1
"let g:neocomplcache_disable_auto_complete = 1
"inoremap <expr><TAB>  pumvisible() ? "\<Down>" : "\<C-x>\<C-u>"
"inoremap <expr><CR>  neocomplcache#smart_close_popup() . "\<CR>"

" Enable omni completion.
autocmd FileType css setlocal omnifunc=csscomplete#CompleteCSS
autocmd FileType html,markdown setlocal omnifunc=htmlcomplete#CompleteTags
autocmd FileType javascript setlocal omnifunc=javascriptcomplete#CompleteJS
autocmd FileType python setlocal omnifunc=pythoncomplete#Complete
autocmd FileType xml setlocal omnifunc=xmlcomplete#CompleteTags

" Enable heavy omni completion.
if !exists('g:neocomplcache_omni_patterns')
  let g:neocomplcache_omni_patterns = {}
endif
let g:neocomplcache_omni_patterns.ruby = '[^. *\t]\.\w*\|\h\w*::'
"autocmd FileType ruby setlocal omnifunc=rubycomplete#Complete
let g:neocomplcache_omni_patterns.php = '[^. \t]->\h\w*\|\h\w*::'
let g:neocomplcache_omni_patterns.c = '\%(\.\|->\)\h\w*'
let g:neocomplcache_omni_patterns.cpp = '\h\w*\%(\.\|->\)\h\w*\|\h\w*::'

""""""""""""""""""""""""""""""""""""""""""""""""""
""" unite.vim
""""""""""""""""""""""""""""""""""""""""""""""""""
"let g:unite_enable_start_insert=0
"nnoremap Ua :<C-u>Unite buffer<CR>
"nnoremap Uf :<C-u>Unite file<CR>
"nnoremap Um :<C-u>Unite file_mru<CR>
"nnoremap Uu :<C-u>Unite buffer file_mru<CR>
"nnoremap Ud :<C-u>UniteWithBufferDir -buffer-name=files file<CR>
"nnoremap Ua :<C-u>UniteWithBufferDir -buffer-name=files buffer file_mru
""bookmark file<CR>
"nnoremap Ur :<C-u>Unite -buffer-name=register register<CR>


""""""""""""""""""""""""""""""""""""""""""""""""""
""" yanktmp.vim
""""""""""""""""""""""""""""""""""""""""""""""""""
"map <silent> sy :call YanktmpYank()<CR>
"map <silent> sp :call YanktmpPaste_p()<CR>
"map <silent> sP :call YanktmpPaste_P()<CR>

""""""""""""""""""""""""""""""""""""""""""""""""""
""" eregex.vim
""""""""""""""""""""""""""""""""""""""""""""""""""
"nnoremap / :M/
"nnoremap ? :M?
"nnoremap ,/ /
"nnoremap ,? ?

":set [no]compatible以降に記述
"カーソルを行頭、行末で止まらないようにする
set whichwrap=b,s,h,l,<,>,[,]
