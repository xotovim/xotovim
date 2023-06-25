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
        styles = {
            comments = 'italic',
            keywords = 'NONE',
            types = 'NONE',
            functions = 'NONE',
            variables = 'NONE',
            conditionals = 'NONE',
            constants = 'NONE',
            numbers = 'NONE',
            operators = 'NONE',
            strings = 'NONE',
        },
        inverse = {
            match_paren = false,
            visual = false,
            search = false,
        },
        darken = {
            floats = false,
            sidebars = { enable = true, list = {} },
        },
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

vim.cmd('colorscheme github_light')

-- vim.cmd([[colorscheme github_light]]) 