return {
	"NeogitOrg/neogit",

	lazy = false,

	dependencies = {
		"nvim-lua/plenary.nvim",
		"sindrets/diffview.nvim",
		"nvim-telescope/telescope.nvim",
	},

	config = function()
		local neogit = require("neogit")

		neogit.setup({
			kind = "replace",
		})

		vim.api.nvim_create_user_command("G", ":Neogit <args>", {
			nargs = "*",
			desc = "Open Neogit",
			complete = neogit.complete,
		})
	end,

	keys = {
		{
			"<c-g>",
			":Neogit<cr>",
			desc = "Git status (neogit)",
			silent = true,
		},
	},
}
