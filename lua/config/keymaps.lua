-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here

local map = vim.keymap.set

map("n", "grr", "<cmd>Telescope lsp_references<cr>", { desc = "LSP References" })
map("n", "gd", "<cmd>Telescope lsp_definitions<cr>", { desc = "LSP Definitions" })
map("n", "gi", "<cmd>Telescope lsp_implementations<cr>", { desc = "LSP Implementations" })

-- Организовать импорты (сортировка + удаление лишних)
map("n", "<leader>co", "<cmd>TSToolsOrganizeImports<cr>", { desc = "Organize Imports" })

-- Добавить недостающие импорты
map("n", "<leader>ci", "<cmd>TSToolsAddMissingImports<cr>", { desc = "Add Missing Imports" })

-- Бонус: Исправить всё (аналог Ctrl + . в VS Code)
map("n", "<leader>ca", "<cmd>TSToolsFixAll<cr>", { desc = "Fix All Diagnostics" })
