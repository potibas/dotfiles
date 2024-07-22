return {
	"sindrets/diffview.nvim",

	config = function()
		require("diffview").setup({
			use_icons = false,
			view = {
				default = {
					layout = "diff2_horizontal",
				},
			},
		})
	end,

	keys = {
		{
			"<leader>gd",
			":DiffviewOpen<cr>",
			desc = "Git diff (diffview)",
			silent = true,
		},
		{
			"<leader>gD",
			":DiffviewOpen --cached<cr>",
			desc = "Git diff --cached (diffview)",
			silent = true,
		},
	},
}
