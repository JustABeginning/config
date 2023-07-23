" Home DIR
let $homie=stdpath('config')

" Setting Leader
let mapleader = ","

if exists('g:vscode')
    " VSCode extension
    source $homie/settings/vscmap.vim
else
    " Ordinary Neovim
    " Vim Plug Config
    call plug#begin()
    "The default plugin directory will be as follows:
    "   - Vim (Linux/macOS): '~/.vim/plugged'
    "   - Vim (Windows): '~/vimfiles/plugged'
    "   - Neovim (Linux/macOS/Windows): stdpath('data') . '/plugged'
    " You can specify a custom plugin directory by passing it as the argument
    "   - e.g. `call plug#begin('~/.vim/plugged')`
    "   - Avoid using standard Vim directory names like 'plugin'

    " Make sure you use single quotes

    "Plug 'pacha/vem-tabline'
    "Plug 'crispgm/nvim-tabline'
    Plug 'townk/vim-autoclose'
    Plug 'lfv89/vim-interestingwords'
    Plug 'drewtempelmeyer/palenight.vim'
    Plug 'navarasu/onedark.nvim'
    Plug 'vim-airline/vim-airline'
    Plug 'vim-airline/vim-airline-themes'
    "Plug 'maxmellon/vim-jsx-pretty'
    Plug 'ryanoasis/vim-devicons'
    Plug 'scrooloose/nerdtree'
    Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
    Plug 'junegunn/fzf.vim'
    Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}
    " Stable version of coc
    Plug 'neoclide/coc.nvim', {'branch': 'release'}
    Plug 'uzxmx/vim-widgets'
    "Plug 'vim-latex/vim-latex'
    " vim-plug
    Plug 'lervag/vimtex'
    Plug 'ianding1/leetcode.vim'
    " JAR Manifest Highlight
    Plug 'alblue/vim-manifest'
    " Assembly Code
    Plug 'shirk/vim-gas'
    Plug 'philj56/vim-asm-indent'
    " smali Syntax
    Plug 'kelwin/vim-smali'
    " IntelliJ IDEA Comrade Neovim
    "Plug 'beeender/Comrade'

    " Initialize plugin system
    " - Automatically executes `filetype plugin indent on` and `syntax enable`.
    call plug#end()
    " You can revert the settings after the call like so:
    "   filetype indent off   " Disable file-type-specific indentation
    "   syntax off            " Disable syntax highlighting

    " Sourcing Config Files
    source $homie/settings/theme.vim
    source $homie/settings/general.vim
    source $homie/settings/navigation.vim
    source $homie/settings/filehandle.vim
    source $homie/settings/nvimap.vim
    source $homie/plug-config/treesitter.vim
    source $homie/plug-config/coc.vim
    source $homie/plug-config/leetcode.vim
endif

" Common Config for Neovim & VSCode
source $homie/settings/common.vim
