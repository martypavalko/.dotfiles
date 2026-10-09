return {
  {
    "folke/sidekick.nvim",
    opts = {
      cli = {
        tools = {
          codex = {
            cmd = { "codex", "--no-daemon" },
          },
        },
      },
      copilot = {
        status = {
          level = vim.log.levels.OFF,
        },
      },
    },
  },
}
