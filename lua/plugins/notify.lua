-- require("notify").setup({
-- 	background_colour = 'NotifyBackground', -- for stages that change opacity this is treated as the highlight behind the window. set this to either a highlight group, an rgb hex value e.g. "#000000" or a function returning an rgb code for dynamic values
-- 	stages = "fade", -- animation style (see below for details)

-- 	-- max_width = 5,
--   -- max_height = 5,
-- 	on_open = nil, -- function called when a new window is opened, use for changing win settings/config
-- 	type = "desktop",
-- 	on_close = nil, -- function called when a window is closed
-- 	render = "default", -- render function for notifications. see notify-render()
-- 	timeout = 2000, -- default timeout for notifications
-- 	minimum_width = 2, -- minimum width for notification windows
	
-- 	icons = { -- icons for the different levels
-- 	  ERROR = "",
-- 	  WARN = "",
-- 	  INFO = "",
-- 	  DEBUG = "",
-- 	  TRACE = "✎",
-- 	},
--   })
