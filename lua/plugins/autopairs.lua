require('nvim-autopairs').setup({
  check_ts = true,
  active = true,
  on_config_done = nil,
  enable_check_bracket_line = true,
  map_char = { all = "(", tex = "{" },
  ts_config = { lua = { "string", "source" }, javascript = { "string", "template_string" }, java = false },
  disable_filetype = { "TelescopePrompt", "spectre_panel" },
  ignored_next_char = string.gsub([[ [%w%%%'%[%"%.] ]], "%s+", ""),
  enable_moveright = true, ---@usage disable when recording or executing a macro
  disable_in_macro = false, ---@usage add bracket pairs after quote
  enable_afterquote = true, ---@usage map the <BS> key
  map_bs = true, ---@usage map <c-w> to delete a pair if possible
  map_c_w = false, ---@usage disable when insert after visual block mode
  disable_in_visualblock = false, ---@usage  change default fast_wrap

  fast_wrap = {
    map = "<M-e>",
    chars = { "{", "[", "(", '"', "'", "`" },
    pattern = string.gsub([[ [%'%"%)%>%]%)%}%,] ]], "%s+", ""),
    offset = 0, -- offset from pattern match
    end_key = "$",
    keys = "qwertyuiopzxcvbnmasdfghjkl",
    check_comma = true,
    highlight = "Search",
    highlight_grey = "Comment",
  },
})

local cmp_autopairs = require('nvim-autopairs.completion.cmp')
local cmp = require('cmp')
cmp.event:on('confirm_done', cmp_autopairs.on_confirm_done({ map_char = { tex = '' } }))
