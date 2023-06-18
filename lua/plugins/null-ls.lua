require("mason-null-ls").setup({
  ensure_installed = {},
  automatic_installation = true,
  automatic_setup = true, 
  handlers = {},
})

require("null-ls").setup({
  sources = {
    require("null-ls").builtins.diagnostics.codespell.with({ filetypes = { "markdown", "text" }, }),
    require("typescript.extensions.null-ls.code-actions"),
  },
})
