vim.api.nvim_create_autocmd("SwapExists", {
  callback = function()
    vim.v.swapchoice = "d" -- d = delete old swap file
  end,
})
