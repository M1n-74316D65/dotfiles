lvim.plugins = {
  { "shaunsingh/nord.nvim" },
  { "sbdchd/neoformat" },
  {
    "folke/todo-comments.nvim",
    event = "BufRead",
    config = function()
      require("todo-comments").setup()
    end,
  },
  {
    'tzachar/cmp-tabnine',
    build = './install.sh',
    dependencies = 'hrsh7th/nvim-cmp',
  }
}
vim.opt.guifont = "FiraCode Nerd Font:h10"
