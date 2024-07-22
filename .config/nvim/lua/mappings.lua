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
vim.keymap.set("n", "<f5>", ":set nowrap!<cr>", { silent = true, desc = "Toggle line wrapping" })

-- Toggle search highlight
vim.keymap.set("n", "<f3>", ":set hlsearch!<cr>", { silent = true, desc = "Toggle search highlighting" })

-- Stop being annoyed by the `q` key
vim.keymap.set("c", "q:", "<Nop>", { silent = true })
vim.keymap.set("n", "q", ":close<cr>", { silent = true, desc = "Close current window" })
vim.keymap.set("n", "<leader>q", ":q<cr>", { silent = true, desc = "Quit current window" })
vim.keymap.set("n", "<leader>Q", ":qa<cr>", { silent = true, desc = "Quit all windows" })

-- ctrl+/ for contextual help
vim.keymap.set("n", "<c-/>", ":H <c-r><c-w><cr>", { silent = true, desc = "Show help for the word under the cursor" })
vim.keymap.set("n", "<c-_>", ":H <c-r><c-w><cr>", { silent = true, desc = "Show help for the word under the cursor" })

-- Show diagnostics in a floating window
vim.keymap.set("n", "gl", "<cmd>lua vim.diagnostic.open_float()<cr>")

-- Jump between diagnostics
vim.keymap.set("n", "[d", "<cmd>lua vim.diagnostic.goto_prev()<cr>")
vim.keymap.set("n", "]d", "<cmd>lua vim.diagnostic.goto_next()<cr>")

-- LSP mappings
vim.api.nvim_create_autocmd("LspAttach", {
	desc = "LSP actions",
	callback = function(event)
		local bufmap = function(mode, lhs, rhs, desc)
			vim.keymap.set(mode, lhs, rhs, { buffer = event.buf, desc = desc })
		end

		bufmap("n", "K", "<cmd>lua vim.lsp.buf.hover()<cr>", "Show documentation")
		bufmap("n", "gd", "<cmd>lua vim.lsp.buf.definition()<cr>", "Jump to definition")
		bufmap("n", "<f12>", "<cmd>lua vim.lsp.buf.definition()<cr>", "Jump to definition")
		bufmap("n", "gD", "<cmd>lua vim.lsp.buf.declaration()<cr>", "Jump to declaration")
		bufmap("n", "gi", "<cmd>lua vim.lsp.buf.implementation()<cr>", "List implementations")
		bufmap("n", "go", "<cmd>lua vim.lsp.buf.type_definition()<cr>", "Jumps to the definition of the type symbol")
		bufmap("n", "gr", "<cmd>lua vim.lsp.buf.references()<cr>", "List all the references")
		bufmap("n", "gk", "<cmd>lua vim.lsp.buf.signature_help()<cr>", "Display's function signature information")
		bufmap("n", "<f2>", "<cmd>lua vim.lsp.buf.rename()<cr>", "Rename references")
		bufmap("n", "<leader>f", "<cmd>lua vim.lsp.buf.format()<cr>", "Format current file")
		bufmap("n", "<f4>", "<cmd>lua vim.lsp.buf.code_action()<cr>", "Select code action")
	end,
})

-- Multipurpose tab key
-- adapted from: https://github.com/garybernhardt/dotfiles
vim.cmd([[
  function! InsertTabWrapper()
    let col = col('.') - 1
    if !col
        return "\<tab>"
    endif

    let char = getline('.')[col - 1]
    if char =~ '\k'
        " There's an identifier before the cursor, so complete the identifier.
        return "\<c-p>"
    else
        return "\<tab>"
    endif
endfunction
inoremap <expr> <tab> InsertTabWrapper()
inoremap <s-tab> <c-n>
]])
