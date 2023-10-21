lua <<EOF
require'nvim-treesitter.configs'.setup {
    --ensure_installed = { "lua" }, -- one of "all", "maintained" (parsers with maintainers), or a list of languages
    highlight = {
        enable = true,              -- false will disable the whole extension
        --disable = { "java" },
        },
    indent = {
        enable = true
        },
    incremental_selection = {
        enable = true,
        keymaps = {
            init_selection = "gnn",
            node_incremental = "grn",
            scope_incremental = "grc",
            node_decremental = "grm",
            },
        },
    additional_vim_regex_highlighting = false,
    }
require 'nvim-treesitter.install'.compilers = { "gcc" }
EOF
set foldmethod=expr
set foldexpr=nvim_treesitter#foldexpr()
