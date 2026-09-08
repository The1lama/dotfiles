return {
	"neovim/nvim-lspconfig",
	dependencies = { "williamboman/mason.nvim" },
	config = function()
		vim.api.nvim_create_autocmd("LspAttach", {
			callback = function(args)
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
