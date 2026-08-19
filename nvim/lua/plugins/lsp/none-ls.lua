---- Only use this file for installing Linters and formatters ----
return {
	"nvimtools/none-ls.nvim",
	event = "VeryLazy",
	dependencies = {
		"williamboman/mason.nvim",
		"jay-babu/mason-null-ls.nvim",
	},
	config = function()
		require("mason-null-ls").setup({
			ensure_installed = {
				"stylua",
				"black",
				"isort",
				"clang-format",
				"ast-grep",
				"beautysh",
			},
			automatic_installation = true,
		})

		local null_ls = require("null-ls")

		null_ls.setup({
			sources = {
				null_ls.builtins.formatting.stylua,
				null_ls.builtins.formatting.black,
				null_ls.builtins.formatting.isort,
				null_ls.builtins.formatting.clang_format,
			},
		})

		vim.keymap.set("n", "<leader>gf", vim.lsp.buf.format, {})
	end,
}
