-- Resaltado de sintaxis basado en parseo real (no regex)
return {
  "nvim-treesitter/nvim-treesitter",
  build = ":TSUpdate",
  config = function()
    require("nvim-treesitter.configs").setup({
      ensure_installed = { "lua", "nix", "python", "bash", "json", "yaml", "markdown" },
      highlight = { enable = true },
      indent = { enable = true },
    })
  end,
}
