lua <<EOF
vim.opt.rtp:append(vim.fn.stdpath "data" .. "/site")
require("tree-sitter-manager").setup({
-- Directory to install parsers and queries to (prepended to `runtimepath` to have priority)
install_dir = vim.fn.stdpath('data') .. '/site',
ensure_installed = { "lua", "vim" }, -- one of "all", "maintained" (parsers with maintainers), or a list of languages
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
})
EOF
set foldmethod=expr
