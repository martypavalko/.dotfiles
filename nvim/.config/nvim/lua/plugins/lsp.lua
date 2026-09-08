return {
  {
    "neovim/nvim-lspconfig",
    opts = {
      servers = {
        ["*"] = {
          keys = {
            {
              "K",
              function()
                return vim.lsp.buf.hover({ max_width = 80, max_height = 20 })
              end,
              desc = "Hover",
            },
          },
        },
      },
    },
  },
}
