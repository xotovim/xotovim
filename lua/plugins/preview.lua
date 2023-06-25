require('goto-preview').setup {
	width = 85; 
	height = 25; 
	border = {"↖", "─" ,"┐", "│", "┘", "─", "└", "│"}; 
	default_mappings = false; 
	debug = false; 
	opacity = nil; 
	resizing_mappings = false; 
	post_open_hook = nil; 
	references = {  telescope = require("telescope.themes").get_dropdown({ hide_preview = false }) };
	focus_on_open = true; 
	dismiss_on_move = false; 
	force_close = true, 
	bufhidden = "wipe", 
}