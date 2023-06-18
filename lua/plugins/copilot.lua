require("copilot").setup({
	panel = {
		enabled = true,
		auto_refresh = true,
		layout = { position = "bottom",  ratio = 0.4 },
	},
	suggestion = {
		enabled = true,
		auto_trigger = true,
		debounce = 75,
	},
	filetypes = {
		javascript = true,  
		typescript = true,  
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
	copilot_node_command = 'node', 
	
})
