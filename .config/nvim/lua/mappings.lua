-- Basic buffer operations
vim.keymap.set("n", "<leader>w", ":w<cr>", { silent = true, desc = "Write buffer" })
vim.keymap.set("n", "<leader>e", ":e!<cr>", { silent = true, desc = "Reload current file" })
