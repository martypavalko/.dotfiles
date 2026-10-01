vim.filetype.add({
  pattern = {
    [".+%.pkr%.hcl"] = "packer",
  },
})

return {
  {
    "nvim-treesitter/nvim-treesitter",
    opts = function(_, opts)
      opts.ensure_installed = opts.ensure_installed or {}
      vim.list_extend(opts.ensure_installed, { "hcl" })
      vim.treesitter.language.register("hcl", "packer")
    end,
  },
  {
    "mfussenegger/nvim-lint",
    optional = true,
    opts = function(_, opts)
      local lint = require("lint")

      lint.linters.packer_validate = {
        cmd = "packer",
        args = { "validate" },
        append_fname = true,
        stdin = false,
        stream = "both",
        ignore_exitcode = true,
        parser = function(output)
          local diagnostics = {}
          local message

          for line in output:gmatch("[^\r\n]+") do
            local error_message = line:match("^Error:%s*(.+)$")
            if error_message then
              message = error_message
            end

            local filename, line_number = line:match("^%s*on%s+(.+)%s+line%s+(%d+):")
            if filename and line_number then
              table.insert(diagnostics, {
                filename = filename,
                lnum = tonumber(line_number) - 1,
                col = 0,
                severity = vim.diagnostic.severity.ERROR,
                message = message or "Packer template validation failed",
                source = "packer validate",
              })
              message = nil
            end
          end

          if message then
            table.insert(diagnostics, {
              lnum = 0,
              col = 0,
              severity = vim.diagnostic.severity.ERROR,
              message = message,
              source = "packer validate",
            })
          end

          return diagnostics
        end,
      }

      opts.linters_by_ft = opts.linters_by_ft or {}
      opts.linters_by_ft.packer = { "packer_validate" }
    end,
  },
  {
    "stevearc/conform.nvim",
    optional = true,
    opts = function(_, opts)
      opts.formatters_by_ft = opts.formatters_by_ft or {}
      opts.formatters_by_ft.packer = { "packer_fmt" }
    end,
  },
}
