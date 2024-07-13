return {
  'lewis6991/gitsigns.nvim',

  config = function()
    require('gitsigns').setup({

      -- styles used for the preview window
      preview_config = {
        border = 'rounded',
      },

      -- show blame on current line
      current_line_blame = false,
      current_line_blame_opts = {
        ignore_whitespace = false,
        delay = 200,
        virt_text = true,
        virt_text_pos = 'right_align',
        virt_text_priority = 100,
      },
      current_line_blame_formatter = '    <abbrev_sha> <author_time:%R> - <summary> ',

      -- Do not show signs for staged hunks
      signs_staged_enable = false,

      on_attach = function(b)
        local gs = package.loaded.gitsigns

        local map = function(mode, lhs, desc, rhs)
          vim.keymap.set(mode, lhs, rhs, { buffer = b, desc = desc })
        end

        map('n', ']c', 'Jump to next hunk', function()
          if vim.wo.diff then return ']c' end
          vim.schedule(gs.next_hunk)
          return '<Ignore>'
        end)

        map('n', '[c', 'Jump to previous hunk', function()
          if vim.wo.diff then return '[c' end
          vim.schedule(gs.prev_hunk)
          return '<Ignore>'
        end)

        map('n', '<f9>', 'Toggle git changes inline', function () 
          local value = gs.toggle_deleted()
          gs.toggle_linehl(value)
          gs.toggle_numhl(value)
        end)

        map('n', '<leader>gs', 'Stage hunk under cursor', gs.stage_hunk)
        map('n', '<leader>gr', 'Reset hunk under cursor', gs.reset_hunk)
        map('n', '<leader>gu', 'Undo last stage hunk', gs.undo_stage_hunk)
        map('n', '<leader>gS', 'Stage current buffer', gs.stage_buffer)
        map('n', '<leader>gR', 'Reset current buffer', gs.reset_buffer)
        map('n', '<leader>gI', 'Reset current buffer on index', gs.reset_buffer_index)
        map('n', '<leader>gt', 'Toggle current line blame', gs.toggle_current_line_blame)
      end,

    })
  end,

}
