local options = {
  clipboard      = "unnamed,unnamedplus", --- copy-paste between vim and everything else
  cmdheight      = 2, --- give more space for displaying messages
  completeopt    = "menu,menuone,noselect", --- better autocompletion
  cursorline     = true, --- highlight of current line
  emoji          = false, --- fix emoji display
  expandtab      = true, --- use spaces instead of tabs
  foldcolumn     = "0",
  foldnestmax    = 0,
  foldlevel      = 99, --- using ufo provider need a large value
  foldlevelstart = 99, --- expand all folds by default
  ignorecase     = true, --- needed for smartcase
  laststatus     = 3, --- have a global statusline at the bottom instead of one for each window
  -- lazyredraw     = true, --- makes macros faster & prevent errors in complicated mappings
  foldenable     = false, --- makes macros faster & prevent errors in complicated mappings
  mouse          = "a", --- enable mouse
  number         = true, --- shows current line number
  pumheight      = 12, --- max num of items in completion menu
  relativenumber = false, --- enables relative number
  scrolloff      = 8, --- always keep space when scrolling to bottom/top edge
  shiftwidth     = 2, --- change a number of space characeters inseted for indentation
  showtabline    = 2, --- always show tabs
  signcolumn     = "yes:1", --- add extra sign column next to line number
  smartcase      = true, --- uses case in search
  smartindent    = true, --- makes indenting smart
  smarttab       = true, --- makes tabbing smarter will realize you have 2 vs 4
  softtabstop    = 2, --- insert 2 spaces for a tab
  splitbelow     = true, -- Splitting a new window below the current one
  virtualedit    = "onemore",
  numberwidth    = 5,
  splitright     = true, --- vertical splits will automatically be to the right
  swapfile       = false, --- swap not needed
  tabstop        = 2, --- insert 2 spaces for a tab
  termguicolors  = true, --- correct terminal colors
  timeoutlen     = 200, --- faster completion (cannot be lower than 200 because then commenting doesn't work)
  undofile       = true, --- sets undo to file
  updatetime     = 100, --- faster completion
  viminfo        = "'1000", --- increase the size of file history
  wildignore     = "*node_modules/**", --- don't search inside node.js modules (works for gutentag)
  wrap           = true, --- display long lines as just one line
  writebackup    = false, --- not needed
  spelllang      = "en", -- Support US english
  hidden         = true, -- Ignore unsaved buffers
  hlsearch       = true, -- Highlight all the matches of search patternhlsearch = true -- Highlight all the matches of search pattern
  -- neovim defaults
  autoindent     = true, --- good auto indent
  backspace      = "indent,eol,start", --- making sure backspace works
  backup         = false, --- recommended by coc
  conceallevel   = 0, --- show `` in markdown files
  encoding       = "utf-8", --- the encoding displayed
  errorbells     = false, --- disables sound effect for errors
  fileencoding   = "utf-8", --- the encoding written to file
  incsearch      = true, --- start searching before pressing enter
  showmode       = false, --- don't show things like insert anymore
}

local globals = {
  mapleader                   = " ", --- map leader key to spc
  speeddating_no_mappings     = 1, --- disable default mappings for speeddating
}

vim.opt.shortmess:append('c');

-- reset cursor 
-- vim.cmd
-- [[
--     augroup change_cursor
--         au!
--         au ExitPre * :set guicursor=a:ver90
--         au ExitPre * hi Cursor guibg=green
        
--     augroup END
-- ]] 

-- vim.cmd
-- [[
--     augroup change_cursor
--       au!
--       autocmd ExitPre silent echo -ne "\033]12;red\007"
--     augroup END
-- ]] 

-- vim.cmd
-- [[
--     augroup change_cursor
--         au!
--         au ExitPre * :set guicursor=a:ver90
--     augroup END
-- ]] 
-- vim.cmd[[ augroup myCmds au! au ExitPre * silent echo -ne '\e[1 q' augroup END ]] 
-- vim.cmd[[ augroup myCmds au! au EnterPre * silent echo -ne '\e[5 q' augroup END ]] 

-- au EnterPre * silent echo -ne '\e[1 q'

-- vim.cmd("autocmd VimEnter * silent exec "! echo -ne '\e[1 q'")
-- vim.cmd("autocmd VimLeave * silent exec "! echo -ne '\e[5 q'") 
-- vim.cmd("autocmd BufEnter * set formatoptions-=cro")
-- vim.cmd("autocmd BufEnter * setlocal formatoptions-=cro")
-- vim.opt.formatoptions:remove('c');
-- vim.opt.formatoptions:remove('r');
-- vim.opt.formatoptions:remove('o');

-- -- Change aspect if in insert mode or not
-- vim.cmd('highlight Cursorline cterm=NONE gui=NONE guibg=NONE')
-- vim.cmd('autocmd InsertEnter * highlight Cursorline cterm=underline gui=underline')
-- vim.cmd('autocmd InsertLeave * highlight Cursorline cterm=NONE gui=NONE')

vim.api.nvim_create_autocmd("BufEnter", {  callback = function()  vim.opt.formatoptions = vim.opt.formatoptions - { "c","r","o" }  end,  })
vim.api.nvim_create_autocmd("ExitPre", {  callback = function()  vim.opt.guicursor = "a:ver90" end,  })
vim.opt.fillchars:append('stl: ');
vim.opt.fillchars:append('eob: ');
vim.opt.fillchars:append('fold: ');
vim.opt.fillchars:append('foldopen: ');
vim.opt.fillchars:append('foldsep: ');
vim.opt.fillchars:append('foldclose:');
for k, v in pairs(options) do vim.opt[k] = v end
for k, v in pairs(globals) do vim.g[k] = v end
