return {
  -- add gruvbox
  -- { "ellisonleao/gruvbox.nvim" },
  { "datsfilipe/vesper.nvim" },
  -- Configure LazyVim to load gruvbox
  {
    "LazyVim/LazyVim",
    opts = {
      colorscheme = "vesper",
    },
  },
}
