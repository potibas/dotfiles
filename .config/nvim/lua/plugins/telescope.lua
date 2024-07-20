return {
	"nvim-telescope/telescope.nvim",

	dependencies = {
		"nvim-lua/plenary.nvim",
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
			desc = "Find Files",
		},
		{
			"<c-f>",
			function()
				require("telescope.builtin").live_grep()
			end,
			desc = "Livegrep",
		},
	},
}
