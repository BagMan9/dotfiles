return {
  {
    -- Git Wrapper [":G add "]
    "tpope/vim-fugitive",
  },
  {
    "aserowy/tmux.nvim",
    config = function()
      require("tmux").setup()
    end,
  },
  {
    -- Github Issues
    "pwntester/octo.nvim",
    dependencies = {
      "nvim-lua/plenary.nvim",
      "nvim-telescope/telescope.nvim",
    },
    config = function()
      require("octo").setup()
    end,
  },
}
