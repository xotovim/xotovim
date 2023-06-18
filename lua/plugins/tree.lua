local utils = require("utils")
local api = require("nvim-tree.api")

local git_icons = {
	unstaged = "",
	staged = "",
	unmerged = "",
	renamed = "➜",
	untracked = "",
	deleted = "",
	ignored = "◌",
}

local function on_attach(bufnr)
  local function opts(desc)
    return { desc = 'nvim-tree: ' .. desc, buffer = bufnr, noremap = true, silent = true, nowait = true }
  end

  vim.keymap.set('n', '<CR>', api.node.open.edit, opts('Open'))
  vim.keymap.set('n', 'o', api.node.open.edit, opts('Open'))
  vim.keymap.set('n', '<2-LeftMouse>', api.node.open.edit, opts('Open'))
  vim.keymap.set('n', 'O', api.node.open.no_window_picker, opts('Open: No Window Picker'))
  vim.keymap.set('n', '<2-RightMouse>', api.tree.change_root_to_node, opts('CD'))
  vim.keymap.set('n', '<C-]>', api.tree.change_root_to_node, opts('CD'))
  vim.keymap.set('n', '<C-v>', api.node.open.vertical, opts('Open: Vertical Split'))
  vim.keymap.set('n', '<C-x>', api.node.open.horizontal, opts('Open: Horizontal Split'))
  vim.keymap.set('n', '<C-t>', api.node.open.tab, opts('Open: New Tab'))
  vim.keymap.set('n', '<', api.node.navigate.sibling.prev, opts('Previous Sibling'))
  vim.keymap.set('n', '>', api.node.navigate.sibling.next, opts('Next Sibling'))
  vim.keymap.set('n', 'P', api.node.navigate.parent, opts('Parent Directory'))
  vim.keymap.set('n', '<BS>', api.node.navigate.parent_close, opts('Close Directory'))
  vim.keymap.set('n', '<Tab>', api.node.open.preview, opts('Open Preview'))
  vim.keymap.set('n', 'K', api.node.navigate.sibling.first, opts('First Sibling'))
  vim.keymap.set('n', 'J', api.node.navigate.sibling.last, opts('Last Sibling'))
  vim.keymap.set('n', 'I', api.tree.toggle_gitignore_filter, opts('Toggle Git Ignore'))
  vim.keymap.set('n', 'H', api.tree.toggle_hidden_filter, opts('Toggle Dotfiles'))
  vim.keymap.set('n', 'R', api.tree.reload, opts('Refresh'))
  vim.keymap.set('n', 'a', api.fs.create, opts('Create'))
  vim.keymap.set('n', 'd', api.fs.remove, opts('Delete'))
  vim.keymap.set('n', 'D', api.fs.trash, opts('Trash'))
  vim.keymap.set('n', 'r', api.fs.rename, opts('Rename'))
  vim.keymap.set('n', '<C-r>', api.fs.rename_sub, opts('Rename: Omit Filename'))
  vim.keymap.set('n', 'x', api.fs.cut, opts('Cut'))
  vim.keymap.set('n', 'c', api.fs.copy.node, opts('Copy'))
  vim.keymap.set('n', 'p', api.fs.paste, opts('Paste'))
  vim.keymap.set('n', 'y', api.fs.copy.filename, opts('Copy Name'))
  vim.keymap.set('n', 'Y', api.fs.copy.relative_path, opts('Copy Relative Path'))
  vim.keymap.set('n', 'gy', api.fs.copy.absolute_path, opts('Copy Absolute Path'))
  vim.keymap.set('n', '[c', api.node.navigate.git.prev, opts('Prev Git'))
  vim.keymap.set('n', ']c', api.node.navigate.git.next, opts('Next Git'))
  vim.keymap.set('n', '-', api.tree.change_root_to_parent, opts('Up'))
  vim.keymap.set('n', 's', api.node.run.system, opts('Run System'))
  vim.keymap.set('n', 'q', api.tree.close, opts('Close'))
  vim.keymap.set('n', 'g?', api.tree.toggle_help, opts('Help'))
  vim.keymap.set('n', 'W', api.tree.collapse_all, opts('Collapse'))
  vim.keymap.set('n', 'S', api.tree.search_node, opts('Search'))

end

