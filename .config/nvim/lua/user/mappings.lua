local function map(m, k, v)
  vim.keymap.set(m, k, v, { silent = true })
end

local function nmap(k, v)
  map("n", k, v)
end

local function imap(k, v)
  map("i", k, v)
end

local function vmap(k, v)
  map("v", k, v)
end

-- Leader key
vim.g.mapleader = ","

-- Fixes "*" (keep the cursor position, don"t move to next match)
nmap("*", "*N")

-- Mimic emacs mode movements in insert mode
imap("<c-E>", "<esc>A")
imap("<c-A>", "<esc>I")
imap("<c-D>", "<c-o>x")

-- File operations
nmap("<leader>w", ":w<cr>")
nmap("<leader>q", ":q<cr>")

-- Switch to last edited file
nmap("<leader><leader>", "<c-^>")

-- Mimic Home/End
nmap("<s-h>", "0")
nmap("<s-l>", "$")

-- Keep the paste buffer in visual mode
vmap("p", '"_dP')

-- Edit nvim config
local vimdir = os.getenv("HOME") .. "/.config/nvim"
nmap("<leader>vei", ":e " .. vimdir .. "/init.lua<cr>")
nmap("<leader>veo", ":e " .. vimdir .. "/lua/user/options.lua<cr>")
nmap("<leader>vem", ":e " .. vimdir .. "/lua/user/mappings.lua<cr>")
nmap("<leader>vep", ":e " .. vimdir .. "/lua/user/plugins.lua<cr>")
nmap("<leader>vec", ":e " .. vimdir .. "/lua/user/colorscheme.lua<cr>")
nmap("<leader>vs", ":w | :so " .. vimdir .. "/init.lua<cr>")
