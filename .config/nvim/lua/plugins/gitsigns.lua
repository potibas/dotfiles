return {
  'lewis6991/gitsigns.nvim',
  config = function()
    require('gitsigns').setup {
      current_line_blame = true,
      current_line_blame_opts = {
        delay = 300,
        ignore_whitespace = true,
      },
      on_attach = function(bufnr)
        local gs = package.loaded.gitsigns

        -- navigation
        vim.keymap.set('n', ']c', function()
          if vim.wo.diff then return ']c' end
          vim.schedule(function() gs.next_hunk() end)
          return '<Ignore>'
        end, { expr = true, buffer = bufnr })

        vim.keymap.set('n', '[c', function()
          if vim.wo.diff then return '[c' end
          vim.schedule(function() gs.prev_hunk() end)
          return '<Ignore>'
        end, { expr = true, buffer = bufnr })

        -- actions
        vim.keymap.set({ 'n', 'v' }, '<leader>hs', ':Gitsigns stage_hunk<cr>', { buffer = bufnr })
        vim.keymap.set({ 'n', 'v' }, '<leader>hr', ':Gitsigns reset_hunk<cr>', { buffer = bufnr })
        vim.keymap.set('n', '<leader>hu', gs.undo_stage_hunk, { buffer = bufnr })
        vim.keymap.set('n', '<leader>hh', gs.preview_hunk, { buffer = bufnr })

        -- text object
        vim.keymap.set({ 'o', 'x' }, 'ih', ':<c-u>Gitsigns select_hunk<cr>', { buffer = bufnr })
      end
    }
  end
}