require("nvim-tree").setup(
	{
		auto_reload_on_write = true,
		hijack_cursor = false,
		hijack_netrw = true,
		hijack_unnamed_buffer_when_opening = false,
		sort_by = "name",
		root_dirs = {},
		prefer_startup_root = false,
		sync_root_with_cwd = false,
		reload_on_bufenter = false,
		respect_buf_cwd = false,
		on_attach = "disable",
		remove_keymaps = false,
		select_prompts = false,
		view = {
			centralize_selection = false,
			cursorline = true,
			debounce_delay = 15,
			width = 30,
			hide_root_folder = false,
			side = "left",
			preserve_window_proportions = false,
			number = false,
			relativenumber = false,
			signcolumn = "yes",
			mappings = { custom_only = false, list = keymappings },
			float = { enable = false, quit_on_focus_loss = true, open_win_config = { relative = "editor", border = "single", width = 30, height = 30, row = 1, col = 1, }, },
		},
		renderer = {
			add_trailing = false,
			group_empty = false,
			highlight_git = false,
			full_name = false,
			highlight_opened_files = "none",
			root_folder_label = ":~:s?$?/..?",
			indent_width = 2,
			indent_markers = { enable = false, inline_arrows = true, icons = { corner = "└", edge = "│", item = "│", bottom = "─", none = " ", }, },
			icons = { 
				webdev_colors = true, git_placement = "before", modified_placement = "after", padding = " ", symlink_arrow = " ➛ ", 
				show = { file = true, folder = true, folder_arrow = true, git = true, modified = true, }, 
				glyphs = { default = "", symlink = "", bookmark = "", modified = "●", 
				folder = { arrow_closed = "", arrow_open = "", default = "", open = "", empty = "", empty_open = "", symlink = "", symlink_open = "", }, 
				git = { unstaged = "✗", staged = "✓", unmerged = "", renamed = "➜", untracked = "★", deleted = "", ignored = "◌", }, }, 
			},
			special_files = { "Cargo.toml", "Makefile", "README.md", "readme.md" },
			symlink_destination = true,
		},
		hijack_directories = { enable = true, auto_open = true, },
		update_focused_file = { enable = true, update_root = true, ignore_list = {}, },
		system_open = { cmd = "", args = {}, },
		diagnostics = { 
			enable = false, 
			show_on_dirs = false,
			show_on_open_dirs = true,
			debounce_delay = 50,
			severity = { min = vim.diagnostic.severity.HINT, max = vim.diagnostic.severity.ERROR },
			icons = { hint = "", info = "", warning = "", error = "", },
		},
		filters = { dotfiles = false, git_clean = false, no_buffer = false, custom = {}, exclude = {}, },
		filesystem_watchers = { enable = true, debounce_delay = 50, ignore_dirs = {}, },
		git = { enable = true, ignore = true, show_on_dirs = true, show_on_open_dirs = true, timeout = 400, }, modified = { enable = false, show_on_dirs = true, show_on_open_dirs = true, },
		actions = { use_system_clipboard = true, change_dir = { enable = true, global = false, restrict_above_cwd = false, }, 
		expand_all = { max_folder_discovery = 300, exclude = {}, },
			file_popup = { open_win_config = { col = 1, row = 1, relative = "cursor", border = "shadow", style = "minimal", }, },
			open_file = { quit_on_open = false, resize_window = true, window_picker = { enable = true, chars = "ABCDEFGHIJKLMNOPQRSTUVWXYZ1234567890", exclude = { filetype = { "notify", "packer", "qf", "diff", "fugitive", "fugitiveblame" }, buftype = { "nofile", "terminal", "help" }, }, }, },
			remove_file = { close_window = true, },
		},
		trash = { cmd = "gio trash", },
		live_filter = { prefix = "[FILTER]: ", always_show_folders = true, },
		tab = { sync = { open = false, close = false, ignore = {}, }, },
		notify = { threshold = vim.log.levels.INFO, },
		log = { enable = false, truncate = false, types = { all = false, config = false, copy_paste = false, dev = false, diagnostics = false, git = false, profile = false, watcher = false, }, }
		
	}
)

vim.api.nvim_set_keymap( "n", "<C-e>", "<cmd>lua require('nvim-tree.api').tree.toggle()<CR>", { noremap = true, silent = true } ) 