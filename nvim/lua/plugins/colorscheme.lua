return {
  {
    "Shatur/neovim-ayu",
    lazy = false, -- ให้โหลดทันที
    priority = 1000, -- ให้โหลดก่อนปลั๊กอินอื่น
    config = function()
      -- (ตัวเลือก) ตั้งค่าเพิ่มเติมให้กับ Ayu
      require("ayu").setup({
        mirage = false,
        terminal = true,
      })

      -- เรียกใช้ colorscheme
      vim.cmd.colorscheme("ayu")
    end,
  },
}
