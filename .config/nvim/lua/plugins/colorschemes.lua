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

						-- Git signs
						GitSignsCurrentLineBlame = { fg = colors.overlay2, italic = true },

						-- Bring attention to errors in the git commit message
						["@gitcommit_error.gitcommit"] = { reverse = true },
					}
				end,
			})

			vim.cmd.colorscheme("catppuccin")
		end,
	},
}
