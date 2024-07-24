return {
	"tpope/vim-fugitive",

	lazy = false,

	keys = {
		{
			"<c-g>",
			":vertical G<cr>/^Staged<cr>:nohlsearch<cr>",
			desc = "Git status (fugitive)",
			silent = true,
		},
	},
}
