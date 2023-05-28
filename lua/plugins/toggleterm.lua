require("toggleterm").setup {
  -- size can be a number or function which is passed the current terminal
  size = function(term)
    if term.direction == "horizontal" then
      return 20
    elseif term.direction == "vertical" then
      return vim.o.columns * 0.4
    end
  end,
  open_mapping = [[<F12>]],
  ---@diagnostic disable-next-line: unused-local
  on_open = function(term)
    require('shade').toggle();
  end,
  ---@diagnostic disable-next-line: unused-local
  on_close = function(term)
    require('shade').toggle();
  end,
  highlights = {
    -- highlights which map to a highlight group name and a table of it's values -- NOTE: this is only a subset of values, any group placed here will be set for the terminal window split
    Normal = { link = 'Normal'},
    NormalFloat = {link = 'Normal'},
    -- guifg = <VALUE-HERE>, -- guibg = <VALUE-HERE>,
    FloatBorder = {link = 'FloatBorder' },
  },

  shade_filetypes = {},
  shade_terminals = false,
  -- shading_factor = 1, -- the degree by which to darken to terminal colour, default: 1 for dark backgrounds, 3 for light
  start_in_insert = true,
  insert_mappings = true, -- whether or not the open mapping applies in insert mode
  persist_size = true,
  direction = 'horizontal', -- | 'horizontal' | 'window' | 'float',
  close_on_exit = true, -- close the terminal window when the process exits
  shell = vim.o.shell, -- change the default shell

  float_opts = { 
    border = 'single', -- single/double/shadow/curved -- The border key is *almost* the same as 'nvim_win_open' -- see :h nvim_win_open for details on borders however -- the 'curved' border is a custom border type -- not natively supported but implemented in this plugin.
    width = math.floor(1.0 * vim.fn.winwidth(0)),
    height = math.floor(0.8 * vim.fn.winheight(0))
  },
  winbar = {
    enabled = true,
  },
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
