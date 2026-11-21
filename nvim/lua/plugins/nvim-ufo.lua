return {
 'kevinhwang91/nvim-ufo',
  dependencies = {
    "kevinhwang91/promise-async",
  },
  event = "VeryLazy",

  config = function()
    require("ufo").setup({
      provider_selector = function (bufnr, filetype, buftype)
        return { 'lsp', 'indent' }
      end
      })
    end,

  keys = {
    {
      "zR",
      function()
        require("ufo").openAllFolds()
      end,
      desc = "(ufo) Open all folds",
    },
    {
      "zM",
      function()
        require("ufo").closeAllFolds()
      end,
      desc = "(ufo) Close all folds",
    },
    {
      "zK",
      function()
        local winid = require("ufo").peekFoldedLinesUnderCursor()
        if not winid then
          vim.lsp.buf.hover()
        end
      end,
      desc = "(ufo) Peek Fold",
    },
  },
}
