local M = {}

M.filetypes = {
	"py",
	"python"
}
  
M.settings = {
	pylsp = {
		plugins = {
		  pycodestyle = {
			ignore = {'W391'},
			maxLineLength = 100
		  }
		}
	  }
	
}

return M
