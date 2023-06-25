local status_ok, gps = pcall(require, "nvim-gps")
if not status_ok then return end

local icons = require "utils.icons"
local hl_group = "LineNr"

gps.setup({
  icons = {
    ["class-name"] = "%#CmpItemKindClass#" .. icons.class .. "%*" .. "", 
    ["hook-name"] = "%#CmpItemKindMethodDefault#" .. icons.hook .. "%*" .. "", 
    ["function-name"] = "%#CmpItemKindFunction#" .. icons.func .. "%*" .. "", 
    ["method-name"] = "%#CmpItemKindMethod#" .. icons.method .. "%*" .. "", 
    ["container-name"] = "%#CmpItemKindProperty#" .. icons.object .. "%*" .. "", 
    ["tag-name"] = "%#CmpItemKindKeyword#" .. icons.tag .. "%*" .. " ", 
    ["mapping-name"] = "%#CmpItemKindProperty#" .. icons.object .. "%*" .. "",
    ["sequence-name"] = "%CmpItemKindProperty#" .. icons.array .. "%*" .. "",
    ["null-name"] = "%CmpItemKindField#" .. icons.field .. "%*" .. "",
    ["boolean-name"] = "%CmpItemKindValue#" .. icons.boolean .. "%*" .. "",
    ["integer-name"] = "%CmpItemKindValue#" .. icons.number .. "%*" .. "",
    ["float-name"] = "%CmpItemKindValue#" .. icons.number .. "%*" .. "",
    ["string-name"] = "%CmpItemKindValue#" .. icons.string .. "%*" .. "",
    ["array-name"] = "%CmpItemKindProperty#" .. icons.array .. "%*" .. "",
    ["object-name"] = "%CmpItemKindProperty#" .. icons.object .. "%*" .. "",
    ["number-name"] = "%CmpItemKindValue#" .. icons.number .. "%*" .. "",
    ["table-name"] = "%CmpItemKindProperty#" .. icons.table .. "%*" .. "",
    ["date-name"] = "%CmpItemKindValue#" .. icons.calendar .. "%*" .. "",
    ["date-time-name"] = "%CmpItemKindValue#" .. icons.table .. "%*" .. "",
    ["inline-table-name"] = "%CmpItemKindProperty#" .. icons.calendar .. "%*" .. "",
    ["time-name"] = "%CmpItemKindValue#" .. icons.watch .. "%*" .. "",
    ["module-name"] = "%CmpItemKindModule#" .. icons.module .. "%*" .. "",
  },
  
  languages = {
    ["html"] = false,
    ["tsx"] = { ["hook-name"] = "%#CmpItemKindMethodDefault#" .. icons.hook .. "%*" .. "",  }
  },

  separator = " " .. "%#" .. hl_group .. "#" .. xotovim.icons.caretRight .. "%*",
  depth = 0, 
  depth_limit_indicator = "..", 
  text_hl = hl_group
})
