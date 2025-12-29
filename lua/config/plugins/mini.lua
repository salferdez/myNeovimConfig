return {
  {
    "echasnovski/mini.icons",
    config = function()
      require("mini.icons").setup()
    end,
  },
  {
    "echasnovski/mini.nvim",
    config = function()
      local statusline = require 'mini.statusline'
      statusline.setup { use_icons = true }
    end,
    dependencies = { "echasnovski/mini.icons" },
  },
}
