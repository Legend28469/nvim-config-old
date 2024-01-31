return {
	{
		"nvim-telescope/telescope.nvim",
		tag = "0.1.5",
		-- or                              , branch = '0.1.x',
		dependencies = { "nvim-lua/plenary.nvim" },
		config = function()
			local builtin = require("telescope.builtin")
			local wk = require("which-key")

			wk.register({
				f = {
					name = "telescope",
				},
			}, { prefix = "<leader>" })

			vim.keymap.set("n", "<leader>ff", builtin.find_files, { desc = "Telescope Find Files" })
			vim.keymap.set("n", "<leader>fg", builtin.live_grep, { desc = "Telescope Grep Files" })
		end,
	},
	{
		"nvim-telescope/telescope-ui-select.nvim",
		config = function()
			require("telescope").setup({
				defaults = {
					file_ignore_patterns = {
						"node_modules",
					},
				},
				extensions = {
					["ui-select"] = {
						require("telescope.themes").get_dropdown({}),
					},
				},
			})
			require("telescope").load_extension("ui-select")
		end,
	},
}
