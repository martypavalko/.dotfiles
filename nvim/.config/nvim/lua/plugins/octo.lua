return {
  {
    "pwntester/octo.nvim",
    config = function(_, opts)
      require("octo").setup(opts)

      local navigation = require("octo.navigation")
      local open_in_browser = navigation.open_in_browser
      navigation.open_in_browser = function(kind, repo, number)
        if not kind and not repo then
          local buffer = require("octo.utils").get_current_buffer()
          if buffer and buffer:isPullRequest() then
            vim.ui.open(buffer:pullRequest().url)
            return
          end
        end

        return open_in_browser(kind, repo, number)
      end
    end,
  },
}
