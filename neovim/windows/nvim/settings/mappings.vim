" Autoclose
inoremap <A-7> ""<left>
inoremap <A-=> ''<left>
inoremap <A-9> ()<left>
inoremap <A-8> []<left>
inoremap <A-0> {}<left>
inoremap <A-.> <><left>
inoremap <A-,> <><left>
"set expandtab "Inserts SPACES for TABS
" Moving Lines UP and DOWN
inoremap <A-j> <Esc>:m .+1<CR>==gi
inoremap <A-k> <Esc>:m .-2<CR>==gi
vnoremap <A-j> :m '>+1<CR>gv=gv
vnoremap <A-k> :m '<-2<CR>gv=gv
" Insert mode, keeping original indentation
nnoremap <S-i> S
" Re-Map Autocomplete menu
"inoremap <A-o> <C-n>
" Custom Auto Bullet and Numbering
inoremap <A-n> <esc>^v<Right>y$i<Right><cr><esc>Pi<Right><space>
inoremap <A-S-n> <esc>^v<Right>y$i<Right><cr><esc>PV=i<Right><Right><space>
inoremap <C-l> <esc>^v<Right>y$i<Right><cr><esc>PVg<C-a>i<Right><Right><space>
inoremap <C-S-l> <esc>^v<Right>y$i<Right><cr><esc>PVg<C-a>V=i<Right><Right><space>
inoremap <A-b> <esc>^vy$i<Right><cr><esc>Pi<Right><space>
inoremap <A-S-b> <esc>^vy$i<Right><cr><esc>PV=i<Right><space>
nnoremap <A-n> ^v<Right>y$i<Right><cr><esc>Pi<Right><space>
nnoremap <A-S-n> ^v<Right>y$i<Right><cr><esc>PV=i<Right><Right><space>
nnoremap <C-l> ^v<Right>y$i<Right><cr><esc>PVg<C-a>i<Right><Right><space>
nnoremap <C-S-l> ^v<Right>y$i<Right><cr><esc>PVg<C-a>V=i<Right><Right><space>
nnoremap <A-b> ^vy$i<Right><cr><esc>Pi<Right><space>
nnoremap <A-S-b> ^vy$i<Right><cr><esc>PV=i<Right><space>
"Advanced Match information, required matchit
imap <C-j> <esc><Right>%i<Right>
"map <C-m> %:let @a=col('.')<cr>^v$"by:let @c=line(".")<cr>:call cursor(@c,@a)<cr>%:call popup_atcursor(getreg('b')."Line : ".getreg('c'),{})<cr>:call setreg('a',[])<cr>:call setreg('b',[])<cr>:call setreg('c',[])<cr>
"imap <C-m> <esc><Right>%:let @a=col('.')<cr>^v$"by:let @c=line(".")<cr>:call cursor(@c,@a)<cr>%:call popup_atcursor(getreg('b')."Line : ".getreg('c'),{})<cr>:call setreg('a',[])<cr>:call setreg('b',[])<cr>:call setreg('c',[])<cr>
" Backspace in Visual mode 
vnoremap <backspace> x
" Alternate ESC Key
"inoremap <A-i> <esc>
"nnoremap <A-i> <esc>
"vnoremap <A-i> <esc>
