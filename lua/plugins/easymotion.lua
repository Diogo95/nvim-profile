return {
  "easymotion/vim-easymotion",
  keys = {
    { "<leader>j", "<Plug>(easymotion-s)" },
  },
  config = function()
    -- Optional: set easy-motion options here
    vim.g.EasyMotion_do_mapping = 0 -- prevent default mappings
    vim.g.EasyMotion_smartcase = 1
  end,
}

