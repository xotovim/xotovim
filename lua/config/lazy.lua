local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({ "git", "clone", "--filter=blob:none", "--single-branch", "https://github.com/folke/lazy.nvim.git", lazypath, })
end

vim.opt.runtimepath:prepend(lazypath)

require("lazy").setup("config.plugins", {
  defaults = { lazy = true },
  install = { colorscheme = { "github_light" } },
  checker = { enabled = true },
  performance = { rtp = { disabled_plugins = { "gzip", "tarPlugin", "tohtml", "tutor", "zipPlugin", }, }, },
  -- performance = { rtp = { disabled_plugins = { "gzip", "netrwPlugin", "tarPlugin", "tohtml", "tutor", "zipPlugin", }, }, },
  debug = false,
  ui = { border = xotovim.ui.float.border, }
})

