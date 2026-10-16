local function clock_component()
  return {
    function()
      return os.date("%H:%M")
    end,
    cond = function()
      return vim.env.TMUX == nil or vim.env.TMUX == ""
    end,
  }
end

local function diagnostics_component()
  local icons = LazyVim.config.icons
  return {
    "diagnostics",
    symbols = {
      error = icons.diagnostics.Error,
      warn = icons.diagnostics.Warn,
      info = icons.diagnostics.Info,
      hint = icons.diagnostics.Hint,
    },
  }
end

local function diff_component()
  local icons = LazyVim.config.icons
  return {
    "diff",
    symbols = {
      added = icons.git.added,
      modified = icons.git.modified,
      removed = icons.git.removed,
    },
    source = function()
      local gitsigns = vim.b.gitsigns_status_dict
      if gitsigns then
        return {
          added = gitsigns.added,
          modified = gitsigns.changed,
          removed = gitsigns.removed,
        }
      end
    end,
  }
end

local function minimal_sections()
  return {
    lualine_a = {
      {
        "mode",
        fmt = function(mode)
          if mode ~= "V-BLOCK" then
            return mode:sub(1, 1):lower()
          else
            return mode:sub(1, 3):lower()
          end
        end,
      },
    },
    lualine_b = { "branch" },
    lualine_c = {
      {
        "filename",
        path = 1,
        symbols = {
          modified = "[+]",
          readonly = "[-]",
          unnamed = "[No Name]",
          newfile = "[New]",
        },
      },
      diagnostics_component(),
    },
    lualine_x = { diff_component() },
    lualine_y = {},
    lualine_z = { clock_component() },
  }
end

return {
  {
    "nvim-lualine/lualine.nvim",
    opts = function(_, opts)
      opts.sections = minimal_sections()
      opts.inactive_sections = minimal_sections()
      opts.extensions = {}
      opts.options.section_separators = { left = "", right = "" }

      return opts
    end,
  },
}
