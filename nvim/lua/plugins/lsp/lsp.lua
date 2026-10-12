return {
	"neovim/nvim-lspconfig",
	dependencies = { "williamboman/mason.nvim" },
	config = function()
		vim.api.nvim_create_autocmd("LspAttach", {
			callback = function(args)
				local opts = { buffer = args.buf }

				-- Universial LSP Keybinds
				opts.desc = "LSP Show Line Grammar/Error Diagnosics"
				vim.keymap.set("n", "<leader>w", vim.diagnostic.open_float, opts)

				opts.desc = "LSP Code Action (Fix Typoes / Suggestions)"
				vim.keymap.set("n", "<leader>.", vim.lsp.buf.code_action, opts)

				opts.desc = "LSP Hover Documentation / Info"
				vim.keymap.set("n", "K", vim.lsp.buf.hover, opts)

				-- Clangd specific shotcuts
				local client = vim.lsp.get_client_by_id(args.data.client_id)
				if client and client.name == "clangd" then
					vim.keymap.set("n", "<C-o>", "<cmd>LspClangdSwitchSourceHeader<CR>", {
						buffer = args.buf,
						desc = "LSP Switch Source/Header",
					})
				end
			end,
		})
		vim.lsp.enable("clangd")
	end,
}
