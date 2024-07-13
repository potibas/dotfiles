local command = vim.api.nvim_create_user_command

-- Common typos
command('E', 'e', {})
command('Q', 'q', {})
command('W', 'w', {})
command('WQ', 'wq', {})
command('Wq', 'wq', {})

command('H', ':vert bo help <args>', { nargs = '*', complete = 'help', desc = 'Show help in a vertical split' })
