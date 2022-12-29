-- [[ Setting options ]]
-- See `:help vim.o`
-- Set highlight on search
vim.o.hlsearch = false
-- Make line numbers default
vim.wo.number = true
-- Enable mouse mode
vim.o.mouse = 'a'
-- Enable break indent
vim.o.breakindent = true
-- Save undo history
vim.o.undofile = true
vim.opt.undodir = os.getenv("HOME") .. "/.vim/undodir"
-- Case insensitive searching UNLESS /C or capital in search
vim.o.ignorecase = true
vim.o.smartcase = true
-- Decrease update time
vim.o.updatetime = 50
vim.wo.signcolumn = 'yes'
-- Set colorscheme
vim.o.termguicolors = true
-- vim.cmd [[colorscheme onedark]]
-- require('onedark').setup {
--   style = 'deep'
-- }
-- require('onedark').load()
-- Set completeopt to have a better completion experience
vim.o.completeopt = 'menuone,noselect'
vim.opt.guicursor = ""
vim.opt.nu = true
vim.opt.relativenumber = true
vim.opt.tabstop = 4
vim.opt.softtabstop = 4
vim.opt.shiftwidth = 4
vim.opt.expandtab = true
vim.opt.smartindent = true
vim.opt.wrap = false
vim.opt.swapfile = false
vim.opt.backup = false
vim.opt.incsearch = true
vim.opt.scrolloff = 8
vim.opt.isfname:append("@-@")
