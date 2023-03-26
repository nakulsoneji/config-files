require'nvim-treesitter.configs'.setup {
  ensure_installed = { "lua", "html", "markdown", "markdown_inline", "vim", "rust" },
  auto_install = true,
  autotag = {
    enable = true,
  }
}

