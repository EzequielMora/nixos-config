-- Explorador de archivos lateral (se abre con Ctrl+n, ver keymaps.lua)
return {
  "nvim-tree/nvim-tree.lua",
  dependencies = { "nvim-tree/nvim-web-devicons" }, -- iconos por tipo de archivo
  config = function()
    require("nvim-tree").setup({
      view = { width = 30 },
      renderer = { group_empty = true },
      filters = { dotfiles = false },
    })
  end,
}
