return { 
  "brenoprata10/nvim-highlight-colors",
  config = function()
    require("nvim-highlight-colors").setup({
      render = "virtual",  -- "background" | "foreground" | "virtual"
      virtual_symbol = "▐",   -- need render to be "virtual"
      virtual_symbol_prefix = "",
      virtual_symbol_suffix = " ",
      virtual_symbol_position = "inline", -- "inline" | "eol" 'end of colum' | "eow" 'end of word'
      exclude_filetypes = {},
      exclude_buftypes = {}
    })
  end
}
