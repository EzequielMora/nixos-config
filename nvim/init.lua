-- Punto de entrada de la configuración de Neovim
-- Orden importa: primero opciones básicas, después keymaps, después lazy.nvim (plugins)

require("config.options")
require("config.keymaps")
require("config.lazy")
