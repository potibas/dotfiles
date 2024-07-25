return {

	"nvim-lualine/lualine.nvim",

	config = function()
		require("lualine").setup({

			options = {
				blobalstatus = true,
			},

			sections = {
				lualine_c = {
					{
						"filename",
						newfile_status = true,
						path = 1,
					},
				},
			},
		})
	end,
}
