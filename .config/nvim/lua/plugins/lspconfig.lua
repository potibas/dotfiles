return {
	"neovim/nvim-lspconfig",

	dependencies = {
		"williamboman/mason.nvim",
		"williamboman/mason-lspconfig.nvim",
	},

	config = function()
		local lspconfig = require("lspconfig")

		require("mason").setup()
		require("mason-lspconfig").setup({
			ensure_installed = {
				"lua_ls",
			},
			automatic_installlation = true,
			handlers = {
				function(server_name)
					require("lspconfig")[server_name].setup({})
				end,

				lua_ls = function()
					lspconfig.lua_ls.setup({
						settings = {
							Lua = {
								-- Recognize vim and hammerspoon as globals
								diagnostics = { globals = { "vim", "hs" } },
							},
						},
					})
				end,
			},
		})
	end,
}
