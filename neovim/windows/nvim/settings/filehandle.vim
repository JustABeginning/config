" VIM Key Mappings (Custom)
autocmd Filetype * setlocal cpoptions+=I
autocmd Filetype arduino,json setlocal shiftwidth=2 tabstop=2
" Set `zsh` as `sh`
autocmd FileType zsh setlocal ft=sh
"autocmd Filetype tex setlocal encoding=utf-8
"autocmd Filetype asm setlocal ft=nasm
"autocmd Filetype asm setlocal ft=fasm
"autocmd Filetype asm setlocal ft=gas
"autocmd Filetype asm source ~\vimfiles\syntax\asmx86.vim
"autocmd! FileType c,cpp,java,php call CSyntaxAfter()
au BufNewFile,BufRead *.ovpn setfiletype openvpn | set commentstring=#%s 
"au BufNewFile,BufRead *.java setfiletype java

" Python3 Path
let g:python3_host_prog = 'python.exe'
" Disable Ruby Provider
let g:loaded_ruby_provider = 0
" Disable Perl Provider
let g:loaded_perl_provider = 0

" Java Syntax
"let java_highlight_functions = 1
"let java_highlight_all = 1
" If you are trying this at runtime, you need to reload the syntax file
" set filetype=java
" Some more highlights, in addition to those suggested by cmcginty
"highlight link javaScopeDecl Statement
"highlight link javaType Type
"highlight link javaDocTags PreProc

" VIM jsbeautify
"map <c-f> :call JsBeautify()<cr>
"autocmd FileType javascript vnoremap <buffer> <leader>af :call RangeJsBeautify()<cr>
"autocmd FileType json vnoremap <buffer> <leader>af :call RangeJsonBeautify()<cr>
"autocmd FileType jsx vnoremap <buffer> <leader>af :call RangeJsxBeautify()<cr>
"autocmd FileType html vnoremap <buffer> <leader>af :call RangeHtmlBeautify()<cr>
"autocmd FileType css vnoremap <buffer> <leader>af :call RangeCSSBeautify()<cr> 

" VIM HTML Close Tags
function s:CompleteTags()
    inoremap <buffer> <A-\> </<C-x><C-o><Esc>:startinsert!<CR><C-O>?</<CR><Esc>:noh<CR>i<Right>
    inoremap <buffer> <A-/> </<C-x><C-o><Esc>:startinsert!<CR><C-O>?</<CR><CR><Tab><CR><Up><C-O>$<Esc>:noh<CR>i<Right>
endfunction
autocmd BufRead,BufNewFile *.html,*.js,*.xml call s:CompleteTags()

" Rename current file in Normal Saved Mode (Only in PWD)
nnoremap <A-d> :call SetName()<cr>:w <C-r>b<cr>:let @a=getreg('%')<cr>:e <C-r>b<cr>:call delete(getreg('a'))<cr>:call setreg('a',[])<cr>:call setreg('b',[])<cr>
function! SetName()
    call inputsave()
    let @b=input('Enter New Name : ')
    call inputrestore()
endfunction

" For auto-indenting a set of lines
autocmd FileType tex,st,bib nnoremap <buffer> ti :!"latexindent.exe" -w -s %<cr>
" Autoformat for java, c, python, yaml
autocmd FileType java,c,python,yaml,javascript,dockerfile nnoremap <buffer> ti :call CocAction('format')<cr>
" Autoformat for vim filetype
autocmd FileType vim nnoremap <silent> ti <Cmd>FiletypeFormat<CR>
" Autoformat any filetype with coc-prettier (:Prettier)
command! -nargs=0 Prettier :CocCommand prettier.forceFormatDocument

" Autocommand for a single website (i.e. stackoverflow.com) [GhostText]
let g:nvim_ghost_autostart = 0
augroup nvim_ghost_user_autocommands
    au nvim_ghost_user_autocommands User www.overleaf.com setfiletype tex
augroup END
nmap <leader>gi :GhostTextStart<cr>
nmap <leader>gs :GhostTextStop<cr>
"
"autocmd FileType javascript nnoremap <buffer> <leader>ah :let @b=line('.')<cr>ggVG:call RangeJsBeautify()<cr>:<C-r>b<cr>
"autocmd FileType json nnoremap <buffer> <leader>ah :let @b=line('.')<cr>ggVG:call RangeJsonBeautify()<cr>:<C-r>b<cr>
"autocmd FileType jsx nnoremap <buffer> <leader>ah :let @b=line('.')<cr>ggVG:call RangeJsxBeautify()<cr>:<C-r>b<cr>
"autocmd FileType html nnoremap <buffer> <leader>ah :let @b=line('.')<cr>ggVG:call RangeHtmlBeautify()<cr>:<C-r>b<cr>
"autocmd FileType css nnoremap <buffer> <leader>ah :let @b=line('.')<cr>ggVG:call RangeCSSBeautify()<cr>:<C-r>b<cr>

" Mapping to reload configuration
nmap <leader>so :source $MYVIMRC<cr>:noh<cr>
" Mapping to load helptags from ~\vimfiles\doc
"nmap <leader>sh :helptags $HOME\vimfiles\doc<cr>
" Only close file
nmap <leader>cf :bd<cr>
" Mapping to close Syntastic Error Window
"nmap <leader>cs :SyntasticReset<cr>
" Mapping to enable Syntastic Check
"nmap <leader>rs :SyntasticCheck<cr>
" Mapping to open pdf for latex
nmap <leader>lp :let @a=expand('%:r')<cr>:!start <C-r>a.pdf<cr>:call setreg('a',[])<cr>
" Mapping to delete *.bak* type files
nmap <leader>db :let @a=expand('%:h')<cr>:!cd <C-r>a<cr><cr>:call setreg('a', [])<cr>:!del *.bak*<cr>

" Spell Check
setlocal spell
set spelllang=en_gb
inoremap <C-l> <c-g>u<Esc>[s1z=`]a<c-g>u
