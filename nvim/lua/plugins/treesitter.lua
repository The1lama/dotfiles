return {
  {
    "nvim-treesitter/nvim-treesitter", 
    build = ":TSUpdate",
  --  config = function()
    --  local config = require("nvim-treesitter.configs")
      --config.setup({
     --   auto_install = true,
      --  sync_install = true,
     --   highlight = { 
      --    enable = true,  -- false will disable the whole extention
       --   disable = {""}, -- list of language that will be disabled
       --   additional_vim_regex_highlighting = true,
      --  },
      --  indent = { 
       --   enable = true,
      --    disable = { "yaml" }
       -- },
     -- })
   -- end
  },
}
