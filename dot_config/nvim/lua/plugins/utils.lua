return {
  {
    "tpope/vim-fugitive",
  },
  {
    "aserowy/tmux.nvim",
    config = function()
      require("tmux").setup()
    end,
  },
  {
    "pwntester/octo.nvim",
    dependencies = {
      'nvim-lua/plenary.nvim',
      'nvim-telescope/telescope.nvim',
    },
    config = function()
      require("octo").setup()
    end,
  },
  {
    "ARM9/arm-syntax-vim",
  },
}
