return {
  "stevearc/conform.nvim",
  event = { "BufWritePre" },  -- Triggers right before saving file
  opts = {
    formatters_by_ft = {
      c = { "clang_format" },
      cpp = { "clang_format" },
    },
    -- Enables autoformat every time when saving Cpp file
    format_on_save = {
      timeout_ms = 500,
      lsp_fallback = true,
    },
  },
}

