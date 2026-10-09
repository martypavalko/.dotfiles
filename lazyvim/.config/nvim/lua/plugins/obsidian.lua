return {
  {
    "obsidian-nvim/obsidian.nvim",
    version = "*", -- use latest release, remove to use latest commit
    ft = "markdown",
    ---@module 'obsidian'
    config = function(_, opts)
      local obsidian = require "obsidian"
      obsidian.setup(opts)

      obsidian.register_command("backlinks", {
        nargs = 0,
        note_action = true,
        func = function()
          require("obsidian.lsp.handlers._references")(nil, { tag = false }, function(_, locations)
            local items = vim.lsp.util.locations_to_items(locations, "utf-8")
            local seen = {}
            items = vim.tbl_filter(function(item)
              local filename = item.filename
              if not filename then
                return true
              end
              if seen[filename] then
                return false
              end
              seen[filename] = true
              return true
            end, items)

            local api = require "obsidian.api"
            local picker = require "obsidian.picker"
            if #items == 1 then
              api.open_note(items[1])
            else
              picker.select(items, {
                prompt = "Backlinks",
                format_item = function(entry)
                  return vim.fn.fnamemodify(entry.filename, ":t:r")
                end,
                preview_item = function(entry)
                  local preview = picker.preview_path(entry.filename)
                  preview.pos = { entry.lnum or 1, entry.col and math.max(entry.col - 1, 0) or 0 }
                  return preview
                end,
              }, function(choices)
                local entry = choices and choices[1]
                if entry then
                  api.open_note(entry)
                end
              end)
            end
          end)
        end,
      })

      local function path_is_in_workspace(path, workspace_path)
        if path == "" or not workspace_path then
          return false
        end

        local function normalize(path)
          path = vim.fn.expand(path)
          path = vim.uv.fs_realpath(path) or vim.fn.fnamemodify(path, ":p")
          return vim.fs.normalize(path)
        end

        local relative = vim.fs.relpath(normalize(workspace_path), normalize(path))
        return relative ~= nil
          and relative ~= ".."
          and not relative:match("^%.%.[/\\]")
      end

      local keymap_group = vim.api.nvim_create_augroup("ObsidianKeymaps", { clear = true })
      vim.api.nvim_create_autocmd({ "BufEnter", "FileType" }, {
        group = keymap_group,
        callback = function(event)
          local path = vim.api.nvim_buf_get_name(event.buf)
          local in_vault = vim.bo[event.buf].filetype == "markdown"

          if in_vault then
            in_vault = false
            for _, workspace in ipairs(opts.workspaces or {}) do
              if path_is_in_workspace(path, workspace.path) then
                in_vault = true
                break
              end
            end
          end

          if in_vault then
            vim.keymap.set("n", "<leader>ob", "<cmd>Obsidian backlinks<CR>", {
              buffer = event.buf,
              desc = "Display backlinks (Obsidian)",
            })
          else
            pcall(vim.keymap.del, "n", "<leader>ob", { buffer = event.buf })
          end
        end,
      })
    end,
    opts = {
      -- Use the title as-is for the filename (no auto-generated ID)
      note_id_func = function(title)
        return title
      end,
      frontmatter = {
        enabled = false,
      },
      templates = {
        folder = "Extras/Templates",
        date_format = "%Y-%m-%d",
        time_format = "%H:%M",
      },
      legacy_commands = false,
      workspaces = {
        {
          name = "PKM",
          path = "~/Documents/PKM/",
        },
      },
    },
  },
}
