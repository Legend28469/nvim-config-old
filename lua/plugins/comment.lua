return {
	"numToStr/Comment.nvim",
	lazy = false,
	config = function()
		vim.keymap.set("n", "<leader>/", "<Plug>(comment_toggle_linewise_current)", { desc = "Comment line" })
		vim.keymap.set("v", "<leader>/", "<Plug>(comment_toggle_linewise_visual)", { desc = "Comment line(s)" })
	end,
}
