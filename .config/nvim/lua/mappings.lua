-- Basic buffer operations
vim.keymap.set("n", "<leader>w", ":w<cr>", { silent = true, desc = "Write buffer" })
vim.keymap.set("n", "<leader>e", ":e!<cr>", { silent = true, desc = "Reload current file" })
vim.keymap.set("n", "<leader>rr", ":cq<cr>", { silent = true, desc = "Exit Neovim and opens it again" })

-- Search history with C-P/C-N
local wildmenumap = function(mapping, alternate)
	return function()
		if vim.fn["wildmenumode"]() == 1 then
			return mapping
		else
			return alternate
		end
	end
end
vim.keymap.set("c", "<c-p>", wildmenumap("<c-p>", "<up>"), { desc = "Move up the history list", expr = true })
vim.keymap.set("c", "<c-n>", wildmenumap("<c-n>", "<down>"), { desc = "Move down the history list", expr = true })

-- Make j/k movement more natural when text is wrapped
vim.keymap.set("n", "j", "gj", { desc = "Down motion" })
vim.keymap.set("n", "k", "gk", { desc = "Up motion" })

-- Home/End with HL
vim.keymap.set("n", "H", "_", { silent = true, desc = "Move to the start of the line" })
vim.keymap.set("n", "L", "$", { silent = true, desc = "Move to the end of the line" })

-- Switch to alternate file
vim.keymap.set("n", "<leader><leader>", "<c-^>", { desc = "Edit the alternate file" })

-- Expand current file's directory
vim.keymap.set("c", "%%", "<C-R>=expand('%:h').'/'<cr>", { desc = "Current file's directory" })

-- Expand to Neovim's config directory
vim.keymap.set("c", "##", "~/.config/nvim/lua/", { desc = "Neovim's config dir" })

-- Toggle line wrapping
vim.keymap.set("n", "<f2>", ":set nowrap!<cr>", { silent = true, desc = "Toggle line wrapping" })

-- Toggle search highlight
vim.keymap.set("n", "<f3>", ":set hlsearch!<cr>", { silent = true, desc = "Toggle search highlighting" })
