-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here

local keymap = vim.keymap

-- Move lines in visual mode
keymap.set("v", "J", ":m '>+1<CR>gv=gv", { desc = "Move line down" })
keymap.set("v", "K", ":m '<-2<CR>gv=gv", { desc = "Move line up" })

-- Keep visual selection when indenting
keymap.set("v", "<", "<gv", { desc = "Indent left" })
keymap.set("v", ">", ">gv", { desc = "Indent right" })

-- Better paste
keymap.set("v", "p", '"_dP', { desc = "Paste without yanking" })

-- System clipboard (use <leader>y to copy TO system, <leader>p to paste FROM system)
keymap.set({ "n", "v" }, "<leader>y", '"+y', { desc = "Yank to system clipboard" })
keymap.set({ "n", "v" }, "<leader>p", '"+p', { desc = "Paste from system clipboard" })
keymap.set({ "n", "v" }, "<leader>P", '"+P', { desc = "Paste from system clipboard (before)" })

-- Better navigation
keymap.set("n", "<C-d>", "<C-d>zz", { desc = "Scroll down and center" })
keymap.set("n", "<C-u>", "<C-u>zz", { desc = "Scroll up and center" })
keymap.set("n", "n", "nzzzv", { desc = "Next search result centered" })
keymap.set("n", "N", "Nzzzv", { desc = "Previous search result centered" })

-- Better integrated terminal-mode
keymap.set("n", "<leader>st", function()
  vim.cmd.vnew()
  vim.cmd.term()
  vim.cmd.wincmd("J")
  vim.api.nvim_win_set_height(0, 5)
end)

-- Remap 'exit terminal-mode'
vim.cmd("tnoremap <Esc><Esc> <C-\\><C-n>")
