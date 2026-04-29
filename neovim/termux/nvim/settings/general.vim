set modifiable
" Switch buffers without having to save their changes before (Required for vem-tabline)
"set hidden
"set guitablabel=\[%N\]\ %t\ \(%M\)
" Set File Encoding
set encoding=utf-8
set fileencoding=utf-8
"set termencoding=utf-8
" Add to MatchPairs
set matchpairs+=<:>
" Set Shell
"set shell=C:\\WINDOWS\\system32\\cmd.exe
"set shellcmdflag=/c
"set shellquote="
"set shellxquote=

" Uncomment the following to have Vim jump to the last position when
" reopening a file
if has("autocmd")
    au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif
endif

" Uncomment the following to have Vim load indentation rules and plugins
" according to the detected filetype.
"filetype plugin indent on
" The following are commented out as they cause vim to behave a lot
" differently from regular Vi. They are highly recommended though.
"set showcmd		" Show (partial) command in status line.
" For LaTeX
set autoread		" Auto-load file from disk
au FocusGained * :checktime
set isfname-={
" Normal
set showmatch       " Show matching brackets.
set matchtime=1
"set shortmess=a "Display messages taking shorter space
"set autowrite		" Automatically save before commands like :next and :make
"set hidden		" Hide buffers when they are abandoned
" Backspace Adjustment
set backspace=indent,eol,start 
set mouse=a		" Enable mouse usage (all modes)
set number
set cursorline
set smartindent
set autoindent
set breakindent
set showbreak=..
set tabstop=4
set expandtab
set shiftwidth=4
" Conflict with coc-nvim
"set statusline+=%F
"set paste " Putting Vim in Paste mode
" For Universal Copy/Paste
"set clipboard=unnamed

" Mute Bell for Error
set noerrorbells visualbell t_vb=
if has('autocmd')
    autocmd GUIEnter * set visualbell t_vb=
endif
