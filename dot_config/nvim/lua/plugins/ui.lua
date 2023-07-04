return {
  {
    -- Screensaver
    "folke/drop.nvim",
    config = function()
      require("drop").setup()
    end,
    opts = {
      {
        theme = "snow"
      },
    }
  },
  {
    "petertriho/nvim-scrollbar",
    dependencies = {
      "kevinhwang91/nvim-hlslens",
      config = function()
        require("hlslens").setup()
      end,
    },
    config = function()
      require("scrollbar").setup()
    end,
  },
  {
    "brenoprata10/nvim-highlight-colors",
  },
  {
    "nvim-neo-tree/neo-tree.nvim",
    opts = {
      filesystem = {
        filtered_items = {
          hide_by_name = {
            "Pipfile",
            "pyproject.toml",
          },
          hide_by_pattern = {
            "*.lock",
          },
        },
      },
      default_component_configs = {
        icon = {
          folder_empty = "󰜌",
          folder_empty_open = "󰜌",
        },
        git_status = {
          symbols = {
            renamed  = "󰁕",
            unstaged = "󰄱",
          },
        },
      },
      document_symbols = {
        kinds = {
          File = { icon = "󰈙", hl = "Tag" },
          Namespace = { icon = "󰌗", hl = "Include" },
          Package = { icon = "󰏖", hl = "Label" },
          Class = { icon = "󰌗", hl = "Include" },
          Property = { icon = "󰆧", hl = "@property" },
          Enum = { icon = "󰒻", hl = "@number" },
          Function = { icon = "󰊕", hl = "Function" },
          String = { icon = "󰀬", hl = "String" },
          Number = { icon = "󰎠", hl = "Number" },
          Array = { icon = "󰅪", hl = "Type" },
          Object = { icon = "󰅩", hl = "Type" },
          Key = { icon = "󰌋", hl = "" },
          Struct = { icon = "󰌗", hl = "Type" },
          Operator = { icon = "󰆕", hl = "Operator" },
          TypeParameter = { icon = "󰊄", hl = "Type" },
          StaticMethod = { icon = '󰠄 ', hl = 'Function' },
        }
      },
    },
  },
}
