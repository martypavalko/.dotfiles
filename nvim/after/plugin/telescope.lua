-- telescope
lopcal builtin = require('telescope.builtin')
vim.keymap.set('n', '<leader>ff', builtin.find_files, { desc = "Search [F]iles" })
vim.keymap.set('n', '<leader>fg', builtin.live_grep, { desc = "Search by [G]rep" })
vim.keymap.set('n', '<leader>fb', builtin.buffers, { desc = "Search [B]uffers" })
vim.keymap.set('n', '<leader>fh', builtin.help_tags, { desc = "Search [H]elp" })
vim.keymap.set('n', '<leader>fr', '<cmd>lua require("telescope.builtin").find_files({ no_ignore = false, hidden = true })<CR>', { desc = 'Search Hidden Files' })
