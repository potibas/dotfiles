-- Indenting
vim.opt.shiftwidth = 2
vim.opt.softtabstop = 2
vim.opt.tabstop = 2
vim.opt.expandtab = true
vim.opt.autoindent = true
vim.opt.smartindent = true

-- Searching
vim.opt.incsearch = true
vim.opt.hlsearch = true
vim.opt.ignorecase = true
vim.opt.smartcase = true

-- Save undo history
vim.opt.undofile = true

-- Don't insert comments on new lines
vim.cmd [[autocmd FileType * setlocal formatoptions-=c formatoptions-=r formatoptions-=o]]

-- Jump to matching brackets but very briefly
vim.opt.showmatch = true
vim.opt.matchtime = 1

-- Appearance
vim.opt.number = true
vim.opt.relativenumber = true
vim.opt.signcolumn = 'yes'
