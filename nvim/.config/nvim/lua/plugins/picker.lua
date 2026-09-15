return {
  "folke/snacks.nvim",
  opts = {
    picker = {
      sources = {
        explorer = {
          hidden = true, -- Always show hidden files in the explorer
        },
        files = {
          hidden = true, -- Always show hidden files when searching for files
        },
        grep = {
          hidden = true, -- Always search inside hidden files
        },
        smart = {
          hidden = true, -- Always show hidden files in smart pickers
        },
      },
      win = {
        input = {
          keys = {
            ["H"] = false,
            ["<C-h>"] = { "toggle_hidden", mode = { "i", "n" } },
          },
        },
      },
    },
  },
}
