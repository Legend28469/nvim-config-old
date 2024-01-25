return {
	"ThePrimeagen/harpoon",
	config = function()
		require("harpoon").setup({
			vim.keymap.set("n", "<leader>hx", require("harpoon.mark").add_file, { desc = "Harpoon Add file" }),
			vim.keymap.set("n", "<leader>hn", require("harpoon.ui").nav_next, { desc = "Harpoon Next file" }),
			vim.keymap.set("n", "<leader>hp", require("harpoon.ui").nav_prev, { desc = "Harpoon Previous file" }),
			vim.keymap.set("n", "<leader>hh", ":Telescope harpoon marks<CR>"),
		})
		require("telescope").load_extension("harpoon")
	end,
}
