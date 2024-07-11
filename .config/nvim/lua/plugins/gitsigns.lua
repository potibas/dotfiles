return {
  'lewis6991/gitsigns.nvim',
  config = function()
    require('gitsigns').setup {
      current_line_blame = true,
      current_line_blame_opts = {
        ignore_whitespace = false,
        delay = 500,
        virt_text = true,
        virt_text_pos = 'right_align',
        virt_text_priority = 100,
      },
      current_line_blame_formatter = '    <abbrev_sha> <author>, <author_time:%R> - <summary> ',
      on_attach = function(bufnr)
        local gs = package.loaded.gitsigns

        local function map(mode, l, r, opts)
          opts = opts or {}
          opts.buffer = bufnr
          vim.keymap.set(mode, l, r, opts)
        end

        local function nmap(l, r, opts)
          map('n', l, r, opts)
        end

        local function nvmap(l, r, opts)
          map({ 'n', 'v' }, l, r, opts)
        end

        -- navigation
        nmap(']g', function()
          if vim.wo.diff then return ']g' end
          vim.schedule(function() gs.next_hunk() end)
          return '<Ignore>'
        end, { expr = true, desc = 'Jump to next hunk in buffer' })

        nmap('[g', function()
          if vim.wo.diff then return '[g' end
          vim.schedule(function() gs.prev_hunk() end)
          return '<Ignore>'
        end, { expr = true, desc = 'Jump to previous hunk in buffer' })

        -- actions
        nvmap('<leader>gs', gs.stage_hunk, { desc = 'Stage hunk under cursor' })
        nvmap('<leader>gr', gs.reset_hunk, { desc = 'Reset linkes of hunk under cursor' })
        nmap('<leader>gu', gs.undo_stage_hunk, { desc = 'Undo last stage hunk' })
        nmap('<leader>gh', gs.preview_hunk, { desc = 'Preview hunk under cursor' })
        nmap('<leader>gH', gs.toggle_deleted, { desc = 'Show/hide deleted lines' })
        nmap('<leader>gS', gs.stage_buffer, { desc = 'Stage current buffer' })
        nmap('<leader>gR', gs.reset_buffer, { desc = 'Reset current buffer' })
        nmap('<leader>gI', gs.reset_buffer_index, { desc = 'Reset current buffer in the index' })
        nmap('<leader>gt', gs.toggle_current_line_blame, { desc = 'Toggle current line blame' })

        -- text object
        map({ 'o', 'x' }, 'ig', ':<c-u>Gitsigns select_hunk<cr>', { desc = 'Select inside git hunk' })
      end
    }
  end
}
