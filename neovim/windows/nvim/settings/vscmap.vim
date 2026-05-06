nnoremap z= <Cmd>call VSCodeNotify('keyboard-quickfix.openQuickFix')<CR>
" Mapping to save
nmap :s<cr> <Cmd>call VSCodeNotify('workbench.action.files.save')<CR>
" Mapping to reload configuration
nmap <leader>so :source $homie/init.vim<cr>:noh<cr>
"Using tc to copy globally
vnoremap tc "+y
"Using tx to cut globally
vnoremap tx "+d
"Using tv to paste globally
nnoremap tv "+p
inoremap tv <C-r>+
