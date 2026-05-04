-- return {
--   {
--     "f-person/auto-dark-mode.nvim",
--     opts = {
--       update_interval = 2000,
--       set_dark_mode = function()
--         vim.o.background = "dark"
--         vim.cmd.colorscheme("tokyonight")
--       end,
--       set_light_mode = function()
--         vim.o.background = "light"
--         vim.cmd.colorscheme("tokyonight-day")
--       end,
--     },
--   },
-- }

return {
  -- Твоя настройка авто-переключения
  {
    "f-person/auto-dark-mode.nvim",
    opts = {
      update_interval = 2000,
      set_dark_mode = function()
        vim.api.nvim_set_option_value("background", "dark", {})
        vim.cmd.colorscheme("tokyonight")
      end,
      set_light_mode = function()
        vim.api.nvim_set_option_value("background", "light", {})
        vim.cmd.colorscheme("tokyonight-day")
      end,
    },
  },

  -- Настройка самой темы для поддержки прозрачности
  {
    "folke/tokyonight.nvim",
    lazy = false,
    opts = {
      transparent = true, -- Это уберет заливку фона Neovim
      styles = {
        sidebars = "transparent",
        floats = "transparent",
      },
    },
  },
}
