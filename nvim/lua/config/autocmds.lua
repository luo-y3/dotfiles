vim.api.nvim_create_autocmd("SwapExists", {
  callback = function()
    vim.cmd("silent! delete " .. vim.fn.expand("<afile>"))
  end,
})
