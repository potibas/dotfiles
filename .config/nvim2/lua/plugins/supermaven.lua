return {
  'supermaven-inc/supermaven-nvim',
  config = function()
    require("supermaven-nvim").setup({
      log_level = "info",                  -- set to "off" to disable logging completejbjy
      disable_inline_completion = false,   -- set to true if you want to use cmp for that
      disable_keymaps = false,             -- disables built in keymaps for more manual control
      keymaps = {
        accept_suggestion = "<tab>",
        clear_suggestion = "<c-c>",
        accept_word = "<c-j>",
      },
      ignore_filetypes = {
        cpp = true,
      }
      -- color = {
      --   suggestion_color = "#ffffff",
      --   cterm = 244,
      -- },
    })
  end,
}
