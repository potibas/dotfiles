local command = vim.api.nvim_create_user_command

-- Aliases for common typos
command("E", "e", {})
command("Q", "q", {})
command("W", "w", {})
command("WQ", "wq", {})
command("Wq", "wq", {})
