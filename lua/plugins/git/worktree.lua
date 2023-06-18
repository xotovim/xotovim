local present, worktree = pcall(require, "git-worktree")
if not present then return end

local keymap = vim.keymap.set
local silent = { silent = true }
local utils = require('utils')

worktree.setup({ change_directory_command = "cd", update_on_change = true, update_on_change_command = "e .", clearjumps_on_change = true, autopush = false, })
keymap("n", "<Leader>gww", "<CMD>lua require('telescope').extensions.git_worktree.git_worktrees()<CR>", silent)
keymap("n", "<Leader>gwc", "<CMD>lua require('telescope').extensions.git_worktree.create_git_worktree()<CR>", silent)
worktree.on_tree_change(function(op, metadata)
  if op == worktree.Operations.Switch then
    utils.log("Switched from " .. metadata.prev_path .. " to " .. metadata.path, "Git Worktree")
    utils.closeOtherBuffers()
    vim.cmd ('e')
  end
end)
