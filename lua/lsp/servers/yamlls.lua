local M = {}

M.filetypes = {
	"yml",
	"yaml", "yaml.docker-compose" 
}

M.settings = {
	redhat = {
		telemetry = {
		  enabled = false
		}
	  }
}

return M
