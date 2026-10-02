return {
  {
    "pwntester/octo.nvim",
    config = function(_, opts)
      opts = vim.tbl_deep_extend("force", opts or {}, {
        mappings = {
          issue = {
            open_in_browser = { lhs = "<C-x>" },
          },
          pull_request = {
            open_in_browser = { lhs = "<C-x>" },
          },
        },
      })

      require("octo").setup(opts)

      local navigation = require("octo.navigation")
      local open_in_browser = navigation.open_in_browser
      navigation.open_in_browser = function(kind, repo, number)
        if not kind and not repo then
          local buffer = require("octo.utils").get_current_buffer()
          if buffer and buffer:isPullRequest() then
            vim.ui.open(buffer:pullRequest().url)
            return
          elseif buffer and buffer:isIssue() then
            vim.ui.open(buffer:issue().url)
          end
        end

        return open_in_browser(kind, repo, number)
      end
    end,
  },
}
