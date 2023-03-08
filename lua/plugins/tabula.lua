require("tabhula").setup({
	tabkey = "<Tab>",
	backward_tabkey = "",
	evil_tabkey = "",
	evil_backward_tabkey = "",
	completion = nil,
	range = nil,

	forward_characters = {
		[")"] = function() return 1 end,
		["]"] = function() return 1 end,
		["}"] = function() return 1 end,
		["("] = function() return 1 end,
		["["] = function() return 1 end,
		["{"] = function() return 1 end,
		["="] = function() return 1 end,
		[";"] = function() return 1 end,
		[":"] = function() return 1 end,
		[","] = function() return 1 end,
		["++"] = function() return 1 end,
		['"'] = function() return 1 end,
		["'"] = function() return 1 end,
		["`"] = function() return 1 end,
	},

	backward_characters = {},
})
