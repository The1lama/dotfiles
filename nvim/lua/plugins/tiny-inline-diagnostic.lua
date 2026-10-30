return {
	{
		"rachartier/tiny-inline-diagnostic.nvim",
		event = "VeryLazy",
		priority = 1000,
		opts = {},
		config = function()
			require("tiny-inline-diagnostic").setup({
				preset = "amongus",
				transparent_bg = false,
				transparent_cursorline = false,
				blend = {
					factor = 0.1,
				},
			})
		end,
	},
	{
		"neovim/nvim-lspconfig",
		opts = { diagnostics = { virtual_text = false } },
	},
}
