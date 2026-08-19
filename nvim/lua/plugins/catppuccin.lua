return { -- catppuccin colorscheme for nvim
  "catppuccin/nvim",
  name = "catppuccin",
  priority = 1000,
  config = function ()
    require("catppuccin").setup({
      flavour = "latte",
      transparent_background = true,
      styles = {
        comments = { "italic" },
        functions = { "bold" },
        loops = { "bold" },
      }
    })
    vim.cmd.colorscheme "catppuccin"
  end
}
