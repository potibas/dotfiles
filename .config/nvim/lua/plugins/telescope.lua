return {
	"nvim-telescope/telescope.nvim",

	dependencies = {
		"nvim-lua/plenary.nvim",
		{ "nvim-telescope/telescope-fzf-native.nvim", build = "make" },
	},

	config = function()
		local telescope = require("telescope")

		telescope.setup({
			defaults = {
				layout_config = {
					center = { width = 0.8 },
				},
				mappings = {
					i = {
						-- Disable normal mode
						["<esc>"] = "close",

						-- Use ctrl+hjkl to navigate and scroll horizontally
						["<c-j>"] = "move_selection_next",
						["<c-k>"] = "move_selection_previous",
						["<c-h>"] = "preview_scrolling_left",
						["<c-l>"] = "preview_scrolling_right",
					},
				},
			},
			pickers = {
				buffers = {
					mappings = {
						i = {
							["<c-x>"] = "delete_buffer",
						},
					},
				},
			},
		})
	end,

	keys = {
		{
			"<c-p>",
			function()
				require("telescope.builtin").find_files()
			end,
			desc = "Find Files (telescope)",
		},
		{
			"<c-f>",
			function()
				require("telescope.builtin").live_grep()
			end,
			desc = "Livegrep (telescope)",
		},
		{
			"<c-b>",
			function()
				require("telescope.builtin").buffers()
			end,
			desc = "Find Buffer (telescope)",
		},
		{
			"<leader>pp",
			function()
				require("telescope.builtin").find_files({ hidden = true })
			end,
			desc = "Find Files (all files)",
		},
		{
			"<leader>pf",
			function()
				require("telescope.builtin").live_grep({ additional_args = { "--no-ignore", "--hidden" } })
			end,
			desc = "Livegrep (all files)",
		},
		{
			"<c-s>",
			function()
				require("telescope.builtin").git_status()
			end,
			desc = "Git status (telescope)",
		},
		{
			"<leader>gl",
			function()
				require("telescope.builtin").git_commits({
					git_command = { "git", "log", "--pretty=oneline", "--abbrev-commit", "--decorate" },
				})
			end,
			desc = "Git log (telescope)",
		},
		{
			"<leader>gL",
			function()
				require("telescope.builtin").git_bcommits()
			end,
			desc = "Git log current file (telescope)",
		},
		{
			"<leader>gl",
			function()
				require("telescope.builtin").git_bcommits_range()
			end,
			mode = { "v" },
			desc = "Git log current range (telescope)",
		},
		{
			"<leader>gf",
			function()
				require("telescope.builtin").git_files()
			end,
			desc = "Git files (telescope)",
		},
	},
}
