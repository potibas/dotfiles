return {

	"folke/which-key.nvim",
	event = "VeryLazy",

	dependencies = {
		{ "echasnovski/mini.icons", version = false },
	},

	---@class wk.Opts
	opts = {
		---@type false | "classic" | "modern" | "helix"
		preset = "helix",

		sort = { "alphanum" },
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
