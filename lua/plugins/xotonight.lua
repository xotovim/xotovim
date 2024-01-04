require('github-theme').setup({
    options = {
        compile_path = vim.fn.stdpath('cache') .. '/github-theme',
        compile_file_suffix = '_compiled',
        hide_end_of_buffer = true,
        hide_nc_statusline = true,
        transparent = true,
        terminal_colors = true,
        dim_inactive = true,
        module_default = true,
        -- palettes = {
        --     -- Custom duskfox with black background
        --     github_dark = {
        --       bg1 = '#000000', -- Black background
        --       bg0 = '#1d1d2b', -- Alt backgrounds (floats, statusline, ...)
        --       bg3 = '#121820', -- 55% darkened from stock
        --       sel0 = '#131b24', -- 55% darkened from stock
        --     },
        --   },
        --   specs = {
        --     all = {
        --       inactive = 'bg0', -- Default value for other styles
        --     },
        --     github_dark_dimmed = {
        --       inactive = '#090909', -- Slightly lighter then black background
        --     },
        --   },
        --   groups = {
        --     all = {
        --       NormalNC = { fg = 'fg1', bg = 'inactive' }, -- Non-current windows
        --     },
        --   },
        -- styles = {
        --     comments = 'italic',
        --     keywords = 'NONE',
        --     types = 'NONE',
        --     functions = 'NONE',
        --     variables = 'NONE',
        --     conditionals = 'NONE',
        --     constants = 'NONE',
        --     numbers = 'NONE',
        --     operators = 'NONE',
        --     strings = 'NONE',
        -- },
        -- inverse = {
        --     match_paren = false,
        --     visual = false,
        --     search = false,
        -- },
        -- darken = {
        --     floats = false,
        --     sidebars = { enable = true, list = {} },
        -- },
    },
    -- palettes = {
    --     -- Custom duskfox with black background
    --     -- github_light = {
    --     --   bg1 = '#000000', -- Black background
    --     --   bg0 = '#1d1d2b', -- Alt backgrounds (floats, statusline, ...)
    --     --   bg3 = '#121820', -- 55% darkened from stock
    --     --   sel0 = '#131b24', -- 55% darkened from stock
    --     -- },
    --   },
    -- -- palettes = {},
    -- specs = {},
    -- groups = {}
})

vim.cmd('colorscheme github_light_tritanopia')

-- vim.o.termguicolors = true
-- vim.o.background = "white"
-- vim.cmd [[
--     silent! colorscheme snow
--     hi Normal guibg=#fffff
-- ]]

-- local TelescopeColor = {
-- 	TelescopeMatching = { fg = "#FFA630" },
-- 	TelescopeSelection = { fg = "#FFA630", bg = "#FFA630", bold = true },

-- 	TelescopePromptPrefix = { bg = "#FFA630" },
-- 	TelescopePromptNormal = { bg = "#FFA630" },
-- 	TelescopeResultsNormal = { bg = "#FFA630" },
-- 	TelescopePreviewNormal = { bg = "#FFA630" },
-- 	TelescopePromptBorder = { bg = "#FFA630", fg = "#FFA630" },
-- 	TelescopeResultsBorder = { bg = "#FFA630", fg = "#FFA630" },
-- 	TelescopePreviewBorder = { bg = "#FFA630", fg = "#FFA630" },
-- 	TelescopePromptTitle = { bg = "#FFA630", fg = "#FFA630" },
-- 	TelescopeResultsTitle = { fg = "#FFA630" },
-- 	TelescopePreviewTitle = { bg = "#FFA630", fg = "#FFA630" },
-- }

-- for hl, col in pairs(TelescopeColor) do
-- 	vim.api.nvim_set_hl(0, hl, col)
-- end