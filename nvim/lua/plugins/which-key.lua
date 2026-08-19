return  {
  "folke/which-key.nvim",
  event = "VeryLazy",
  opts = {
    tirgger = false,
  },
  keys = {
    {
      "<C-h>",
      function()
        require("which-key").show({ global = true })
      end,
     desc = "Buffer local keymaps (which-key)"
    },
  },
}

