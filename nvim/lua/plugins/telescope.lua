return {
	{
		"nvim-telescope/telescope.nvim",
		tag = "0.1.6",
		-- Load when running the :Telescope command or pressing keymaps
		cmd = "Telescope",
		keys = {
			{
				"<leader>ff",
				function()
					require("telescope.builtin").find_files()
				end,
				desc = "Telescope Find Files",
			},
			{
				"<leader>fg",
				function()
					require("telescope.builtin").live_grep()
				end,
				desc = "Telescope Live Grep",
			},
		},
		dependencies = {
			"nvim-lua/plenary.nvim",
			{
				"nvim-telescope/telescope-ui-select.nvim",
				-- Ensures ui-select is ready for Neovim UI overrides without blocking startup
				event = "VeryLazy",
			},
		},
		config = function()
			-- Set up telescope options and extensions
			local telescope = require("telescope")

			telescope.setup({
				extensions = {
					["ui-select"] = {
						require("telescope.themes").get_dropdown({}),
					},
				},
			})

			-- Load the extension safely inside the main config block
			telescope.load_extension("ui-select")
		end,
	},
}
