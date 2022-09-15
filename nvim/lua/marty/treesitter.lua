require('nvim-treesitter.configs').setup({                                               
    --Suctant language
    ensure_installed = {"html", "css", "vim", "lua", "javascript", "typescript", "c", "cpp", "python", "go", "java"},
         --This code highlights
    highlight = {
        enable = true,
        additional_vim_regex_highlighting = false
    },
         --Base incremental selection
    incremental_selection = {
        enable = true,
        keymaps = {
            init_selection = '<CR>',
            node_incremental = '<CR>',
            node_decremental = '<BS>',
            scope_incremental = '<TAB>'
        }
    },
         --Apick the code based on Treesitter (=)
    indent = {
        enable = true
    },
})
 -- Open the code folding
vim.wo.foldmethod = 'expr'
vim.wo.foldexpr = 'nvim_treesitter#foldexpr()'
 --Drived without folding
vim.wo.foldlevel = 99
