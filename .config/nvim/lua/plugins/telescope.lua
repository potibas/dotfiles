return {
	"nvim-telescope/telescope.nvim",

	dependencies = {
		"nvim-lua/plenary.nvim",
		{ "nvim-telescope/telescope-fzf-native.nvim", build = "make" },
	},

	config = function()
		local telescope = require("telescope")

		telescope.setup({
			defaults = {
				layout_config = {
					center = { width = 0.8 },
				},
				mappings = {
					i = {
						-- Disable normal mode
						["<esc>"] = "close",

						-- Use ctrl+hjkl to navigate and scroll horizontally
						["<c-j>"] = "move_selection_next",
						["<c-k>"] = "move_selection_previous",
						["<c-h>"] = "preview_scrolling_left",
						["<c-l>"] = "preview_scrolling_right",
					},
				},
			},
		})
	end,

	keys = {
		{
			"<c-p>",
			function()
				require("telescope.builtin").find_files({ hidden = true })
			end,
			desc = "Find Files (telescope)",
		},
		{
			"<c-f>",
			function()
				require("telescope.builtin").live_grep()
			end,
			desc = "Livegrep (telescope)",
		},
		{
			"<c-s>",
			function()
				require("telescope.builtin").git_status()
			end,
			desc = "Git status (telescope)",
		},
	},
}
