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
}
