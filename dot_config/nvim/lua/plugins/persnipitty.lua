return {
  {
    "l3mon4d3/luasnip",
    config = function()
      require("luasnip.loaders.from_lua").load({ paths = "~/.config/nvim/snippets" })
    end,
  },
}
