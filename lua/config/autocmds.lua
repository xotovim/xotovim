-- Auto sync plugins on save of plugins.lua
vim.api.nvim_create_autocmd("BufWritePost", { pattern = "plugins.lua", command = "source <afile> | PackerSync" })

vim.api.nvim_create_autocmd("TextYankPost", { callback = function() vim.highlight.on_yank({ higroup = 'IncSearch', timeout = 100 }) end })
vim.api.nvim_create_autocmd("BufRead", { pattern = "*/node_modules/*", command = "lua vim.diagnostic.disable(0)" })
vim.api.nvim_create_autocmd("BufNewFile", { pattern = "*/node_modules/*", command = "lua vim.diagnostic.disable(0)" })
vim.api.nvim_create_autocmd({ "BufRead", "BufNewFile" }, { pattern = { "*.txt", "*.md", "*.tex" }, command = "setlocal spell" })

local present, _ = pcall(require, "which-key")
if not present then return end

local _, pwk = pcall(require, "plugins.which-key")

vim.api.nvim_create_autocmd("BufEnter", { pattern = "*.md", callback = function() pwk.attach_markdown(0) end })
vim.api.nvim_create_autocmd("BufEnter", { pattern = { "*.ts", "*.tsx" }, callback = function() pwk.attach_typescript(0) end })
vim.api.nvim_create_autocmd("BufEnter", { pattern = { "package.json" }, callback = function() pwk.attach_npm(0) end })
vim.api.nvim_create_autocmd("FileType", { pattern = "*", callback = function() if xotovim.plugins.zen.enabled and vim.bo.filetype ~= "alpha" then pwk.attach_zen(0) end end })
vim.api.nvim_create_autocmd("BufEnter", { pattern = { "*test.js", "*test.ts", "*test.tsx" }, callback = function() pwk.attach_jest(0) end })
vim.api.nvim_create_autocmd("FileType", { pattern = "spectre_panel", callback = function() pwk.attach_spectre(0) end })
vim.api.nvim_create_autocmd("FileType", { pattern = "NvimTree", callback = function() pwk.attach_nvim_tree(0) end })
