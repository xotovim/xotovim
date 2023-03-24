-- vim.cmd('colorscheme ' .. XotoVimGlobal.colorscheme) --- Set Colorscheme

local XotoVimPrimary = "#242738";
local XotoVimPrimaryLight = "#34384f"; 
local XotoVimSecondary = "#e8ab5a";

local colors = require("config.colors")

-- if nightly
-- if vim.fn.has("nvim-0.8") then
  
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
  -- if XotoVimGlobal.colorscheme == 'xotonight' then

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
    vim.api.nvim_set_hl(0, 'CopilotSuggestion', { bg = "None", fg = colors.dark3 });

    -- misc
    vim.api.nvim_set_hl(0, 'GitSignsCurrentLineBlame', { link = 'Comment' });
    vim.api.nvim_set_hl(0, 'StatusLine', { bg = "None" });
    vim.api.nvim_set_hl(0, 'StatusLineNC', { bg = "None" });
    vim.api.nvim_set_hl(0, 'rainbowcol1', { fg = colors.blue, ctermfg = 9 });
    vim.api.nvim_set_hl(0, 'Boolean', { fg = "#F7768E" });
    vim.api.nvim_set_hl(0, 'BufferOffset', { link = 'XotoVimSecondary' });

    -- completion menu colors
    local highlights = {
      CmpItemAbbr = { fg = colors.dark3, bg = "NONE" },
      CmpItemKindClass = { fg = colors.orange },
      CmpItemKindConstructor = { fg = colors.purple },
      CmpItemKindFolder = { fg = colors.blue2 },
      CmpItemKindFunction = { fg = colors.blue },
      CmpItemKindInterface = { fg = colors.teal, bg = "NONE" },
      CmpItemKindKeyword = { fg = colors.magneta2 },
      CmpItemKindMethod = { fg = colors.red },
      CmpItemKindReference = { fg = colors.red1 },
      CmpItemKindSnippet = { fg = colors.dark3 },
      CmpItemKindVariable = { fg = colors.cyan, bg = "NONE" },
      CmpItemKindText = { fg = "LightGrey" },
      CmpItemMenu = { fg = "#C586C0", bg = "NONE" },
      CmpItemAbbrMatch = { fg = "#569CD6", bg = "NONE" },
      CmpItemAbbrMatchFuzzy = { fg = "#569CD6", bg = "NONE" },
    }

    vim.api.nvim_set_hl(0, "CmpBorderedWindow_FloatBorder", { fg = colors.blue0, bg = XotoVimPrimaryLight })

    for group, hl in pairs(highlights) do
      vim.api.nvim_set_hl(0, group, hl)
    end
-- end

