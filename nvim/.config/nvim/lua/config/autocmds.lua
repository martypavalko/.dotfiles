-- Autocmds are automatically loaded on the VeryLazy event
-- Default autocmds that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/autocmds.lua
--
-- Add any additional autocmds here
-- with `vim.api.nvim_create_autocmd`
--
-- Or remove existing autocmds by their group name (which is prefixed with `lazyvim_` for the defaults)
-- e.g. vim.api.nvim_del_augroup_by_name("lazyvim_wrap_spell")

vim.api.nvim_create_autocmd("BufWritePre", {
  pattern = "*",
  callback = function(args)
    require("conform").format({ bufnr = args.buf })
  end,
})

local function disable_markdown_diagnostics(bufnr)
  if vim.bo[bufnr].filetype == "markdown" then
    vim.diagnostic.enable(false, { bufnr = bufnr })
  end
end

vim.api.nvim_create_autocmd("FileType", {
  pattern = { "markdown" },
  callback = function(args)
    disable_markdown_diagnostics(args.buf)

    -- Set your preferred line length (80 characters is standard for Markdown)
    vim.opt_local.textwidth = 80

    -- Re-enable text and comment auto-formatting for this file type
    vim.opt_local.formatoptions:append({ "t", "c" })
  end,
})

vim.api.nvim_create_autocmd("LspAttach", {
  callback = function(args)
    disable_markdown_diagnostics(args.buf)
  end,
})

for _, bufnr in ipairs(vim.api.nvim_list_bufs()) do
  disable_markdown_diagnostics(bufnr)
end
