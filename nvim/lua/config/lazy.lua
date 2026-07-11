-- Bootstrap de lazy.nvim: si no está instalado, lo clona automáticamente.
-- Esto es lo que hace que tu config sea portable a cualquier máquina nueva:
-- la primera vez que abrís nvim, se instala solo.

local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable",
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)

require("lazy").setup({
  spec = {
    -- Carga automáticamente todos los archivos dentro de lua/plugins/
    { import = "plugins" },
  },
  install = { colorscheme = { "tokyonight" } },
  checker = { enabled = false }, -- no chequear updates automáticamente en cada arranque
})
