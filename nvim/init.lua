-- bootstrap lazy.nvim, LazyVim and your plugins
require("config.lazy")

vim.opt.termguicolors = true

local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not (vim.uv or vim.loop).fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable", -- latest stable release
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)

-- 3. รวมตารางปลั๊กอินจากไฟล์ต่าง ๆ
local plugins = {}
vim.list_extend(plugins, require("plugins.colorscheme")) -- โหลดปลั๊กอินจากไฟล์ colorscheme.lua
-- vim.list_extend(plugins, require("plugins.lsp"))      -- ตัวอย่างการโหลดไฟล์อื่น
-- vim.list_extend(plugins, require("plugins.treesitter"))

-- 4. เรียกใช้ lazy.nvim
require("lazy").setup(plugins, {})
