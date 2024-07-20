return {
	{
		"catppuccin/nvim",
		name = "catppuccin",
		lazy = false,
		priority = 1000,

		config = function()
			require("catppuccin").setup({
				flavour = "mocha",
				custom_highlights = function(colors)
					return {
						-- Search
						Search = { italic = true, underline = true, fg = colors.yellow, bg = "NONE" },
						CurSearch = { italic = true, underline = true, fg = colors.blue, bold = true, bg = "NONE" },
						IncSearch = { link = "Search" },
					}
				end,
			})

			vim.cmd.colorscheme("catppuccin")
		end,
	},
}
