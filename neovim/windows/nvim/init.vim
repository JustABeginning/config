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
    " Neovim GUI
    Plug 'equalsraf/neovim-gui-shim'
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
    " IntelliJ IDEA Comrade Neovim
    "Plug 'beeender/Comrade'
    "
    " Vim Filetype Plugin
    Plug 'pappasam/vim-filetype-formatter'

    " UltiSnips Plugin
    " Track the engine.
    " Plug 'SirVer/ultisnips'

    " LuaSnip Plugin
    " follow latest release and install jsregexp.
    Plug 'L3MON4D3/LuaSnip', {'tag': 'v2.*', 'do': 'make install_jsregexp'}
    " Replace <CurrentMajor> by the latest released major (first number of
    " latest release)
    "
    " A Vim Plugin for Lively Previewing LaTeX PDF Output
    "Plug 'xuhdev/vim-latex-live-preview', { 'for': 'tex' }

    " Snippets are separated from the engine. Add this if you want them:
    " Plug 'honza/vim-snippets'

    " Initialize plugin system
    " - Automatically executes `filetype plugin indent on` and `syntax enable`.
    call plug#end()
    " You can revert the settings after the call like so:
    "   filetype indent off   " Disable file-type-specific indentation
    "   syntax off            " Disable syntax highlighting

    " Sourcing Config Files
    " Theme Load
    source $homie/settings/theme.vim
    " Plug Config Load
    source $homie/plug-config/treesitter.vim
    source $homie/plug-config/coc.vim
    source $homie/plug-config/leetcode.vim
    source $homie/plug-config/vimtex.vim
    source $homie/plug-config/luasnip.vim
    " User Settings Load
    source $homie/settings/general.vim
    source $homie/settings/navigation.vim
    source $homie/settings/filehandle.vim
    source $homie/settings/nvimap.vim

    " Lua Config
    lua require("luasnip.loaders.from_lua").lazy_load({ paths = {"./lua/snippets" } })
    " End Lua Config

endif

" Common Config for Neovim & VSCode
source $homie/settings/common.vim
