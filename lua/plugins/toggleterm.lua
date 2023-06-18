require("toggleterm").setup {
  size = function(term) 
    if term.direction == "horizontal" then return 20
    elseif term.direction == "vertical" then return vim.o.columns * 0.4 end
  end,
  open_mapping = [[<F12>]],
  on_open = function(term) require('shade').toggle(); end,
  on_close = function(term) require('shade').toggle(); end,
  highlights = {
    Normal = { link = 'Normal'},
    NormalFloat = {link = 'Normal'},
    FloatBorder = {link = 'FloatBorder' },
  },
  shade_filetypes = {},
  shade_terminals = false,
  start_in_insert = true,
  insert_mappings = true, 
  persist_size = true,
  direction = 'horizontal', 
  close_on_exit = true, 
  shell = vim.o.shell, 
  float_opts = {  border = 'single',  width = math.floor(1.0 * vim.fn.winwidth(0)), height = math.floor(0.8 * vim.fn.winheight(0)) },
  winbar = { enabled = true, },
}
function _G.set_terminal_keymaps()
  local opts = { noremap = true }
  vim.api.nvim_buf_set_keymap(0, 't', '<esc>', [[<C-\><C-n>]], opts)
  vim.api.nvim_buf_set_keymap(0, 't', '<C-h>', [[<C-\><C-n><C-W>h]], opts)
  vim.api.nvim_buf_set_keymap(0, 't', '<C-j>', [[<C-\><C-n><C-W>j]], opts)
  vim.api.nvim_buf_set_keymap(0, 't', '<C-k>', [[<C-\><C-n><C-W>k]], opts)
  vim.api.nvim_buf_set_keymap(0, 't', '<C-l>', [[<C-\><C-n><C-W>l]], opts)
end
vim.cmd('autocmd! TermOpen term://*toggleterm#* lua set_terminal_keymaps()')
