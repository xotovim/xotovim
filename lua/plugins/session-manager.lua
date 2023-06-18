local present, session_manager = pcall(require, "session_manager")
if not present then return end

local path_present, Path = pcall(require, "plenary.path")
if not path_present then return end

session_manager.setup({
  sessions_dir = Path:new(vim.fn.stdpath('data'), 'sessions'), 
  path_replacer = '__', 
  colon_replacer = '++', 
  autoload_mode = require('session_manager.config').AutoloadMode.Disabled, 
  autosave_last_session = true, 
  autosave_ignore_not_normal = true, 
  autosave_ignore_filetypes = { 'gitcommit', },
  autosave_only_in_session = true, 
  max_path_length = 80, 
})

local config_group = vim.api.nvim_create_augroup('SessionManagerGroup', {})

vim.api.nvim_create_autocmd({ 'User' }, {
  pattern = "SessionLoadPost",
  group = config_group,
  callback = function()
    require('nvim-tree.api').tree.toggle(false, true)
    require('notify')('session loaded!', 'info', { title = 'Session Manager' })
  end,
})

vim.api.nvim_create_autocmd({ 'User' }, {
  pattern = "SessionSavePost",
  group = config_group,
  callback = function()
    require('notify')('session saved!', 'info', { title = 'Session Manager', bufid = 0 })
    require('nvim-tree.api').tree.toggle(false, true)
  end,
})

