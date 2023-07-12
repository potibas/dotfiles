return {
  'mrjones2014/dash.nvim',
  build = 'make install',
  config = true,
  keys = {
    { '<leader>sf', ':DashWord! <CR>', desc = "Dash" }
  }
}
