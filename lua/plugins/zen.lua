require("zen-mode").setup({
	window = {
		backdrop = 0.95, 
		width = 0.8, 
		height = 1, 
		options = {},
	},
	
	plugins = {
		options = { enabled = true, ruler = false,  showcmd = false,  },
		twilight = { enabled = true }, 
		gitsigns = { enabled = true }, 
		tmux = { enabled = false }, 
		kitty = { enabled = xotovim.plugins.zen.kitty_enabled or false, font = "+3",  },
	},
	
	on_open = function()
		require("gitsigns.actions").toggle_current_line_blame()
		require("indent_blankline.commands").disable()
		vim.opt.relativenumber = false
		require("gitsigns.actions").refresh()
	end,
	
	on_close = function()
		require("gitsigns.actions").toggle_current_line_blame()
		require("indent_blankline.commands").enable()
		vim.opt.relativenumber = true
		require("gitsigns.actions").refresh()
	end,
})