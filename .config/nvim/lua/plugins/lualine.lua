return {

	"nvim-lualine/lualine.nvim",

	config = function()
		require("lualine").setup({

			options = {
				blobalstatus = true,
			},

		})
	end,
}
