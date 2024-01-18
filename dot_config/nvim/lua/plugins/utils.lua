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
    "chipsenkbeil/distant.nvim",
    config = function()
      require("distant"):setup()
    end,
  },
}
