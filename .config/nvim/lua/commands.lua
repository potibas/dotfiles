local command = vim.api.nvim_create_user_command

-- Aliases for common typos
command("E", "e", {})
command("Q", "q", {})
command("W", "w", {})
command("WQ", "wq", {})
command("Wq", "wq", {})

local help_opts = { nargs = "*", complete = "help", desc = "Show help in a vertical split" }
command("Help", ":vert bo help <args>", help_opts)
command("He", ":Help <args>", help_opts)
command("H", ":Help <args>", help_opts)
