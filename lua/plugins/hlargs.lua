require('hlargs').setup {
	color = '#ff7896',
	highlight = {},
	excluded_filetypes = {},
	use_colorpalette = true,
	colorpalette = {
		{ fg = "#ff7896" },
		{ fg = "#ff7896" },
		{ fg = "#ff7896" },
		{ fg = "#ff7896" },
		{ fg = "#ff7896" },
		{ fg = "#ff7896" },
		{ fg = "#ff7896" },
		{ fg = "#ff7896" },
		{ fg = "#ff7896" },
		{ fg = "#ff7896" },
		{ fg = "#ff7896" },
		{ fg = "#ff7896" },
		{ fg = "#ff7896" },
		{ fg = "#ff7896" },
		{ fg = "#ff7896" },
		{ fg = "#ff7896" },
		{ fg = "#ff7896" },
		{ fg = "#ff7896" },
		{ fg = "#ff7896" },
		{ fg = "#ff7896" },
		{ fg = "#ff7896" },
		{ fg = "#ff7896" },
		{ fg = "#ff7896" },
		{ fg = "#ff7896" },
		{ fg = "#ff7896" },
		{ fg = "#ff7896" },
		{ fg = "#ff7896" },
		{ fg = "#ff7896" },
		{ fg = "#ff7896" },
		{ fg = "#ff7896" },
		{ fg = "#ff7896" },
		{ fg = "#ff7896" },
		{ fg = "#ff7896" },
		{ fg = "#ff7896" },
		{ fg = "#ff7896" },
		{ fg = "#ff7896" },
		{ fg = "#ff7896" },
		{ fg = "#ff7896" },
		{ fg = "#ff7896" },
	},
	-- disable = function(lang, bufnr) -- If changed, `excluded_filetypes` will be ignored
	--   return vim.tbl_contains(opts.excluded_filetypes, lang)
	-- end,
	paint_arg_declarations = true,
	paint_arg_usages = true,
	paint_catch_blocks = {
	  declarations = true,
	  usages = true
	},
	extras = {
	  named_parameters = true,
	},
	hl_priority = 10000,
	excluded_argnames = {
	  declarations = {},
	  usages = {
		python = { 'self', 'cls' },
		lua = { 'self' }
	  }
	},
	performance = {
	  parse_delay = 1,
	  slow_parse_delay = 50,
	  max_iterations = 400,
	  max_concurrent_partial_parses = 30,
	  debounce = {
		partial_parse = 3,
		partial_insert_mode = 100,
		total_parse = 700,
		slow_parse = 5000
	  }
	}
  }