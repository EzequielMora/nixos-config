-- Opciones básicas de Neovim

local opt = vim.opt

opt.number = true              -- números de línea
opt.relativenumber = true      -- números relativos (útil para moverte con conteos, ej: 5j)
opt.expandtab = true           -- usar espacios en vez de tabs
opt.shiftwidth = 2
opt.tabstop = 2
opt.smartindent = true

opt.termguicolors = true       -- colores correctos en la terminal
opt.clipboard = "unnamedplus"  -- usar el clipboard del sistema (copiar/pegar entre apps)

opt.ignorecase = true          -- búsquedas insensibles a mayúsculas...
opt.smartcase = true           -- ...salvo que escribas alguna mayúscula

opt.splitright = true          -- splits verticales se abren a la derecha
opt.splitbelow = true          -- splits horizontales se abren abajo

opt.scrolloff = 8              -- mantiene 8 líneas de contexto arriba/abajo del cursor
opt.signcolumn = "yes"         -- columna fija para signos (git, errores lsp), evita que el texto salte

opt.updatetime = 250           -- más reactivo para plugins como gitsigns
