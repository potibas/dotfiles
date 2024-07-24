return {
	"WhoIsSethDaniel/mason-tool-installer.nvim",

	dependencies = {
		"williamboman/mason.nvim",
	},

	config = function()
		require("mason-tool-installer").setup({
			ensure_installed = {
				"pint",
				"prettierd",
				"stylua",
			},
		})
	end,
}
