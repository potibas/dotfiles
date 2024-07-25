return {
	"tpope/vim-fugitive",

	lazy = false,

	keys = {
		{
			"<c-g>",
			":G<cr>/^Staged<cr>:nohlsearch<cr>",
			desc = "Git status (fugitive)",
			silent = true,
		},
	},
}
