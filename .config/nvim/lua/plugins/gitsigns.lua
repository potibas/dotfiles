return {
	"lewis6991/gitsigns.nvim",

	config = function()
		require("gitsigns").setup({

			-- styles used for the preview window
			preview_config = {
				border = "rounded",
				col = 5,
				row = 2,
			},

			-- configure current line blame but disable by default
			current_line_blame = false,
			current_line_blame_opts = {
				ignore_whitespace = false,
				delay = 10,
				virt_text = true,
				virt_text_pos = "eol",
				virt_text_priority = 100,
			},
			current_line_blame_formatter = "      <abbrev_sha> <author_time:%R> - <summary> ",

			on_attach = function(b)
				local gs = package.loaded.gitsigns

				local map = function(mode, lhs, desc, rhs)
					vim.keymap.set(mode, lhs, rhs, { buffer = b, desc = desc })
				end

				map("n", "]c", "Jump to next hunk (gitsigns)", function()
					if vim.wo.diff then
						return "]c"
					end
					vim.schedule(gs.next_hunk)
					return "<Ignore>"
				end)

				map("n", "[c", "Jump to previous hunk (gitsigns)", function()
					if vim.wo.diff then
						return "[c"
					end
					vim.schedule(gs.prev_hunk)
					return "<Ignore>"
				end)

				map("n", "<f9>", "Toggle git changes inline (gitsigns)", function()
					local value = gs.toggle_deleted()
					gs.toggle_linehl(value)
					gs.toggle_numhl(value)
				end)

				map("n", "<leader>gs", "Stage hunk under cursor (gitsigns)", gs.stage_hunk)
				map("n", "<leader>gr", "Reset hunk under cursor (gitsigns)", gs.reset_hunk)
				map("n", "<leader>gh", "Preview hunk under cursor (gitsigns)", gs.preview_hunk)
				map("n", "<leader>gu", "Undo last stage hunk (gitsigns)", gs.undo_stage_hunk)
				map("n", "<leader>gS", "Stage current buffer (gitsigns)", gs.stage_buffer)
				map("n", "<leader>gR", "Reset current buffer (gitsigns)", gs.reset_buffer)
				map("n", "<leader>gI", "Reset current buffer on index (gitsigns)", gs.reset_buffer_index)
				map("n", "<f8>", "Toggle current line blame (gitsigns)", function() gs.toggle_current_line_blame() end)
			end,
		})
	end,
}
