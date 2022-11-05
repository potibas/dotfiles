-- ref: https://www.youtube.com/watch?v=gd_wapDL0V0
local fn = vim.fn

-- Install packer automatically
local install_path = fn.stdpath "data" .. "/site/pack/packer/start/packer.nvim"
if fn.empty(fn.glob(install_path)) > 0 then
  PACKER_BOOTSTRAP = fn.system {
    "git", "clone", "--depth", "1",
    "https://github.com/wbthomason/packer.nvim",
    install_path
  }
  print "Installing packer, please restart Neovim"
  vim.cmd [[packadd packer.nvim]]
end

-- Autocommand to reload neovim whenever plugins.lua file is saved
vim.cmd [[
  augroup packer_user_config
    autocmd!
    autocmd BufWritePost plugins.lua source <afile> | PackerSync
  augroup end
]]

-- Use a protected call so we don't error out on first use
local ok, packer = pcall(require, "packer")
if not ok then
  return
end

-- Have packer use a popup window
packer.init {
  display = {
    open_fn = function()
      return require("packer.util").float { border = "rounded" }
    end,
  },
}

-- Install your plugins here
return packer.startup(function(use)

  -- Essentials
  use "wbthomason/packer.nvim"            -- Have packer manage itself
  use "nvim-lua/popup.nvim"               -- Vim's popup API implementation for nvim, used by lots of plugins
  use "nvim-lua/plenary.nvim"             -- Useful lua functions used by lots of plugins
  use "tpope/vim-surround"                -- Surround things, change surroundings etc
  use "tpope/vim-commentary"              -- Comment stuff with `gc` + motion

  -- Colors
  use "marko-cerovac/material.nvim"
  use "lunarvim/darkplus.nvim"
  use "Lokaltog/vim-distinguished"

  -- Extend vim's % with motions and integrates with tree-sitter
  use {
    "andymass/vim-matchup",
    config = function()
      require("nvim-treesitter.configs").setup { matchup = { enable = true } }
    end
  }

  -- Remove trailing spaces and empty lines
  use { "mcauley-penney/tidy.nvim", config = function() require("tidy").setup() end }

  -- Tree sitter
  use {
    "nvim-treesitter/nvim-treesitter",
    run = function() require("nvim-treesitter.install").update({ with_sync = true }) end,
    config = function()
      require("nvim-treesitter.configs").setup {
        ensure_installed = "all",
        highlight = { enable = true }
      }
    end
  }

  -- Colorizer
  use {
    "norcalli/nvim-colorizer.lua",
    config = function()
      require("colorizer").setup {
        "css";
        "javascript";
        "yaml";
        html = { mode = "foreground"; }
      }
    end
  }

  -- After cloning packer, automatically setup your configuration
  if PACKER_BOOTSTRAP then
    require("packer").sync()
  end
end)
