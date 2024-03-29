local actions = require('telescope.actions')
local previewers = require('telescope.previewers')
local builtin = require('telescope.builtin')
local icons = xotovim.icons

require('telescope').load_extension('fzf')
require('telescope').load_extension('repo')
require("telescope").load_extension("git_worktree")
require("telescope").load_extension("package_info")
require('telescope').load_extension('projects')
-- require("telescope").load_extension("file_browser")
require("telescope").load_extension("ui-select")

local git_icons = {
  added = icons.gitAdd,
  changed = icons.gitChange,
  deleted = icons.gitRemove,
  copied = ">",
  renamed = "➡",
  unmerged = "‡",
  untracked = "?",
}

require('telescope').setup {
  defaults = {
    vimgrep_arguments = { 'rg', '--color=never', '--no-heading', '--with-filename', '--line-number', '--column', '--smart-case' },
    layout_config = { horizontal = { preview_cutoff = 120 }, prompt_position = "top"},
    file_sorter = require('telescope.sorters').get_fzy_sorter,
    prompt_prefix = ' +  ',
    color_devicons = true,
    selection_strategy = "reset",
    layout_strategy = "horizontal",
    use_less = true,
    border = {},
    selectionet =  "  ",
    entry_prefix = "  ",
    initial_mode = "normal",
    borderchars = { '─', '│', '─', '│', '┌', '┐', "┘", "└"},
    set_env = { ['COLORTERM'] = 'truecolor' }, -- default = nil,
    git_icons = git_icons,
    sorting_strategy = "ascending",
    file_previewer = require('telescope.previewers').vim_buffer_cat.new,
    grep_previewer = require('telescope.previewers').vim_buffer_vimgrep.new,
    qflist_previewer = require('telescope.previewers').vim_buffer_qflist.new,

    mappings = { 
      i = { 
        ["<C-x>"] = false, 
        ["<C-j>"] = actions.move_selection_next, 
        ["<C-k>"] = actions.move_selection_previous, 
        ["<C-q>"] = actions.smart_send_to_qflist + actions.open_qflist, 
        ["<C-s>"] = actions.cycle_previewers_next, 
        ["<C-a>"] = actions.cycle_previewers_prev, 
        ["<C-h>"] = "which_key"
      }, 
        
      -- ["<ESC>"] = actions.close, 
      
      n = { 
        ["<C-s>"] = actions.cycle_previewers_next, 
        ["<C-a>"] = actions.cycle_previewers_prev, 
    }
    }
  },
  extensions = {
    fzf = { fuzzy = true, override_generic_sorter = true, override_file_sorter = true, case_mode = "smart_case"},
    -- file_browser = {
    --   hijack_netrw = true,
    --   theme = "ivy",
    --   -- -- path
    --   -- -- cwd
    --   -- cwd_to_path = true,
    --   -- grouped = false,
    --   -- files = true,
    --   -- add_dirs = true,
    --   -- depth = 1,
    --   -- auto_depth = false,
    --   -- select_buffer = false,
    --   -- hidden = { file_browser = true, folder_browser = true },
    --   -- -- respect_gitignore
    --   -- -- browse_files
    --   -- -- browse_folders
    --   -- hide_parent_dir = false,
    --   -- collapse_dirs = false,
    --   -- prompt_path = false,
    --   -- quiet = false,
    --   -- dir_icon = "",
    --   -- dir_icon_hl = "Default",
    --   -- display_stat = { date = true, size = true, mode = true },
    --   -- use_fd = true,
    --   -- git_status = true,
      
    -- },
    
    -- file_browser = {
    --   theme = "ivy",
    --   hijack_netrw = true,
    --   mappings = {
    --     ["i"] = {},
    --     ["n"] = {},
    --   },
    -- },
    ["ui-select"] = {
      require("telescope.themes").get_dropdown {}
    }
  },
}

-- require("telescope").load_extension("file_browser")

local M = {}

local delta_bcommits = previewers.new_termopen_previewer {
  get_command = function(entry) return { 'git', '-c', 'core.pager=delta', '-c', 'delta.side-by-side=false', 'diff', entry.value .. '^!', '--', entry.current_file } end
}

local delta = previewers.new_termopen_previewer {
  get_command = function(entry) return { 'git', '-c', 'core.pager=delta', '-c', 'delta.side-by-side=false', 'diff', entry.value .. '^!' } end
}

M.my_git_commits = function(opts)
  opts = opts or {}
  opts.previewer = {
    delta,
    previewers.git_commit_message.new(opts),
    previewers.git_commit_diff_as_was.new(opts),
  }

  builtin.git_commits(opts)
end

M.my_git_bcommits = function(opts)
  opts = opts or {}
  opts.previewer = {
    delta_bcommits,
    previewers.git_commit_message.new(opts),
    previewers.git_commit_diff_as_was.new(opts),
  }

  builtin.git_bcommits(opts)
end

M.edit_neovim = function()
  builtin.git_files(
    require('telescope.themes').get_dropdown({
      color_devicons = true,
      cwd = "~/.config/nvim",
      previewer = false,
      prompt_title = "xotovim dotfiles",
      sorting_strategy = "ascending",
      winblend = 0,
      layout_config = { horizontal = { mirror = false}, vertical = { mirror = false}, prompt_position = "top"},
    }))
end

M.project_files = function(opts)
  opts = opts or {} -- define here if you want to define something
  local ok = pcall(require "telescope.builtin".git_files, opts)
  if not ok then require "telescope.builtin".find_files(opts) end
end

M.command_history = function()
  builtin.command_history(
    require('telescope.themes').get_dropdown({
      color_devicons = true,
      winblend = 0,
      layout_config = {
        width = function(_, max_columns, _) return math.min(max_columns, 150) end,
        height = function(_, _, max_lines) return math.min(max_lines, 15) end,
      },
    }))
end

return M
