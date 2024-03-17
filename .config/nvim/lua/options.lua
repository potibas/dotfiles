vim.g.mapleader = ' '

vim.opt.termguicolors = true
vim.opt.bg = 'dark'
vim.opt.showcmd = true
vim.opt.number = true
vim.opt.cursorline = true
vim.opt.cmdheight = 1
vim.opt.signcolumn = 'yes'
vim.opt.completeopt = 'menu,menuone,noselect'
vim.opt.showmatch = true
vim.opt.matchtime = 1
vim.opt.timeoutlen = 200
vim.opt.clipboard = 'unnamedplus'
vim.opt.backup = false
vim.opt.writebackup = false
vim.opt.swapfile = false

-- Save undo history
local undodir = os.getenv('HOME') .. '/.config/nvim/undo'
if not vim.fn['isdirectory'](undodir) then
  os.mkdir(undodir)
end
vim.opt.undofile = true
vim.opt.undodir = undodir

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

-- Don't insert comments on new lines
vim.cmd [[autocmd FileType * setlocal formatoptions-=c formatoptions-=r formatoptions-=o]]
