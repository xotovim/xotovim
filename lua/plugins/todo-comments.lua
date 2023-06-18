local status_ok, todo_comments = pcall(require, "todo-comments")
if not status_ok then return end

todo_comments.setup {
  signs = false, 
  sign_priority = 8, 
  keywords = { FIX = { alt = { "FIXME", "BUG", "FIXIT", "ISSUE" } },  WARN = { alt = { "WARNING" } }, PERF = { alt = { "OPTIM", "PERFORMANCE", "OPTIMIZE" } }, },
  highlight = { before = "",  keyword = "wide",  after = "",  pattern = [[.*<(KEYWORDS)\s*:]],  comments_only = true,  max_line_len = 400,  exclude = {},  },
}

vim.keymap.set("n", "]t", function() require("todo-comments").jump_next() end, { desc = "Next todo comment" })
vim.keymap.set("n", "[t", function() require("todo-comments").jump_prev() end, { desc = "Previous todo comment" })
