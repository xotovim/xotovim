local present, worktree = pcall(require, "git-worktree")
if not present then return end

local utils = require('utils')

worktree.setup({ change_directory_command = "cd", update_on_change = true, update_on_change_command = "e .", clearjumps_on_change = true, autopush = false, })

worktree.on_tree_change(function(op, metadata)
  if op == worktree.Operations.Switch then
    utils.log("Switched from " .. metadata.prev_path .. " to " .. metadata.path, "Git Worktree")
    utils.closeOtherBuffers()
    vim.cmd ('e')
  end
end)
