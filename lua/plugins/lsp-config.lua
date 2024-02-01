return {
	{
		"williamboman/mason.nvim",
		lazy = false,
		config = true,
	},
	{
		"williamboman/mason-lspconfig.nvim",
		lazy = false,
		config = true,
		opts = {
			ensure_installed = { "lua_ls", "tsserver", "biome" },
		},
	},
	{
		"neovim/nvim-lspconfig",
		lazy = false,
		config = function()
			local capabilities = require("cmp_nvim_lsp").default_capabilities()

			local lspconfig = require("lspconfig")
			lspconfig.lua_ls.setup({
				capabilities = capabilities,
			})
			lspconfig.tsserver.setup({
				capabilities = capabilities,
				on_attach = function(client)
					-- this is important, otherwise tsserver will format ts/js
					-- files which we *really* don't want.
					client.server_capabilities.documentFormattingProvider = false
				end,
			})
			lspconfig.biome.setup({
				capabilities = capabilities,
			})

			vim.keymap.set("n", "K", vim.lsp.buf.hover, { desc = "Reveal Definition (Hover)" })
			vim.keymap.set("n", "gd", vim.lsp.buf.definition, { desc = "Goto Definition" })
			vim.keymap.set("n", "<leader>ca", vim.lsp.buf.code_action, { desc = "Code Action" })
			vim.keymap.set(
				"n",
				"<leader>e",
				":lua vim.diagnostic.open_float(0, {scope='line'})<CR>",
				{ desc = "Expand LSP Message(s)" }
			)
		end,
	},
}
