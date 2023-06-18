local default_config = {
  inlay_hints = { highlight = "LspCodeLens", },
  debug_mode = false,
}

require("lsp-inlayhints").setup(default_config)
