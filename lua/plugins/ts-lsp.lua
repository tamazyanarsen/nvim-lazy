return {
  {
    "neovim/nvim-lspconfig",
    dependencies = { "saghen/blink.cmp" }, -- чтобы blink знал о серверах
    config = function()
      -- Здесь будет пустая функция или базовая настройка
      -- Сообщаем всем серверам, что используем blink.cmp для подсказок
      local capabilities = require("blink.cmp").get_lsp_capabilities()
      local lspconfig = require("lspconfig")

      lspconfig.util.default_config =
        vim.tbl_extend("force", lspconfig.util.default_config, { capabilities = capabilities })

      -- ЯВНО запускаем tailwind
      lspconfig.tailwindcss.setup({
        capabilities = capabilities,
        -- Если проект в подпапке, это поможет найти конфиг:
        root_dir = lspconfig.util.root_pattern(
          "tailwind.config.js",
          "tailwind.config.ts",
          "postcss.config.js",
          "package.json"
        ),
      })

      -- Убираем ту самую ошибку "assertion failed!" в document_color.lua
      vim.lsp.handlers["textDocument/documentColor"] = function() end
    end,
  },
  -- 1. Добавляем сам плагин
  {
    "pmizio/typescript-tools.nvim",
    dependencies = { "nvim-lua/plenary.nvim", "neovim/nvim-lspconfig" },
    opts = {
      settings = {
        -- 1. Скорость и производительность
        separate_diagnostic_server = true, -- Выносим ошибки в отдельный процесс
        publish_diagnostic_on = "insert_leave", -- Не считаем ошибки в момент печати
        tsserver_max_memory = 4096, -- Ты уже знаешь, это маст-хэв для Windows

        -- 2. Удобство написания кода
        complete_function_calls = true, -- Авто-скобки для функций
        -- Настройки для ускорения
        tsserver_file_preferences = {
          includeInlayParameterNameHints = "all",
          includeCompletionsForModuleExports = true,
          quotePreference = "auto",
        },
      },
    },
  },

  -- 2. Отключаем vtsls в lspconfig (если он там был прописан явно)
  {
    "neovim/nvim-lspconfig",
    opts = {
      servers = {
        vtsls = { enabled = false }, -- Явно выключаем старый сервер
        ts_ls = { enabled = false }, -- И стандартный тоже, чтобы не конфликтовали
      },
    },
  },
}
