return {
  {
    "eldritch-theme/eldritch.nvim",
    name = "eldritch",
    lazy = false,
    priority = 1000,
    opts = {},
  },

  {
    "LazyVim/LazyVim",
    opts = {
      colorscheme = "eldritch",
    },
  },
}
