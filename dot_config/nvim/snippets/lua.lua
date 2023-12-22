-- https://www.ejmastnak.com/tutorials/vim-latex/luasnip/
local ls = require("luasnip")
local s = ls.snippet
local t = ls.text_node
local i = ls.insert_node

return {
  -- A snippet that expands the trigger "hi" into the string "Hello, world!".
  ls.snippet({ trig = "hi" }, { t("Hello, world!") }),

  ls.snippet({ trig = "foo" }, { t("Another snippet.") }),
}
