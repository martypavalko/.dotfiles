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

-- Reconfigure buffer picker
vim.keymap.set("n", "<leader>fb", function()
  local previous_buf = vim.fn.bufnr("#")

  Snacks.picker.buffers({
    focus = "list",
    on_show = function(picker)
      vim.schedule(function()
        for index = 1, picker.list:count() do
          local item = picker.list:get(index)
          if item.buf == previous_buf then
            picker.list:view(index, nil, true)
            break
          end
        end
      end)
    end,
    win = {
      input = {
        keys = {
          ["d"] = { "bufdelete", mode = { "n" } },
        },
      },
      list = {
        keys = {
          ["d"] = { "bufdelete", mode = { "n" } },
        },
      },
    },
  })
end, { desc = "Buffers" })

-- Search files in the Obsidian vault
vim.keymap.set("n", "<leader>fo", function()
  Snacks.picker.files({ cwd = vim.fn.expand("~/Documents/PKM/"), hidden = false })
end, { desc = "Find vault files" })

-- Remove lazy buffer swap
-- vim.keymap.del("n", "H")
-- vim.keymap.del("n", "L")

-- Remap 'exit terminal-mode'
vim.keymap.set("t", "<Esc>", "<C-\\><C-n>", { desc = "Exit terminal mode" })

-- Octo.nvim custom keymaps
keymap.set("n", "<leader>gn", "<cmd>Octo notification list<CR>", { desc = "GitHub notifications (Octo)" })
