return {

	"folke/which-key.nvim",
	event = "VeryLazy",

	dependencies = {
		{ "echasnovski/mini.icons", version = false },
	},

	opts = {
		---@type false | 'classic' | 'modern' | 'helix'
		preset = "helix",

		keys = {
			-- bindings to scroll up and down inside the popup
			scroll_down = "<c-n>",
			scroll_up = "<c-p>",
		},
	},

	keys = {
		{
			"<f1>",
			function()
				require("which-key").show()
			end,
			desc = "Global Keymaps (which-key)",
		},
	},
}
