return {
  "folke/snacks.nvim",
  opts = {
    dashboard = {
      -- width = 18,
      preset = {
        -- keys = {
        --   { icon = "", key = "f", desc = "[f]ind file", action = ":lua Snacks.dashboard.pick('files')" },
        --   { icon = "", key = "n", desc = "[n]ew file", action = ":ene | startinsert" },
        --   { icon = "", key = "g", desc = "[g]rep text", action = ":lua Snacks.dashboard.pick('live_grep')" },
        --   { icon = "", key = "r", desc = "[r]ecent file", action = ":lua Snacks.dashboard.pick('oldfiles')" },
        --   {
        --     icon = "",
        --     key = "c",
        --     desc = "[c]onfig",
        --     action = ":lua Snacks.dashboard.pick('files', {cwd = vim.fn.stdpath('config')})",
        --   },
        --   { icon = "", key = "s", desc = "[s]ession", section = "session" },
        --   { icon = "", key = "p", desc = "[p]rojects", section = "projects" },
        --   -- { icon = "", key = "L", desc = "[L]azy", action = ":Lazy", enabled = package.loaded.lazy ~= nil },
        --   { icon = "", key = "q", desc = "[q]uit", action = ":qa" },
        -- },
        header = [[
                                                                   
      ████ ██████           █████      ██                 btw
     ███████████             █████                            
     █████████ ███████████████████ ███   ███████████  
    █████████  ███    █████████████ █████ ██████████████  
   █████████ ██████████ █████████ █████ █████ ████ █████  
 ███████████ ███    ███ █████████ █████ █████ ████ █████ 
██████  █████████████████████ ████ █████ █████ ████ ██████
]],
      },
      -- formats = {
      --   key = { "" },
      -- },
      sections = {
        { section = "header" },
        { icon = " ", title = "Keymaps", section = "keys", indent = 2, padding = 1 },
        { icon = " ", title = "Recent Files", section = "recent_files", indent = 2, padding = 1 },
        { icon = " ", title = "Projects", section = "projects", indent = 2, padding = 1 },
        { section = "startup" },
      },
    },
    scroll = {
      enabled = false, -- Disable scrolling animations
    },
  },
}
