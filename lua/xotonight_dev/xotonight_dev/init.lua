local util = require("xotonight.util")
local theme = require("xotonight.theme")
local config = require("xotonight.config")

local M = {}

function M._load(style)
  if style and not M._style then
    M._style = require("xotonight.config").options.style
  end
  if not style and M._style then
    require("xotonight.config").options.style = M._style
    M._style = nil
  end
  M.load({ style = style, use_background = style == nil })
end

---@param opts Config|nil
function M.load(opts)
  if opts then
    require("xotonight.config").extend(opts)
  end
  util.load(theme.setup())
end

M.setup = config.setup

M.colorscheme = M.load -- keep for backward compatibility

return M
