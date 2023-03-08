local present, xotonight = pcall(require, "xotonight")
if not present then
  return
end

-- change this to colors
local xotoColor = require("xotonight.colors")

-- xotovim primaries
local xotoBorder = "#34384f";
local XotoVimPrimary = "#242738";
local XotoVimPrimaryLight = "#34384f";
local XotoVimSecondary = "#e8ab5a";

-- local util = require("xotonight.util")
-- local theme = require("xotonight.theme")

-- util.load(theme.setup())

xotonight.setup({
  style = "night",

  transparent = true, -- Enable this to disable setting the background color
  terminal_colors = true, -- Configure the colors used when opening a `:terminal` in Neovim
  light_style = "day", -- The theme is used when the background is set to light

  styles = {
    -- Style to be applied to different syntax groups
    -- Value is any valid attr-list value `:help attr-list`
    comments = { italic = true },
    keywords = { italic = true },
    functions = {},
    variables = {},
    -- Background styles. Can be "dark", "transparent" or "normal"
    sidebars = "dark", -- style for sidebars, see below
    floats = "transparent", -- style for floating windows
  },
  use_background = auto, -- can be light/dark/auto. When auto, background will be set to vim.o.background
  sidebars = { "qf", "vista_kind", "terminal", "spectre_panel", "NeogitStatus", "help" }, -- set a darker background on sidebar-like windows. For example: `["qf", "vista_kind", "terminal", "packer"]`
  day_brightness = 0.3, -- Adjusts the brightness of the colors of the **Day** style. Number between 0 and 1, from dull to vibrant colors
  hide_inactive_statusline = false, -- Enabling this option, will hide inactive statuslines and replace them with a thin border instead. Should work with the standard **StatusLine** and **LuaLine**.
  dim_inactive = true, -- dims inactive windows
  lualine_bold = false, -- When `true`, section headers in the lualine theme will be bold

  --- You can override specific color groups to use other groups or a hex color
  --- function will be called with a ColorScheme table
    on_colors = function(xotoGroupColor)
      xotoGroupColor.hint = xotoGroupColor.orange
      -- xotoGroupColor.error = "#ff0000"
      xotoGroupColor.border = xotoBorder
    end,
  
    --- You can override specific highlights to use other groups or a hex color
    --- fucntion will be called with a Highlights and ColorScheme table
    -- on_highlights = function(highlights, colors) end,
    on_highlights = function(hl, xotoColor)
      local prompt = "#FFA630"
      local text = "#488dff"
      local none = "NONE"
  
      hl.IndentBlanklineContextChar = { fg = xotoColor.dark5}
      hl.TSConstructor = {fg = xotoColor.blue1}
      hl.TSTagDelimiter = {fg = xotoColor.dark5}
  
      hl.TelescopeTitle = { fg = prompt, }
      hl.TelescopeNormal = { bg = none, fg = none, }
      hl.TelescopeBorder = { bg = none, fg = text }
      hl.TelescopeMatching = { fg = prompt }
      hl.MsgArea = { fg = xotoColor.fg_dark }
    end,
})

-- ╭──────────────────────────────────────────────────────────╮
-- │ setup colorscheme                                        │
-- ╰──────────────────────────────────────────────────────────╯

-- vim.cmd('colorscheme ' .. XotoVimGlobal.colorscheme) -- Set Colorscheme

