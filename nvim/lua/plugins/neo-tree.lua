return {
  "nvim-neo-tree/neo-tree.nvim",
  branch = "v3.x",
  dependencies = {
    "nvim-lua/plenary.nvim",
    "nvim-tree/nvim-web-devicons", -- not strictly required, but recommended
    "MunifTanjim/nui.nvim",
  },
  config = function()  
    vim.keymap.set('n', '<leader>e', ':Neotree filesystem reveal right<CR>', {})
    require("neo-tree").setup({
      event_handlers = {
        {
          event = "neo_tree_buffer_enter",
          handler = function()
            vim.cmd("highlight! Cursor blend=100")
          end,
        },
        {
          event = "neo_tree_buffer_leave",
          handler = function()
            vim.cmd("highlight! Cursor guibg=#5f87af blend=0")
          end,
        },
        {
          event = "after_render",
          handler = function(state)
            if not require("neo-tree.sources.common.preview").is_active() then
              state.config = { use_float = true}
              state.commands.toggle_preview(state)
            end
          end
        },
        {
          event = "file_opened",
          handler = function()
            require("neo-tree.command").execute({ action = "close" })
          end
        },
      },
    })
  end
}
