require('Comment').setup({
  padding = true,
  ignore = nil,
  mappings = { basic = true, extra = true, extended = false, },
  toggler = { line = 'gcc', block = 'gbc', },
  opleader = { line = 'gc', block = 'gb', },
  pre_hook = function(ctx) return require('Comment.jsx').calculate(ctx) end,
  post_hook = nil,
})
