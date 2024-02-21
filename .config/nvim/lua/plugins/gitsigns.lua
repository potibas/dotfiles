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
        vim.keymap.set('n', ']g', function()
          if vim.wo.diff then return ']g' end
          vim.schedule(function() gs.next_hunk() end)
          return '<Ignore>'
        end, { expr = true, buffer = bufnr, desc = 'Jump to next hunk in buffer' })

        vim.keymap.set('n', '[g', function()
          if vim.wo.diff then return '[g' end
          vim.schedule(function() gs.prev_hunk() end)
          return '<Ignore>'
        end, { expr = true, buffer = bufnr, desc = 'Jump to previous hunk in buffer' })

        -- actions
        vim.keymap.set({ 'n', 'v' }, '<leader>gS', gs.stage_hunk,
          { buffer = bufnr, desc = 'Stage hunk under cursor' })
        vim.keymap.set({ 'n', 'v' }, '<leader>gR', gs.reset_hunk,
          { buffer = bufnr, desc = 'Reset lines of hunk under cursor' })
        vim.keymap.set('n', '<leader>gU', gs.undo_stage_hunk,
          { buffer = bufnr, desc = 'Undo last stage hunk' })
        vim.keymap.set('n', '<leader>gh', gs.preview_hunk,
          { buffer = bufnr, desc = 'Preview hunk under cursor' })
        vim.keymap.set('n', '<leader>gs', gs.stage_buffer,
          { buffer = bufnr, desc = 'Stage current buffer' })

        -- text object
        vim.keymap.set({ 'o', 'x' }, 'ih', ':<c-u>Gitsigns select_hunk<cr>',
          { buffer = bufnr, desc = 'Select hunk under cursor' })
      end
    }
  end
}
