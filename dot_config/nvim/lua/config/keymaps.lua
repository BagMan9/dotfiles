-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here

local function map(mode, lhs, rhs, opts)
  local keys = require("lazy.core.handler").handlers.keys
  ---@cast keys LazyKeysHandler
  -- do not create the keymap if a lazy keys handler exists
  if not keys.active[keys.parse({ lhs, mode = mode }).id] then
    opts = opts or {}
    opts.silent = opts.silent ~= false
    vim.keymap.set(mode, lhs, rhs, opts)
  end
end

map("n", "<C-n>", "<cmd>Neotree focus<cr>", { desc = "Toggle Neotree" })
map("n", "<leader>R", "<cmd>!chezmoi apply<cr>", { desc = "Apply Chezmoi Config" })
map(
  "n",
  "<leader>rd",
  "<cmd>!rsync -avh --delete ~/Dev/DataStructs/MeCode/ ~/Library/CloudStorage/Box-Box/Grannis_csc211<cr>",
  { desc = "Sync Struct Folder" }
)
map(
  "n",
  "<leader>rs",
  "<cmd>!rsync -az --delete ~/Dev/Operating\\ Systems/oslab/linux-0.11/ cscvm:/home/isaacgrannis/oslab/linux-0.11<cr>",
  { desc = "Sync Linux Kernel Folder" }
)
