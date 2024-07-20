return {
	"nvim-treesitter/nvim-treesitter",

	config = function()
		require("nvim-treesitter.configs").setup({
			-- stylua: ignore
			ensure_installed = {
				"bash", "c", "c_sharp", "cpp", "css",
				"csv", "diff", "dockerfile", "editorconfig",
				"eex", "elixir", "erlang", "git_config",
				"git_rebase", "gitattributes", "gitcommit",
				"gitignore", "go", "gpg", "graphql",
				"heex", "html", "http", "java", "javascript",
				"json", "json5", "jsonc", "lua", "luadoc",
				"make", "markdown_inline", "passwd",
				"php", "php_only", "phpdoc", "printf",
				"python", "ruby", "rust", "sql", "ssh_config",
				"tmux", "toml", "typescript", "vim", "vimdoc",
				"vue", "xml", "yaml"
			},
			autotag = {
				enable = true,
			},
			endwise = {
				enable = true,
			},
			highlight = {
				enable = true,
				use_languagetree = true,
			},
			indent = {
				enable = true,
			},
		})
	end,
}
