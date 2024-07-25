return {
	"supermaven-inc/supermaven-nvim",

	config = function()
		require("supermaven-nvim").setup({

			log_level = "info",
			disable_inline_completion = false,

			keymaps = {
				accept_suggestion = "<c-l>",
				accept_word = "<c-j>",
				clear_suggestion = "<c-c>",
			},
		})
	end,

	keys = {
		{
			"<f7>",
			function()
				require("supermaven-nvim.api").toggle()
			end,
			silent = true,
			desc = "Toggle Supermaven",
		},
	},
}
