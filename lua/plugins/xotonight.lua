
local present, xotonight = pcall(require, "xotonight")
if not present then
  return
end

-- change this to colors
local colors = require("config.colors")

-- local util = require("xotonight.util")
-- local theme = require("xotonight.theme")

-- util.load(theme.setup())

xotonight.setup({
  style = "night",
  transparent = true, --- Enable this to disable setting the background color
  terminal_colors = true, --- Configure the colors used when opening a `:terminal` in Neovim

  styles = {
    --- Style to be applied to different syntax groups
    --- Value is any valid attr-list value `:help attr-list`
    comments = { italic = true },
    keywords = { italic = true },
    functions = {},
    variables = {},
    --- Background styles. Can be "dark", "transparent" or "normal"
    sidebars = "dark", --- style for sidebars, see below
    floats = "transparent", --- style for floating windows
  },
  use_background = auto, --- can be light/dark/auto. When auto, background will be set to vim.o.background
  sidebars = { "qf", "vista_kind", "terminal", "spectre_panel", "NeogitStatus", "help" }, --- set a darker background on sidebar-like windows. For example: `["qf", "vista_kind", "terminal", "packer"]`
  day_brightness = 0.3, --- Adjusts the brightness of the colors of the **Day** style. Number between 0 and 1, from dull to vibrant colors
  hide_inactive_statusline = false, --- Enabling this option, will hide inactive statuslines and replace them with a thin border instead. Should work with the standard **StatusLine** and **LuaLine**.
  dim_inactive = true, --- dims inactive windows
  lualine_bold = false, --- When `true`, section headers in the lualine theme will be bold

  --- You can override specific color groups to use other groups or a hex color
  --- function will be called with a ColorScheme table
    on_colors = function(xotoGroupColor)
      -- xotoGroupColor.hint = xotoGroupColor.orange
      --- xotoGroupColor.error = "#ff0000"
      xotoGroupColor.border = "#34384f"
    end,
  
    --- You can override specific highlights to use other groups or a hex color
    --- fucntion will be called with a Highlights and ColorScheme table
    --- on_highlights = function(highlights, colors) end,
    on_highlights = function(hl, colors)
      local prompt = "#FFA630"
      local text = "#488dff"
      local none = "NONE"
  
      hl.IndentBlanklineContextChar = { fg = colors.dark5}
      hl.TSConstructor = {fg = colors.blue1}
      hl.TSTagDelimiter = {fg = colors.dark5}
  
      hl.TelescopeTitle = { fg = prompt, }
      hl.TelescopeNormal = { bg = none, fg = none, }
      hl.TelescopeBorder = { bg = none, fg = text }
      hl.TelescopeMatching = { fg = prompt }
      hl.MsgArea = { fg = colors.fg_dark }
    end,
})

-- ╭──────────────────────────────────────────────────────────╮
-- │ setup colorscheme                                        │
-- ╰──────────────────────────────────────────────────────────╯

-- 