local M = {}

M.settings = {
  Lua = {
    telemetry = {
      enable = false
    },
    diagnostics = {
      globals = { 'vim', 'bit', 'packer_plugins' }
    }
  }
}

return M
