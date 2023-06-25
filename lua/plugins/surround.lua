require("nvim-surround").setup({ 
	surrounds = {  
		["("] = { add = { "( ", " )" }, find = function() return M.get_selection({ motion = "a(" }) end, delete = "^(. ?)().-( ?.)()$"},
        [")"] = { add = { "(", ")" }, find = function() return M.get_selection({ motion = "a)" }) end, delete = "^(.)().-(.)()$"},
        ["{"] = { add = { "{ ", " }" }, find = function() return M.get_selection({ motion = "a{" }) end, delete = "^(. ?)().-( ?.)()$"},
        ["}"] = { add = { "{", "}" }, find = function() return M.get_selection({ motion = "a}" }) end, delete = "^(.)().-(.)()$"},
        ["<"] = { add = { "< ", " >" }, find = function() return M.get_selection({ motion = "a<" }) end, delete = "^(. ?)().-( ?.)()$"},
        [">"] = { add = { "<", ">" }, find = function() return M.get_selection({ motion = "a>" }) end, delete = "^(.)().-(.)()$"},
        ["["] = { add = { "[ ", " ]" }, find = function() return M.get_selection({ motion = "a[" }) end, delete = "^(. ?)().-( ?.)()$"},
        ["]"] = { add = { "[", "]" }, find = function() return M.get_selection({ motion = "a]" }) end, delete = "^(.)().-(.)()$"},
        ["'"] = { add = { "'", "'" }, find = function() return M.get_selection({ motion = "a'" }) end, delete = "^(.)().-(.)()$"},
        ['"'] = { add = { '"', '"' }, find = function() return M.get_selection({ motion = 'a"' }) end, delete = "^(.)().-(.)()$"},
        ["`"] = { add = { "`", "`" }, find = function() return M.get_selection({ motion = "a`" }) end, delete = "^(.)().-(.)()$"},
	},
	aliases = {  
        ["a"] = ">",
        ["b"] = ")",
        ["B"] = "}",
        ["r"] = "]",
        ["q"] = { '"', "'", "`" },
        ["s"] = { "}", "]", ")", ">", '"', "'", "`" },
    },
	highlight = { 
		duration = 200
	},
	move_cursor = true 
})
