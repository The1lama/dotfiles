---- Only use this file for installing LSP (language servers) ----
return {
  "williamboman/mason-lspconfig.nvim",
  -- These dependencies load before the lspconfig loads
  -- to ensure that the auto install is going to work
  dependencies = {
    {
      "williamboman/mason.nvim",
      opts = {
        log_level = vim.log.levels.DEBUG,
      },
    },
    { "neovim/nvim-lspconfig" },
  },
  opts = {
    -- List of servers for mason to install automaticlly
    -- Does not need to do anything else
    -- Just add the server name to the ensure_installed List
    -- https://github.com/neovim/nvim-lspconfig/blob/master/doc/configs.md
    ensure_installed = {
      "lua_ls",
      "html",
      "cssls",
      "grammarly",
      "jsonls",
      "clangd",
      --"clang-format",
      --"codellbdb",
    },
  },
}
