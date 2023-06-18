local present, conflict = pcall(require, "git-conflict")
if not present then return end

conflict.setup({
	default_mappings = true, 
	default_commands = true, 
	disable_diagnostics = true, 
	highlights = {  incoming = "DiffText", current = "DiffAdd", },
})

vim.api.nvim_create_autocmd("User", {
	pattern = "GitConflictDetected",
	callback = function() vim.notify("Conflict detected in " .. vim.fn.expand("<afile>")) end,
})
