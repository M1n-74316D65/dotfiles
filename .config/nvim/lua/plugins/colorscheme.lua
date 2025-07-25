return {
  -- add gruvbox
  { "ellisonleao/gruvbox.nvim" },
  -- { "datsfilipe/vesper.nvim" },
  -- Configure LazyVim to load gruvbox
  {
    "LazyVim/LazyVim",
    opts = {
      -- colorscheme = "vesper",
      colorscheme = "gruvbox",
    },
  },
  {
    "f-person/auto-dark-mode.nvim",
    opts = {
      set_dark_mode = function()
        vim.api.nvim_set_option_value("background", "dark", {})
      end,
      set_light_mode = function()
        vim.api.nvim_set_option_value("background", "light", {})
      end,
      update_interval = 3000, -- milisegundos
      fallback = "dark",
    },
  },
}
