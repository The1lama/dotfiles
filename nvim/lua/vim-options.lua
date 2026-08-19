vim.cmd("set expandtab")
vim.cmd("set tabstop=2")
vim.cmd("set softtabstop=2")
vim.cmd("set shiftwidth=2")
vim.cmd("set number")
vim.cmd("set scrolloff=999")

vim.opt.foldmethod = "expr"
vim.opt.foldexpr = "nvim_treesitter#foldexpr()"
vim.opt.foldlevel = 99
vim.opt.foldenable = true

vim.opt.fillchars = {
  fold = " ",
  foldopen = "▼",
  foldclose = "▶",
  eob = " ",
}
vim.opt.foldtext = "Folded lines -->"

-- set the yank, delete, paste worke with clipboard
vim.opt.clipboard = "unnamedplus"

-- reload vim config file
vim.keymap.set("n", "<leader>sv", ":source ~/.config/nvim/init.lua<CR>") -- toggle fold


vim.treesitter.language.register("bash", "conf")
vim.opt.guicursor = "n-v-c:block,i-ci-ve:ver25,r-cr:hor20,a:blinkwait700-blinkoff400-blinkon250-Cursor/lCursor"


-- Vim keymap cheat sheet --
-- to set a keybind you need to set in what enviroment the keybind should work in such as the examples below.
-- The syntax looks like this for setting a new keybind
--  vim.keymap.set(mode, keymap, event)
--
-- Mode:
-- nnoremap: Normal mode    : n
-- inoremap: Intert mode    : i
-- tnoremap: terminal mode  : t
-- vnoremap: Visual Select  : v
-- xnoremap: Visual         : x
-- snoremap: Select         : s
-- cnoremap: Command-line   : c
-- onoremap: OperatorPending: o : When using : / ?
-- rnoremap: Replace        : R

-- Lua sepcial keymap operators --
-- |------------------------------------------|
-- | Keymap  |   Code   |       Example       |
-- |---------|----------|---------------------|
-- | Control | <C-...>  | <C-a> (Ctrl + a)    |
-- |---------|----------|---------------------|
-- |   Alt   | <A-...>  | <A-j> (Alt + j)     |
-- |---------|----------|---------------------|
-- |  Shift  | <S-...>  | <S-Tab (Shift + Tab |
-- |---------|----------|---------------------|
-- | Super   | <D-...>  | <D-s> (Super + s)   |
-- |------------------------------------------|
-- You can also combine mod keys with each other
-- | <C-S-f> (Control + Shift + f)

-- open and close code folds ---
vim.keymap.set("n", "<leader>z", "za")  -- toggle fold
vim.keymap.set("n", "<leader>zc", "zc") -- close fold
vim.keymap.set("n", "<leader>zo", "zo") -- open fold
vim.keymap.set("n", "<leader>zR", "zR") -- open all
vim.keymap.set("n", "<leader>zM", "zM") -- close all
-- open and close code folds ---

-- navigate all between the windows in every mode --
-- terminal mode
vim.keymap.set("t", "<A-h>", "<C-\\><C-n><C-w>h")
vim.keymap.set("t", "<A-j>", "<C-\\><C-n><C-w>j")
vim.keymap.set("t", "<A-k>", "<C-\\><C-n><C-w>k")
vim.keymap.set("t", "<A-l>", "<C-\\><C-n><C-w>l")
-- insert mode
vim.keymap.set("i", "<A-h>", "<C-\\><C-n><C-w>h")
vim.keymap.set("i", "<A-j>", "<C-\\><C-n><C-w>j")
vim.keymap.set("i", "<A-k>", "<C-\\><C-n><C-w>k")
vim.keymap.set("i", "<A-l>", "<C-\\><C-n><C-w>l")
-- normal mode
vim.keymap.set("n", "<A-h>", "<C-w>h")
vim.keymap.set("n", "<A-j>", "<C-w>j")
vim.keymap.set("n", "<A-k>", "<C-w>k")
vim.keymap.set("n", "<A-l>", "<C-w>l")

-- commands and keyboard shortcuts for opening terminal in vim --
-- Set things when opening terminal
vim.api.nvim_create_autocmd("TermOpen", {
  group = vim.api.nvim_create_augroup("custom-term-open", { clear = true }),
  callback = function()
    vim.opt.number = false
    vim.opt.relativenumber = false
  end,
})

-- horizontal terminal
vim.keymap.set("n", "<leader>ht", function()
  vim.cmd("botright 10split | terminal")

  local job_id = vim.b.terminal_job_id
  if job_id then
    vim.api.nvim_chan_send(job_id, "clear\n")
  end
  vim.cmd("startinsert")
end)

-- vertical terminal
vim.keymap.set("n", "<leader>vt", function()
  vim.cmd("botright 50vsplit | terminal")

  local job_id = vim.b.terminal_job_id
  if job_id then
    vim.api.nvim_chan_send(job_id, "clear\n")
  end
  vim.cmd("startinsert")
end)
-- commands and keyboard shortcuts for opening terminal in vim --
