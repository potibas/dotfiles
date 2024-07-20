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
