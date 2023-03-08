-- Setup installer & lsp configs
local typescript_ok, typescript = pcall(require, 'typescript')
local mason_ok, mason = pcall(require, 'mason')
local mason_lsp_ok, mason_lsp = pcall(require, 'mason-lspconfig')
local ufo_config_handler = require('plugins.nvim-ufo').handler

if not mason_ok or not mason_lsp_ok then
  return
end

mason.setup {
  ui = {
    -- The border to use for the UI window. Accepts same border values as |nvim_open_win()|.
    border = XotoVimGlobal.ui.float.border,
  }
}

mason_lsp.setup {
  -- A list of servers to automatically install if they're not already installed
  -- ensure_installed = {
  --   "bashls",
  --   "cssls",
  --   "volar",
  --   "eslint",
  --   -- "graphql",
  --   "lua_ls",
  --   "html",
  --   "jdtls",
  --   "jsonls",
  --   -- "jsonls",
  --   -- "sumneko_lua",
  --   "gradle_ls",
  --   "marksman",
  --   "tailwindcss",
  --   "tsserver",
  --   "vuels",
  --   "yamlls",
  --   "pylsp",
  --   "angularls",
  --   "dockerls",
  --   "glint",
  --   "sqls",
  --   "stylelint_lsp",
  -- },

  -- Whether servers that are set up (via lspconfig) should be automatically installed if they're not already installed.
  -- This setting has no relation with the `ensure_installed` setting.
  -- Can either be:
  --   - false: Servers are not automatically installed.
  --   - true: All servers set up via lspconfig are automatically installed.
  --  { exclude: string[] }: All servers set up via lspconfig, except the ones provided in the list, are automatically installed.  -- example: automatic_installation = { exclude = { "rust_analyzer", "solargraph" } }
  automatic_installation = true,
}

local lspconfig = require("lspconfig")

local handlers = {
  ["textDocument/hover"] = vim.lsp.with(vim.lsp.handlers.hover, { border = XotoVimGlobal.ui.float.border }),
  ["textDocument/signatureHelp"] = vim.lsp.with(vim.lsp.handlers.signature_help, { border = XotoVimGlobal.ui.float.border }),
  ["textDocument/publishDiagnostics"] = vim.lsp.with(vim.lsp.diagnostic.on_publish_diagnostics, { virtual_text = XotoVimGlobal.lsp.virtual_text, virtual_lines = XotoVimGlobal.lsp.virtual_lines }),
}

local function on_attach(client, bufnr)
  -- set up buffer keymaps, etc.
end

local capabilities = require('cmp_nvim_lsp').default_capabilities()

capabilities.textDocument.foldingRange = {
  dynamicRegistration = false,
  lineFoldingOnly = true
}

-- order matters
-- it enables tsserver automatically so no need to call lspconfig.tsserver.setup
if typescript_ok then
  typescript.setup({
    disable_commands = false, -- prevent the plugin from creating Vim commands
    debug = false, -- enable debug logging for commands
    server = { -- lsp config options
      capabilities = require('lsp.servers.tsserver').capabilities,
      handlers = require('lsp.servers.tsserver').handlers,
      on_attach = require('lsp.servers.tsserver').on_attach,
      settings = require('lsp.servers.tsserver').settings,
    }
  })
end

-- lspconfig.tailwindcss.setup {
--   capabilities = require('lsp.servers.tailwindcss').capabilities,
--   filetypes = require('lsp.servers.tailwindcss').filetypes,
--   handlers = handlers,
--   init_options = require('lsp.servers.tailwindcss').init_options,
--   on_attach = require('lsp.servers.tailwindcss').on_attach,
--   settings = require('lsp.servers.tailwindcss').settings,
-- }

-- lspconfig.cssls.setup {
--   capabilities = capabilities,
--   handlers = handlers,
--   on_attach = require('lsp.servers.cssls').on_attach,
--   settings = require('lsp.servers.cssls').settings,
-- }

-- lspconfig.eslint.setup {
--   capabilities = capabilities,
--   handlers = handlers,
--   on_attach = require('lsp.servers.eslint').on_attach,
--   settings = require('lsp.servers.eslint').settings,
-- }

-- -- new 

-- lspconfig.angularls.setup {
--   filetypes = require('lsp.servers.angularls').filetypes,
--   capabilities = capabilities,
--   handlers = handlers,
--   on_attach = on_attach,
--   settings = require('lsp.servers.angularls').settings,
-- }

-- lspconfig.yamlls.setup {
--   filetypes = require('lsp.servers.yamlls').filetypes,
--   capabilities = capabilities,
--   handlers = handlers,
--   on_attach = on_attach,
--   settings = require('lsp.servers.yamlls').settings,
-- }

-- lspconfig.pylsp.setup {
--   filetypes = require('lsp.servers.pylsp').filetypes,
--   capabilities = capabilities,
--   handlers = handlers,
--   on_attach = on_attach,
--   settings = require('lsp.servers.pylsp').settings,
-- }

-- lspconfig.gradle_ls.setup {
--   filetypes = require('lsp.servers.gradle_ls').filetypes,
--   capabilities = capabilities,
--   handlers = handlers,
--   on_attach = on_attach,
--   settings = require('lsp.servers.gradle_ls').settings,
-- }

-- lspconfig.dockerls.setup {
--   filetypes = require('lsp.servers.dockerls').filetypes,
--   capabilities = capabilities,
--   handlers = handlers,
--   on_attach = on_attach,
--   settings = require('lsp.servers.dockerls').settings,
-- }

-- lspconfig.jdtls.setup {
--   filetypes = require('lsp.servers.jdtls').filetypes,
--   capabilities = capabilities,
--   handlers = handlers,
--   on_attach = on_attach,
--   settings = require('lsp.servers.jdtls').settings,
-- }

-- lspconfig.marksman.setup {
--   filetypes = require('lsp.servers.marksman').filetypes,
--   capabilities = capabilities,
--   handlers = handlers,
--   on_attach = on_attach,
--   settings = require('lsp.servers.marksman').settings,
-- }

-- lspconfig.sqls.setup {
--   filetypes = require('lsp.servers.sqls').filetypes,
--   capabilities = capabilities,
--   handlers = handlers,
--   on_attach = on_attach,
--   settings = require('lsp.servers.sqls').settings,
-- }

-- lspconfig.stylelint_lsp.setup {
--   capabilities = capabilities,
--   handlers = handlers,
--   on_attach = on_attach,
--   settings = require('lsp.servers.stylelint_lsp').settings,
-- }

-- -- end new 

-- lspconfig.jsonls.setup {
--   filetypes = require('lsp.servers.jsonls').filetypes,
--   capabilities = capabilities,
--   handlers = handlers,
--   on_attach = on_attach,
--   settings = require('lsp.servers.jsonls').settings,
-- }

-- lspconfig.lua_ls.setup {
--   capabilities = capabilities,
--   handlers = handlers,
--   on_attach = on_attach,
--   settings = require('lsp.servers.lua_ls').settings,
-- }

-- lspconfig.vuels.setup {
--   filetypes = require('lsp.servers.vuels').filetypes,
--   handlers = handlers,
--   init_options = require('lsp.servers.vuels').init_options,
--   on_attach = on_attach,
-- }


-- for _, server in ipairs { "bashls", "emmet_ls", "volar", "html", "prismals" } do -- "graphql",
--   lspconfig[server].setup {
--     on_attach = on_attach,
--     capabilities = capabilities,
--     handlers = handlers,
--   }
-- end

require('ufo').setup({
  fold_virt_text_handler = ufo_config_handler,
  close_fold_kinds = { "imports" }
})
