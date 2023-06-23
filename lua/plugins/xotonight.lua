

-- {--   "projekt0n/github-nvim-theme",--   lazy = false,--   priority = 1000,--   config = function()
    --   end,

-- local xotovimPrimary = "#242738";-- local xotovimPrimaryLight = "#34384f"; -- local xotovimSecondary = "#e8ab5a";-- local present, tokyonight = pcall(require, "github-theme")-- local colors = require("config.colors")-- if not present then return end-- local c = require("tokyonight.colors").setup()


-- Palettes are the base color defines of a colorscheme.-- You can override these palettes for each colorscheme defined by github-theme.
local palettes = {-- Everything defined under `all` will be applied to each style.
  all = {
    -- Each palette defines these colors: --black, gray, blue, green, magenta, pink, red, white, yellow, cyan---- These colors have 2 shades: base, and bright
    -- Passing a string sets the base
    -- red = '#ff0000',
    red = {
      base = '#8e1519',
      bright = '#ee0000'
    },
  },
  -- github_light = {-- Defining multiple shades is done by passing a table
  --   red = {
  --     base = '#8e1519',
  --     bright = '#ee0000'
  --   },
  -- },
--   github_light_dimmed = {-- A palette also defines the following:--   bg0, bg1, bg2, bg3, bg4, fg0, fg1, fg2, fg3, sel0, sel1, comment---- These are the different foreground and background shades used by the theme.-- The base bg and fg is 1, 0 is normally the dark alternative. The others are-- incrementally lighter versions.
-- --     bg1 = '#444c56',
-- -- -- sel is different types of selection colors.
-- -- sel0 = '#adbac7',-- Popup bg, visual selection bg
-- -- sel1 = '#22272e',-- Popup sel bg, search bg
-- -- -- comment is the definition of the comment color.
-- --     comment = '#636e7b',
--   },
}
local specs = {
  all = {
    diagnostic = {
        -- diagnostic groups (error, warning, info, hints)
    },
    syntax = {
    -- functions, types, keywords
      keyword = 'magenta', -- Adding either `.bright` will change the value
      conditional = 'magenta.bright',
      operator = 'orange',
      number = 'orange',
    },
    git = {
    -- git groups (add, removed, changed)
      changed = '#ffa261',
    },
  },
}
-- Groups are the highlight group definitions. The keys of this table are the name of the highlight-- groups that will be overridden. The value is a table with the following keys:--   - fg, bg, style, sp, link,---- Just like `spec` groups support templates. This time the template is based on a spec object.
local groups = {-- As with specs and palettes, the values defined under `all` will be applied to every style.
  all = {-- If `link` is defined it will be applied over any other values defined
    Whitespace = { link = 'Comment' },
-- Specs are used for the template. Specs have their palette's as a field that can be accessed
    IncSearch = { bg = 'palette.cyan' },
    PmenuSel = { bg = '#73daca', fg = 'bg0' },
  },
}

-- require('github-theme').setup({ palettes = palettes, specs = specs, groups = groups })


require('github-theme').setup({
  options = {
    compile_path = vim.fn.stdpath('cache') .. '/github-theme',
    compile_file_suffix = '_compiled', 
    hide_end_of_buffer = true, 
    hide_nc_statusline = true, 
    transparent = false,       
    terminal_colors = true,    
    dim_inactive = false,      
    module_default = true,     
    styles = {
      comments = 'italic',
      keywords = 'bold',
      types = 'italic,bold',
      functions = 'NONE',
      variables = 'NONE',
      conditionals = 'NONE',
      constants = 'NONE',
      numbers = 'NONE',
      operators = 'NONE',
      strings = 'NONE',
    },
    -- styles = {-- comments = 'italic',-- keywords = 'bold',-- types = 'italic,bold',--   functions = 'NONE',--   variables = 'NONE',--   conditionals = 'NONE',--   constants = 'NONE',--   numbers = 'NONE',--   operators = 'NONE',--   strings = 'NONE',-- },
    inverse = {                
      match_paren = false,
      visual = false,
      search = false,
    },
    darken = {                 
      floats = false,
      sidebars = {
        enable = true,
        list = {},             
      },
    },
    modules = {                
    },
  },
  palettes = palettes,
  specs = specs,
  groups = groups
})



-- tokyonight.setup({--   style = "night",--   transparent = false,   --   terminal_colors = true,--   styles = { comments = "NONE", keywords = "italic", functions = "NONE", variables = "NONE", sidebars = "dark",  floats = "dark",            },--   sidebars = { "qf", "help" },     --   day_brightness = 0.3,            --   hide_inactive_statusline = false,--   dim_inactive = false,            --   lualine_bold = false,            --   on_colors = function(colors) colors.border = "#1A1B26" end,--   on_highlights = function(hl, _color)--     local prompt = "#FFA630"--     local text = "#488dff"--     local none = "NONE"--     hl.TelescopeTitle = { fg = prompt, }--     hl.TelescopeNormal = { bg = none, fg = none, }--     hl.TelescopeBorder = { bg = none, fg = text, }--     hl.TelescopeMatching = { fg = prompt, }--     hl.MsgArea = { fg = c.fg_dark, }--   end,-- })
-- vim.cmd("colorscheme " .. xotovim.colorscheme)
---- if nightly---- if vim.fn.has("nvim-0.8") then
  --  -- xotovim global colors--   vim.api.nvim_set_hl(0, 'xotovimPrimary', { fg = xotovimPrimary });--   vim.api.nvim_set_hl(0, 'xotovimPrimaryLight', { fg = xotovimPrimaryLight });--   vim.api.nvim_set_hl(0, 'xotovimSecondary', { fg = xotovimSecondary });--   vim.api.nvim_set_hl(0, 'CursorLine', { bg = xotovimPrimary });
--   vim.api.nvim_set_hl(0, 'xotovimPrimaryBold', { bold = false, fg = xotovimPrimary });--   vim.api.nvim_set_hl(0, 'xotovimSecondaryBold', { bold = false, fg = xotovimSecondary });
--   vim.api.nvim_set_hl(0, 'SmoothCursor', { bg = "None", bold = false, fg = xotovimPrimaryLight });--   vim.api.nvim_set_hl(0, 'xotovimHeader', { bold = false, fg = xotovimPrimaryLight });--   vim.api.nvim_set_hl(0, 'xotovimHeaderInfo', { bold = false, fg = xotovimSecondary });--   vim.api.nvim_set_hl(0, 'xotovimFooter', { bold = false, fg = xotovimSecondary });
--  -- xotonight colorscheme override--  -- if xotovim.colorscheme == 'xotonight' then
--    -- lines--     vim.api.nvim_set_hl(0, 'CursorLineNR', { link = 'xotovimSecondary' })--     vim.api.nvim_set_hl(0, 'LineNr', { link = 'Comment' })
--    -- floats/windows--     vim.api.nvim_set_hl(0, 'NormalFloat', { bg = "None", fg = "None" });--     vim.api.nvim_set_hl(0, 'RegistersWindow', { bg = "None", fg = "None" });--     vim.api.nvim_set_hl(0, 'FloatBorder', { bg = "None", fg = xotovimPrimaryLight });--     vim.api.nvim_set_hl(0, 'NotifyBackground', { bg = xotovimPrimaryLight, fg = "None" });--     vim.api.nvim_set_hl(0, 'WhichKeyFloat', { bg = "None", fg = xotovimPrimary });--     vim.api.nvim_set_hl(0, 'BufferTabpageFill', { fg = "None" });--     vim.api.nvim_set_hl(0, 'VertSplit', { bg = "None", fg = xotovimPrimary });--     vim.api.nvim_set_hl(0, 'BqfPreviewBorder', { link = 'FloatBorder' })
--    -- telescope--     vim.api.nvim_set_hl(0, 'TelescopeTitle', { link = 'xotovimSecondary' });--     vim.api.nvim_set_hl(0, 'TelescopeNormal', { bg =  "None" , fg = "None" });--     vim.api.nvim_set_hl(0, 'TelescopeBorder', { bg = "None", fg = xotovimPrimaryLight });--     vim.api.nvim_set_hl(0, 'TelescopeSelection', { bg = xotovimPrimary, fg = "None" });--     vim.api.nvim_set_hl(0, 'TelescopeMatching', { link = 'xotovimSecondary' });
--    -- autopilot--     vim.api.nvim_set_hl(0, 'CopilotSuggestion', { bg = "None", fg = colors.dark3 });
--    -- misc--     vim.api.nvim_set_hl(0, 'GitSignsCurrentLineBlame', { link = 'Comment' });--     vim.api.nvim_set_hl(0, 'StatusLine', { bg = "None" });--     vim.api.nvim_set_hl(0, 'StatusLineNC', { bg = "None" });--     vim.api.nvim_set_hl(0, 'rainbowcol1', { fg = colors.blue, ctermfg = 9 });--     vim.api.nvim_set_hl(0, 'Boolean', { fg = "#F7768E" });--     vim.api.nvim_set_hl(0, 'BufferOffset', { link = 'xotovimSecondary' });
--    ---- completion menu colors--    -- local highlights = {--    --   CmpItemAbbr = { fg = colors.dark3, bg = "NONE" },--    --   CmpItemKindClass = { fg = colors.orange },--    --   CmpItemKindConstructor = { fg = colors.purple },--    --   CmpItemKindFolder = { fg = colors.blue2 },--    --   CmpItemKindFunction = { fg = colors.blue },--    --   CmpItemKindInterface = { fg = colors.teal, bg = "NONE" },--    --   CmpItemKindKeyword = { fg = colors.magneta2 },--    --   CmpItemKindMethod = { fg = colors.red },--    --   CmpItemKindReference = { fg = colors.red1 },--    --   CmpItemKindSnippet = { fg = colors.dark3 },--    --   CmpItemKindVariable = { fg = colors.cyan, bg = "NONE" },--    --   CmpItemKindText = { fg = "LightGrey" },--    --   CmpItemMenu = { fg = "#C586C0", bg = "NONE" },--    --   CmpItemAbbrMatch = { fg = "#569CD6", bg = "NONE" },--    --   CmpItemAbbrMatchFuzzy = { fg = "#569CD6", bg = "NONE" },--    -- }
--     vim.api.nvim_set_hl(0, "CmpBorderedWindow_FloatBorder", { fg = colors.blue0, bg = xotovimPrimaryLight })
--    -- for group, hl in pairs(highlights) do--    --   vim.api.nvim_set_hl(0, group, hl)--    -- end
---- vim.api.nvim_set_hl(0, "EcovimPrim---- end
