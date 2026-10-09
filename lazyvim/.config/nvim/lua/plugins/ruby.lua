return {
  {
    "neovim/nvim-lspconfig",
    opts = {
      servers = {
        rubocop = {
          mason = false,
          cmd = { vim.fn.exepath("rubocop --lsp") },
        },
        ruby_lsp = {
          mason = false,
          cmd = { vim.fn.exepath("ruby-lsp") },
        },
      },
    },
  },
}
