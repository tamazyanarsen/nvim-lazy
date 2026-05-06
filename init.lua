-- bootstrap lazy.nvim, LazyVim and your plugins
require("config.lazy")

vim.o.guifont = "Hack Nerd Font Mono:h14"

vim.g.neovide_cursor_vfx_mode = "railgun" -- vortex,ripple,sonicboom,railgun
-- vim.g.neovide_cursor_vfx_particle_density = 7.0
-- vim.g.neovide_cursor_vfx_particle_lifetime = 1.2

vim.g.neovide_profiler = true

vim.g.neovide_opacity = 0.8
vim.g.neovide_window_blurred = true

-- Это добавляет «глубины» интерфейсу, и подсказки не сливаются с основным кодом
-- тени для всплывающих окон (например, когда LSP показывает подсказку по функции)
vim.g.neovide_floating_blur_amount_x = 2.0
vim.g.neovide_floating_blur_amount_y = 2.0
