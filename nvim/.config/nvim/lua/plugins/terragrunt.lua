return {
  {
    "neovim/nvim-lspconfig",
    opts = {
      servers = {
        terragrunt_ls = {},
      },
    },
  },
  {
    "stevearc/conform.nvim",
    optional = true,
    opts = function(_, opts)
      opts.formatters_by_ft = opts.formatters_by_ft or {}
      opts.formatters_by_ft.hcl = { "terragrunt_hclfmt" }

      opts.formatters = opts.formatters or {}
      opts.formatters.terragrunt_hclfmt = {
        command = "terragrunt",
        args = { "hcl", "fmt", "--stdin" },
        stdin = true,
        inherit = false,
      }
    end,
  },
}