-- if nightly
if vim.fn.has("nvim-0.8") then

  -- xotovim global colors
  vim.api.nvim_set_hl(0, 'XotoVimPrimary', { fg = XotoVimPrimary });
  vim.api.nvim_set_hl(0, 'XotoVimPrimaryLight', { fg = XotoVimPrimaryLight });
  vim.api.nvim_set_hl(0, 'XotoVimSecondary', { fg = XotoVimSecondary });
  vim.api.nvim_set_hl(0, 'CursorLine', { bg = XotoVimPrimary });

  vim.api.nvim_set_hl(0, 'XotoVimPrimaryBold', { bold = true, fg = XotoVimPrimary });
  vim.api.nvim_set_hl(0, 'XotoVimSecondaryBold', { bold = true, fg = XotoVimSecondary });

  vim.api.nvim_set_hl(0, 'XotoVimHeader', { bold = true, fg = XotoVimPrimaryLight });
  vim.api.nvim_set_hl(0, 'XotoVimHeaderInfo', { bold = true, fg = XotoVimSecondary });
  vim.api.nvim_set_hl(0, 'XotoVimFooter', { bold = true, fg = XotoVimSecondary });

  -- xotonight colorscheme override
  if XotoVimGlobal.colorscheme == 'xotonight' then

    -- lines
    vim.api.nvim_set_hl(0, 'CursorLineNR', { link = 'XotoVimSecondary' })
    vim.api.nvim_set_hl(0, 'LineNr', { link = 'Comment' })

    -- floats/windows
    vim.api.nvim_set_hl(0, 'NormalFloat', { bg = "None", fg = "None" });
    vim.api.nvim_set_hl(0, 'RegistersWindow', { bg = "None", fg = "None" });
    vim.api.nvim_set_hl(0, 'FloatBorder', { bg = "None", fg = XotoVimPrimaryLight });
    vim.api.nvim_set_hl(0, 'NotifyBackground', { bg = XotoVimPrimaryLight, fg = "None" });
    vim.api.nvim_set_hl(0, 'WhichKeyFloat', { bg = "None", fg = XotoVimPrimary });
    vim.api.nvim_set_hl(0, 'BufferTabpageFill', { fg = "None" });
    vim.api.nvim_set_hl(0, 'VertSplit', { bg = "None", fg = XotoVimPrimary });
    vim.api.nvim_set_hl(0, 'BqfPreviewBorder', { link = 'FloatBorder' })

    -- telescope
    vim.api.nvim_set_hl(0, 'TelescopeTitle', { link = 'XotoVimSecondary' });
    vim.api.nvim_set_hl(0, 'TelescopeNormal', { bg =  "None" , fg = "None" });
    vim.api.nvim_set_hl(0, 'TelescopeBorder', { bg = "None", fg = XotoVimPrimaryLight });
    vim.api.nvim_set_hl(0, 'TelescopeSelection', { bg = XotoVimPrimary, fg = "None" });
    vim.api.nvim_set_hl(0, 'TelescopeMatching', { link = 'XotoVimSecondary' });

    -- autopilot
    vim.api.nvim_set_hl(0, 'CopilotSuggestion', { bg = "None", fg = xotoColor.dark3 });

    -- misc
    vim.api.nvim_set_hl(0, 'GitSignsCurrentLineBlame', { link = 'Comment' });
    vim.api.nvim_set_hl(0, 'StatusLine', { bg = "None" });
    vim.api.nvim_set_hl(0, 'StatusLineNC', { bg = "None" });
    vim.api.nvim_set_hl(0, 'rainbowcol1', { fg = xotoColor.blue, ctermfg = 9 });
    vim.api.nvim_set_hl(0, 'Boolean', { fg = "#F7768E" });
    vim.api.nvim_set_hl(0, 'BufferOffset', { link = 'XotoVimSecondary' });

    -- completion menu colors
    local highlights = {
      CmpItemAbbr = { fg = xotoColor.dark3, bg = "NONE" },
      CmpItemKindClass = { fg = xotoColor.orange },
      CmpItemKindConstructor = { fg = xotoColor.purple },
      CmpItemKindFolder = { fg = xotoColor.blue2 },
      CmpItemKindFunction = { fg = xotoColor.blue },
      CmpItemKindInterface = { fg = xotoColor.teal, bg = "NONE" },
      CmpItemKindKeyword = { fg = xotoColor.magneta2 },
      CmpItemKindMethod = { fg = xotoColor.red },
      CmpItemKindReference = { fg = xotoColor.red1 },
      CmpItemKindSnippet = { fg = xotoColor.dark3 },
      CmpItemKindVariable = { fg = xotoColor.cyan, bg = "NONE" },
      CmpItemKindText = { fg = "LightGrey" },
      CmpItemMenu = { fg = "#C586C0", bg = "NONE" },
      CmpItemAbbrMatch = { fg = "#569CD6", bg = "NONE" },
      CmpItemAbbrMatchFuzzy = { fg = "#569CD6", bg = "NONE" },
    }

    vim.api.nvim_set_hl(0, "CmpBorderedWindow_FloatBorder", { fg = xotoColor.blue0, bg = XotoVimPrimaryLight })

    for group, hl in pairs(highlights) do
      vim.api.nvim_set_hl(0, group, hl)
    end
  end
end
