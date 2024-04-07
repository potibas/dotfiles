return {
  'neovim/nvim-lspconfig',
  dependencies = {
    'williamboman/mason.nvim',
    'williamboman/mason-lspconfig.nvim',
  },
  config = function()
    require('mason').setup()
    require('mason-lspconfig').setup({
      ensure_installed = {
        'elixirls',
        'lua_ls',
        'phpactor',
      },
      automatic_installlation = true,
    })

    local lspconfig = require('lspconfig')
    local format_on_save_group = vim.api.nvim_create_augroup('formatOnSave', {})

    local on_attach = function(client, bufnr)
      local function buf_set_keymap(...) vim.api.nvim_buf_set_keymap(bufnr, ...) end
      local function buf_set_option(...) vim.api.nvim_buf_set_option(bufnr, ...) end

      buf_set_option('omnifunc', 'v:lua.vim.lsp.omnifunc')

      local opts = { noremap = true, silent = true }

      buf_set_keymap('n', 'gD', '<cmd>lua vim.lsp.buf.declaration()<cr>', opts)
      buf_set_keymap('n', 'gd', '<cmd>lua vim.lsp.buf.definition()<cr>', opts)
      buf_set_keymap('n', 'gi', '<cmd>lua vim.lsp.buf.implementation()<cr>', opts)
      buf_set_keymap('n', 'gr', '<cmd>lua vim.lsp.buf.references()<cr>', opts)
      buf_set_keymap('n', 'K', '<cmd>lua vim.lsp.buf.hover()<cr>', opts)
      buf_set_keymap('n', '[d', '<cmd>lua vim.diagnostic.goto_prev()<cr>', opts)
      buf_set_keymap('n', ']d', '<cmd>lua vim.diagnostic.goto_next()<cr>', opts)

      buf_set_keymap('n', '<leader>f', '<cmd>lua vim.lsp.buf.format({ async = true })<cr>', opts)

      if client.supports_method('textDocument/formatting') then
        vim.api.nvim_clear_autocmds({ group = format_on_save_group, buffer = bufnr })
        vim.api.nvim_create_autocmd('BufWritePre', {
          group = format_on_save_group,
          buffer = bufnr,
          callback = function()
            vim.lsp.buf.format({ bufnr = bufnr })
          end,
        })
      end
      vim.api.nvim_create_user_command('Format', function() vim.lsp.buf.format({ async = true }) end, {})
    end

    vim.lsp.handlers["textDocument/publishDiagnostics"] = vim.lsp.with(
      vim.lsp.diagnostic.on_publish_diagnostics,
      {
        virtual_text = false,
        signs = true,
        update_in_insert = false,
        underline = false,
      }
    )

    local opts = {
      on_attach = on_attach
    }

    require('mason-lspconfig').setup_handlers {
      ['elixirls'] = function()
        local root = vim.fs.dirname(vim.fs.find({ 'mix.exs', '.git' }, { upward = true })[1])
        local umb_root = vim.fs.dirname(vim.fs.find({ 'mix.exs' }, { upward = true, path = root })[1])

        if umb_root then
          local Path = require('plenary.path')
          if not vim.startswith(root, Path:joinpath(umb_root, 'apps'):absolute()) then
            umb_root = nil
          end
        end

        local root_dir = umb_root or root or vim.loop.os_homedir()

        opts.settings = {
          elixirLS = {
            fetchDeps = false,
            dialyzerEnabled = true,
            dialyzerFormat = 'dialyxir_short',
            suggestSpecs = true,
            root_dir = root_dir
          }
        }
        lspconfig.elixirls.setup(opts)
      end,

      ['lua_ls'] = function()
        opts.settings = {
          Lua = {
            diagnostics = {
              globals = { 'vim', 'hs' }
            },
            workspace = {
              library = {
                [vim.fn.expand('$VIMRUNTIME/lua')] = true,
                [vim.fn.expand('$VIMRUNTIME/lua/vim/lsp')] = true,
              },
            },
          },
        }

        lspconfig.lua_ls.setup(opts)
      end,

      ['phpactor'] = function()
        opts.handlers = {
          ["textDocument/publishDiagnostics"] = function() end,
        }
        lspconfig.phpactor.setup(opts)
      end,
    }
  end
}
