" Normal Mode
inoremap jk <Esc>
inoremap jj <Esc>
"Using Ctrl-c to copy globally
vnoremap <C-c> "+y
"Using Ctrl-x to cut globally
vnoremap <C-x> "+d
"Using Ctrl+v to paste globally
nnoremap <C-v> "+p
nnoremap <C-S-v> "+P
inoremap <C-v> <C-r>+
" To turn off hignlighting until next search
nnoremap <F5> :noh<cr>
" Move Tab in Normal Mode
nnoremap mt :call MoveTab()<cr>:tabmove <C-r>b<cr>:call setreg('b',[])<cr>
function! MoveTab()
    call inputsave()
    let @b=input('Enter MOVE VALUE : ')
    call inputrestore()
endfunction
" To move and insert an indent on the line before the current cursor 
"(assuming empty line)
inoremap <C-k> <esc>:let @a=col('.')<cr>:let @b=line('.')<cr>:call cursor(@b,@a+1)<cr>i<cr><esc>:call cursor(@b,@a+1)<cr>:call setreg('a',[])<cr>:call setreg('b',[])<cr>i<Right><cr>
" Select Next/Prev Word in Insert Mode
inoremap <C-.> <C-Right><C-o>viw<C-g>
inoremap <C-,> <C-Left><C-o>viw<C-g>
" Escape Select Mode in Insert Mode
snoremap <C-/> <Esc>i
