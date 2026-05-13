local keymap = vim.keymap
local opts = { noremap = true, silent = true }

-- Split window
keymap.set("n", "ss", ":split<Return>", opts)
keymap.set("n", "sv", ":vsplit<Return>", opts)

-- Move window
keymap.set("n", "sh", "<C-w>h")
keymap.set("n", "sk", "<C-w>k")
keymap.set("n", "sj", "<C-w>j")
keymap.set("n", "sl", "<C-w>l")

-- Select all
keymap.set("n", "<C-a>", "gg<S-v>G")

-- Toggle Snacks Explorer
-- keymap.set("n", "<Tab>", function()
--   require("snacks").explorer()
-- end, opts)

-- Coppy to Clipboard
vim.opt.clipboard = "unnamedplus"

-- Fast Comment
local api = require("Comment.api")

-- Normal mode: Alt + / → toggle comment
vim.keymap.set("n", "<A-/>", function()
  api.toggle.linewise.current()
end, { noremap = true, silent = true })

-- Insert mode: Alt + / → comment line without leaving insert mode
vim.keymap.set("i", "<A-/>", function()
  vim.api.nvim_feedkeys(vim.api.nvim_replace_termcodes("<Esc>", true, false, true), "nx", false)
  api.toggle.linewise.current()
  vim.api.nvim_feedkeys(vim.api.nvim_replace_termcodes("A", true, false, true), "nx", false)
end, { noremap = true, silent = true })

-- Visual mode: Alt + / → comment selected lines
vim.keymap.set("v", "<A-/>", function()
  api.toggle.linewise(vim.fn.visualmode())
end, { noremap = true, silent = true })
