-- needs to be called first for lazy to pick up leader key first
vim.g.mapleader = " "
vim.g.maplocalleader = " "

vim.o.timeoutlen = 500


-- installs lazy plugin manager for nvim if I do not have it
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not (vim.uv or vim.loop).fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable", -- latest stable release
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)

local opts = {}

-- loads lsp language server settings
require("lsp")


-- loads basic vim settings from file
require("vim-options")
-- Load up lazy vim to use and points to plugins folder for all the plugins I use
require("lazy").setup({
  spec = {
    { import = "plugins" },
    { import = "plugins.lsp" },
  }

})
