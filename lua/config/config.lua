------------------------------------------------
--                                            --
--    This is a main configuation file for    --
--                    XotoVim                  --
--      Change variables which you need to    --
--                                            --
------------------------------------------------

local icons = require('icons')
-- local icons = require("utils.icons")


XotoVimGlobal = {
  colorscheme = 'xotonight',
  -- none, single, double, shadow, rounded
  ui = { float = { border = 'single' } },

  plugins = {
    completion = { select_first_on_enter = false },

    rooter = {
      -- 'package.json''_darcs', '.bzr', '.svn', 'Makefile'} removing package.json from list in Monorepo Frontend Project can be helpful by that your live_grep will work related to whole project, not specific package
      patterns = {'.git'} -- Default
    },
    copilot = {
      enabled = true,
    },

    zen = { kitty_enabled = false, enabled = true, },
  },

  icons = icons,

  statusline = {
    path_enabled = true,
    path = 'relative' -- absolute/relative
  },

  lsp = {
    
    
    -- keep off so it wont override other configurations
    virtual_text = false, -- show virtual text (errors, warnings, info) inline messages
    virtual_lines = { only_current_line = true }
    -- virtual_lines = true, -- show virtual text (errors, warnings, info) inline messages
  },
}

