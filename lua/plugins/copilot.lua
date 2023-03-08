-- vim.g.copilot_tab_fallback = ""
-- vim.g.copilot_assume_mapped = true
-- vim.g.copilot_no_tab_map = true
-- vim.api.nvim_set_keymap("i", "<C-J>", 'copilot#Accept("<CR>")', { silent = true, expr = true })

return {
  
  -- formatters = {
  --   label = require("copilot_cmp.format").format_label_text,
  --   insert_text = require("copilot_cmp.format").format_insert_text,
  --   preview = require("copilot_cmp.format").deindent,
  -- },
  
  panel = {
    enabled = true,
    auto_refresh = true,
    keymap = {
      jump_prev = "[[",
      jump_next = "]]",
      accept = "<CR>",
      refresh = "gr",
      open = "<M-CR>"
    },
    layout = {
      position = "bottom", -- | top | left | right
      ratio = 0.4
    },
  },
  suggestion = {
    enabled = true,
    auto_trigger = true,
    debounce = 75,
    keymap = {
      accept = "<M-l>",
      accept_word = true,
      accept_line = true,
      next = "<M-]>",
      prev = "<M-[>",
      dismiss = "<C-]>",
    },
  },
  filetypes = {
	javascript = true, -- allow specific filetype
  typescript = true, -- allow specific filetype
  -- ["*"] = false, -- disable for all other filetypes and ignore default `filetypes`
    yaml = false,
    markdown = false,
    help = false,
    gitcommit = false,
    gitrebase = false,
    hgcommit = false,
    svn = false,
    cvs = false,
    ["."] = false,
  },
  copilot_node_command = 'node', -- Node.js version must be > 16.x
  -- server_opts_overrides = {
	-- trace = "verbose",
    -- settings = {
    --   advanced = {
    --     listCount = 10, -- #completions for panel
    --     inlineSuggestCount = 3, -- #completions for getCompletions
    --   }
	-- }
  -- },
}

-- require("copilot.panel").accept()
-- require("copilot.panel").jump_next()
-- require("copilot.panel").jump_prev()
-- require("copilot.panel").open({postion, ratio})
-- require("copilot.panel").refresh()

-- mp.event:on("menu_opened", function()
--   vim.b.copilot_suggestion_hidden = true
-- end)

-- cmp.event:on("menu_closed", function()
--   vim.b.copilot_suggestion_hidden = false
-- end)

-- require("copilot.suggestion").is_visible()
-- require("copilot.suggestion").accept()
-- require("copilot.suggestion").accept_word()
-- require("copilot.suggestion").accept_line()
-- require("copilot.suggestion").next()
-- require("copilot.suggestion").prev()
-- require("copilot.suggestion").dismiss()
-- require("copilot.suggestion").toggle_auto_trigger()