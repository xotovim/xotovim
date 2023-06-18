require("barbar").setup({
	exclude_ft = { "qf" },
	icons = {
		buffer_index = true,
		buffer_number = false,
		button = "",
		diagnostics = {
			[vim.diagnostic.severity.ERROR] = { enabled = false, icon = "ﬀ" },
			[vim.diagnostic.severity.WARN] = { enabled = false },
			[vim.diagnostic.severity.INFO] = { enabled = false },
			[vim.diagnostic.severity.HINT] = { enabled = false },
		},
		gitsigns = {
			added = { enabled = false, icon = "+" },
			changed = { enabled = false, icon = "~" },
			deleted = { enabled = false, icon = "-" },
		},
		separator = { left = "▎", right = "" },
		modified = { button = "●" },
		pinned = { button = "車", filename = true, separator = { right = "" } },
		alternate = { filetype = { enabled = false } },
		current = { buffer_index = true },
		inactive = { button = nil },
		visible = { modified = { buffer_number = false } },
	},
	sidebar_filetypes = {},
})
