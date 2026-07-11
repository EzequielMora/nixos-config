-- Atajos de teclado personalizados

vim.g.mapleader = " "  -- tecla líder = espacio

local map = vim.keymap.set

-- Explorador de archivos (nvim-tree)
map("n", "<C-n>", ":NvimTreeToggle<CR>", { desc = "Abrir/cerrar explorador de archivos", silent = true })

-- Telescope (buscador difuso)
map("n", "<leader>ff", ":Telescope find_files<CR>", { desc = "Buscar archivos" })
map("n", "<leader>fg", ":Telescope live_grep<CR>", { desc = "Buscar texto en archivos" })
map("n", "<leader>fb", ":Telescope buffers<CR>", { desc = "Buscar entre buffers abiertos" })

-- Moverse entre splits/ventanas más fácil
map("n", "<C-h>", "<C-w>h", { desc = "Ir a la ventana de la izquierda" })
map("n", "<C-l>", "<C-w>l", { desc = "Ir a la ventana de la derecha" })
map("n", "<C-j>", "<C-w>j", { desc = "Ir a la ventana de abajo" })
map("n", "<C-k>", "<C-w>k", { desc = "Ir a la ventana de arriba" })

-- Guardar rápido
map("n", "<leader>w", ":w<CR>", { desc = "Guardar archivo" })
