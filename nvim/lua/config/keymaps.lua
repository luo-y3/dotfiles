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
keymap.set("n", "<Tab>", function()
  require("snacks").explorer()
end, opts)

-- Coppy to Clipboard
vim.opt.clipboard = "unnamedplus"

-- Fast Comment
keymap.set("n", "<A-/>", function()
  require("Comment.api").toggle.linewise.current()
end, opts)

keymap.set("v", "<A-/>", function()
  local esc = vim.api.nvim_replace_termcodes("<ESC>", true, false, true)
  vim.api.nvim_feedkeys(esc, "nx", false)
  require("Comment.api").toggle.linewise.current()
end, opts)
