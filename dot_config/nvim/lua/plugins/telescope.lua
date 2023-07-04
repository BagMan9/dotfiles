return {
  {
    "telescope.nvim",
    dependencies = {
      "nvim-telescope/telescope-fzf-native.nvim",
      "desdic/telescope-rooter.nvim",
      build = "make",
      config = function()
        require("telescope").load_extension("fzf")
        require("telescope").load_extension("rooter")
      end,
    },
  },
}
