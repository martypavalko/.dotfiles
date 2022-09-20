local Remap = require("marty.keymaps")
local nnoremap = Remap.nnoremap
local vnoremap = Remap.vnoremap
local inoremap = Remap.inoremap
local xnoremap = Remap.xnoremap
local nmap = Remap.nmap

-- NERDTree
nnoremap("<leader>b", ":NERDTreeToggle<CR>")

-- Telescope
nnoremap("<leader>ff", ":Telescope find_files hidden=true<CR>")
nnoremap("<leader>fg", ":Telescope live_grep hidden=true<CR>")
nnoremap("<leader>fb", ":Telescope buffers<CR>")
nnoremap("<leader>fh", ":Telescope help_tags<CR>")
