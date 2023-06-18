------------------------------------------------
------------------------------------------------
local icons = require("utils.icons")
xotovim = {
	colorscheme = "tokyonight",
	ui = {
		float = { border = "single", },
	},
	plugins = {
		ai = { chatgpt = { enabled = true, }, codeium = { enabled = true, }, copilot = { enabled = true, }, tabnine = { enabled = true, }, },
		completion = { select_first_on_enter = true, },
		jump_by_subwords = { enabled = false, },
		rooter = { patterns = { ".git", "_darcs", ".bzr", ".svn", "Makefile" },  },
		zen = { kitty_enabled = true, enabled = true,  },
	},
	icons = icons,
	statusline = {
		path_enabled = true,
		path = "relative", 
	},
	lsp = {
    virtual_text = false, 
    virtual_lines = { only_current_line = true }	
	},
}
