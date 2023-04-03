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
        vim.keymap.set({ 'n', 'v' }, '<leader>cs', ':gitsigns stage_hunk<cr>', { buffer = bufnr })
        vim.keymap.set({ 'n', 'v' }, '<leader>cr', ':gitsigns reset_hunk<cr>', { buffer = bufnr })
        vim.keymap.set('n', '<leader>cs', gs.stage_buffer, { buffer = bufnr })
        vim.keymap.set('n', '<leader>cu', gs.undo_stage_hunk, { buffer = bufnr })
        vim.keymap.set('n', '<leader>cr', gs.reset_buffer, { buffer = bufnr })
        vim.keymap.set('n', '<leader>cc', gs.preview_hunk, { buffer = bufnr })
        vim.keymap.set('n', '<leader>cb', function() gs.blame_line { full = true } end, { buffer = bufnr })

        -- text object
        vim.keymap.set({ 'o', 'x' }, 'ih', ':<c-u>Gitsigns select_hunk<cr>', { buffer = bufnr })
      end
    }
  end
}
