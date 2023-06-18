local xotovimPrimary = "#242738";
local xotovimPrimaryLight = "#34384f"; 
local xotovimSecondary = "#e8ab5a";
local present, tokyonight = pcall(require, "tokyonight")
local colors = require("config.colors")
if not present then return end
local c = require("tokyonight.colors").setup()

tokyonight.setup({
  style = "night",
  transparent = false,   
  terminal_colors = true,
  styles = { comments = "NONE", keywords = "italic", functions = "NONE", variables = "NONE", sidebars = "dark",  floats = "dark",            },
  sidebars = { "qf", "help" },     
  day_brightness = 0.3,            
  hide_inactive_statusline = false,
  dim_inactive = false,            
  lualine_bold = false,            
  on_colors = function(colors) colors.border = "#1A1B26" end,
  on_highlights = function(hl, _color)
    local prompt = "#FFA630"
    local text = "#488dff"
    local none = "NONE"
    hl.TelescopeTitle = { fg = prompt, }
    hl.TelescopeNormal = { bg = none, fg = none, }
    hl.TelescopeBorder = { bg = none, fg = text, }
    hl.TelescopeMatching = { fg = prompt, }
    hl.MsgArea = { fg = c.fg_dark, }
  end,
})

vim.cmd("colorscheme " .. xotovim.colorscheme)

-- if nightly
-- if vim.fn.has("nvim-0.8") then
  
  -- xotovim global colors
  vim.api.nvim_set_hl(0, 'xotovimPrimary', { fg = xotovimPrimary });
  vim.api.nvim_set_hl(0, 'xotovimPrimaryLight', { fg = xotovimPrimaryLight });
  vim.api.nvim_set_hl(0, 'xotovimSecondary', { fg = xotovimSecondary });
  vim.api.nvim_set_hl(0, 'CursorLine', { bg = xotovimPrimary });

  vim.api.nvim_set_hl(0, 'xotovimPrimaryBold', { bold = false, fg = xotovimPrimary });
  vim.api.nvim_set_hl(0, 'xotovimSecondaryBold', { bold = false, fg = xotovimSecondary });

  vim.api.nvim_set_hl(0, 'SmoothCursor', { bg = "None", bold = false, fg = xotovimPrimaryLight });
  vim.api.nvim_set_hl(0, 'xotovimHeader', { bold = false, fg = xotovimPrimaryLight });
  vim.api.nvim_set_hl(0, 'xotovimHeaderInfo', { bold = false, fg = xotovimSecondary });
  vim.api.nvim_set_hl(0, 'xotovimFooter', { bold = false, fg = xotovimSecondary });

  -- xotonight colorscheme override
  -- if xotovim.colorscheme == 'xotonight' then

    -- lines
    vim.api.nvim_set_hl(0, 'CursorLineNR', { link = 'xotovimSecondary' })
    vim.api.nvim_set_hl(0, 'LineNr', { link = 'Comment' })

    -- floats/windows
    vim.api.nvim_set_hl(0, 'NormalFloat', { bg = "None", fg = "None" });
    vim.api.nvim_set_hl(0, 'RegistersWindow', { bg = "None", fg = "None" });
    vim.api.nvim_set_hl(0, 'FloatBorder', { bg = "None", fg = xotovimPrimaryLight });
    vim.api.nvim_set_hl(0, 'NotifyBackground', { bg = xotovimPrimaryLight, fg = "None" });
    vim.api.nvim_set_hl(0, 'WhichKeyFloat', { bg = "None", fg = xotovimPrimary });
    vim.api.nvim_set_hl(0, 'BufferTabpageFill', { fg = "None" });
    vim.api.nvim_set_hl(0, 'VertSplit', { bg = "None", fg = xotovimPrimary });
    vim.api.nvim_set_hl(0, 'BqfPreviewBorder', { link = 'FloatBorder' })

    -- telescope
    vim.api.nvim_set_hl(0, 'TelescopeTitle', { link = 'xotovimSecondary' });
    vim.api.nvim_set_hl(0, 'TelescopeNormal', { bg =  "None" , fg = "None" });
    vim.api.nvim_set_hl(0, 'TelescopeBorder', { bg = "None", fg = xotovimPrimaryLight });
    vim.api.nvim_set_hl(0, 'TelescopeSelection', { bg = xotovimPrimary, fg = "None" });
    vim.api.nvim_set_hl(0, 'TelescopeMatching', { link = 'xotovimSecondary' });

    -- autopilot
    vim.api.nvim_set_hl(0, 'CopilotSuggestion', { bg = "None", fg = colors.dark3 });

    -- misc
    vim.api.nvim_set_hl(0, 'GitSignsCurrentLineBlame', { link = 'Comment' });
    vim.api.nvim_set_hl(0, 'StatusLine', { bg = "None" });
    vim.api.nvim_set_hl(0, 'StatusLineNC', { bg = "None" });
    vim.api.nvim_set_hl(0, 'rainbowcol1', { fg = colors.blue, ctermfg = 9 });
    vim.api.nvim_set_hl(0, 'Boolean', { fg = "#F7768E" });
    vim.api.nvim_set_hl(0, 'BufferOffset', { link = 'xotovimSecondary' });

    -- -- completion menu colors
    -- local highlights = {
    --   CmpItemAbbr = { fg = colors.dark3, bg = "NONE" },
    --   CmpItemKindClass = { fg = colors.orange },
    --   CmpItemKindConstructor = { fg = colors.purple },
    --   CmpItemKindFolder = { fg = colors.blue2 },
    --   CmpItemKindFunction = { fg = colors.blue },
    --   CmpItemKindInterface = { fg = colors.teal, bg = "NONE" },
    --   CmpItemKindKeyword = { fg = colors.magneta2 },
    --   CmpItemKindMethod = { fg = colors.red },
    --   CmpItemKindReference = { fg = colors.red1 },
    --   CmpItemKindSnippet = { fg = colors.dark3 },
    --   CmpItemKindVariable = { fg = colors.cyan, bg = "NONE" },
    --   CmpItemKindText = { fg = "LightGrey" },
    --   CmpItemMenu = { fg = "#C586C0", bg = "NONE" },
    --   CmpItemAbbrMatch = { fg = "#569CD6", bg = "NONE" },
    --   CmpItemAbbrMatchFuzzy = { fg = "#569CD6", bg = "NONE" },
    -- }

    vim.api.nvim_set_hl(0, "CmpBorderedWindow_FloatBorder", { fg = colors.blue0, bg = xotovimPrimaryLight })

    -- for group, hl in pairs(highlights) do
    --   vim.api.nvim_set_hl(0, group, hl)
    -- end

-- vim.api.nvim_set_hl(0, "EcovimPrim
-- end
