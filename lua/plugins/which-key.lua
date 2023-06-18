local present, wk = pcall(require, "which-key")
if not present then return end

wk.setup {
  plugins = {
    marks = true, 
    registers = true, 
    spelling = { enabled = true,  suggestions = 20,  },
    presets = { operators = false,  motions = false,  windows = false,  nav = false,  z = false,  g = false,  },
  },
  operators = { gc = "Comments" },
  key_labels = {},
  icons = { breadcrumb = "»",  separator = "➜",  group = "+",  },
  window = { border = xotovim.ui.float.border or "single",  position = "bottom",  margin = { 0, 0, 0, 0 },  padding = { 1, 1, 1, 1 },  },
  layout = { height = { min = 4, max = 25 },  width = { min = 20, max = 50 },  spacing = 4,  align = "left",  },
  ignore_missing = false, 
  hidden = { "<silent>", "<cmd>", "<Cmd>", "<CR>", "call", "lua", "^:", "^ "}, 
  show_help = true, 
  triggers = {"<leader>"}, 
  triggers_blacklist = { i = { "j", "k" }, v = { "j", "k" }, },
}
local opts = {
  mode = "n", 
  prefix = "<leader>",
  buffer = nil, 
  silent = true, 
  noremap = true, 
  nowait = false, 
}
local visual_opts = {
  mode = "v", 
  prefix = "<leader>",
  buffer = nil, 
  silent = true, 
  noremap = true, 
  nowait = false, 
}
local normal_mode_mappings = {
  ["1"] = "which_key_ignore",
  ["2"] = "which_key_ignore",
  ["3"] = "which_key_ignore",
  ["4"] = "which_key_ignore",
  ["5"] = "which_key_ignore",
  ["6"] = "which_key_ignore",
  ["7"] = "which_key_ignore",
  ["8"] = "which_key_ignore",
  ["9"] = "which_key_ignore",
  ["/"] = { "<Plug>(comment_toggle_linewise_current)", "comment" },
  ['v'] = { '<C-W>v', 'split right' },
  ['V'] = { '<C-W>s', 'split below' },
  ['q'] = { 'quicklist' },
  -- ['e'] = { '<cmd>NvimTreeToggle<CR>', 'explorer' },
  ['r'] = { '<cmd>Ranger<CR>', 'ranger' },
  ["x"] = { "<cmd>q!<CR>", "quit" },
  ["T"] = { '<cmd>ToggleTerm<CR>', 'terminal' },
  ["t"] = { '<cmd>vert sbnext<cr>', 'split right' },
  ["b"] = { '<cmd>bel sbnext<cr>', 'split right' },
  [";"] = {
    name = "xotovim",
    ["/"] = { '<cmd>Alpha<CR>', 'dashboard' },
    m = { '<cmd>e $MYVIMRC<CR>', 'main config' },
  },
  w = {
    name = "window",
    h = { '<C-W>h', 'focus left' },
    j = { '<C-W>j', 'focus up' },
    k = { '<C-W>k', 'focus down' },
    l = { '<C-W>l', 'focus right' },
  },
  a = {
    name = "actions",
    l = { '<cmd>set nonumber!<CR>', 'line numbers' },
    r = { '<cmd>set norelativenumber!<CR>', 'relative number' },
    s = { '<cmd>LspToggleAutoFormat<CR>', 'format on save' },
  },
  u = {
    name = "buffer",
    x = { '<cmd>BufferCloseAllButCurrent<CR>', 'close but current' },
    c = { '<cmd>lua require("utils").closeOtherBuffers()<CR>', 'Close but current' },
    l = { '<cmd>BufferCloseBuffersLeft<CR>', 'close left' },
    r = { '<cmd>BufferCloseBuffersRight<CR>', 'close right' },
    p = { '<cmd>BufferMovePrevious<CR>', 'move prev' },
    n = { '<cmd>BufferMoveNext<CR>', 'move next' },
    s = { '<cmd>BufferPick<CR>', 'search buffer' },
  },
  l = {
    name = "lsp",
    a = { "<cmd>lua vim.lsp.buf.code_action()<cr>", "code action" },
    b = { "<cmd>Telescope diagnostics bufnr=0 theme=get_ivy<cr>", "buffer diagnostics" },
    w = { '<cmd>Telescope diagnostics wrap_results=true<CR>', 'workspace diagnostics' },
    d = { "<cmd>Telescope diagnostics<cr>", "diagnostics" },
    f = { vim.lsp.buf.format, "format" },
    i = { "<cmd>LspInfo<cr>", "info" },
    m = { "<cmd>Mason<cr>", "mason info" },
    n = { vim.diagnostic.goto_next, "next diagnostic", },
    p = { vim.diagnostic.goto_prev, "prev diagnostic", },
    l = { vim.lsp.codelens.run, "codelens action" },
    q = { vim.diagnostic.setloclist, "quickfix" },
    t = { "<cmd>Telescope quickfix<cr>", "telescope quickfix" },
    r = { vim.lsp.buf.rename, "rename" },
    s = { "<cmd>Telescope lsp_document_symbols<cr>", "document symbols" },
  },
  d = {
    name = "dab debug",
    t = { "<cmd>lua require'dap'.toggle_breakpoint()<cr>", "toggle breakpoint" },
    b = { "<cmd>lua require'dap'.step_back()<cr>", "step back" },
    c = { "<cmd>lua require'dap'.continue()<cr>", "continue" },
    C = { "<cmd>lua require'dap'.run_to_cursor()<cr>", "run to cursor" },
    d = { "<cmd>lua require'dap'.disconnect()<cr>", "disconnect" },
    g = { "<cmd>lua require'dap'.session()<cr>", "get session" },
    i = { "<cmd>lua require'dap'.step_into()<cr>", "step into" },
    o = { "<cmd>lua require'dap'.step_over()<cr>", "step over" },
    u = { "<cmd>lua require'dap'.step_out()<cr>", "step out" },
    p = { "<cmd>lua require'dap'.pause()<cr>", "pause" },
    r = { "<cmd>lua require'dap'.repl.toggle()<cr>", "toggle repl" },
    s = { "<cmd>lua require'dap'.continue()<cr>", "start" },
    q = { "<cmd>lua require'dap'.close()<cr>", "quit" },
    U = { "<cmd>lua require'dapui'.toggle()<cr>", "toggle ui" },
  },
  g = {
    name = "git",
    a = { '<cmd>!git add %:p<CR>', 'add current' },
    A = { '<cmd>!git add .<CR>', 'add all' },
    B = { '<cmd>Telescope git_branches<CR>', 'branches' },
    c = {
      name = 'conflict',
      b = {'<cmd>GitConflictChooseBoth<CR>', 'choose both'},
      n = {'<cmd>GitConflictNextConflict<CR>', 'move to next conflict'},
      o = {'<cmd>GitConflictChooseOurs<CR>', 'choose ours'},
      p = {'<cmd>GitConflictPrevConflict<CR>', 'move to prev conflict'},
      t = {'<cmd>GitConflictChooseTheirs<CR>', 'choose theirs'},
    },
    d = { '<cmd>lua require("plugins.git.diffview").toggle_file_history()<CR>', 'diff file' },
    g = { '<cmd>LazyGit<CR>', 'lazygit' },
    h = {
      name = "hunk",
      d = "diff hunk",
      p = "preview",
      R = "reset buffer",
      r = "reset hunk",
      s = "stage hunk",
      S = "stage buffer",
      t = "toggle deleted",
      u = "undo stage",
    },
    l = {
      name = "log",
      A = {"<cmd>lua require('plugins.telescope').my_git_commits()<CR>", "commits (telescope)"},
      a = {"<cmd>LazyGitFilter<CR>", "commits"},
      C = {"<cmd>lua require('plugins.telescope').my_git_bcommits()<CR>", "buffer commits (telescope)"},
      c = {"<cmd>LazyGitFilterCurrentFile<CR>", "buffer commits"},
    },
    m = { "blame line" },
    s = { '<cmd>lua require("plugins.git.diffview").toggle_status()<CR>', 'status' },
    w = {
      name = "worktree",
      w = "worktrees",
      c = "create worktree",
    }
  },
  p = {
    name = "project",
    f = { 'file' },
    w = { 'word' },
    l = { "<cmd>lua require'telescope'.extensions.repo.cached_list{file_ignore_patterns={'/%.cache/', '/%.cargo/', '/%.local/', '/%timeshift/', '/usr/', '/srv/', '/%.oh%-my%-zsh', '/Library/', '/%.cocoapods/'}}<CR>", 'list' },
    r = { 'refactor' },
    s = { "<cmd>SessionManager save_current_session<CR>", 'save session' },
    t = { "<cmd>TodoTrouble<CR>", 'todo' },
  },
  f = {
    name = "find",
    s = { '<cmd>Telescope search_history theme=dropdown<CR>', 'search history' },
    c = { '<cmd>lua require("telescope.builtin").colorscheme({enable_preview = true})<cr>', 'colorscheme with preview'},
    C = { '<cmd>Telescope commands<cr>', 'commands' },
    f = { '<cmd>Telescope oldfiles hidden=true<CR>', 'file history' },
    H = { '<cmd>Telescope highlights<cr>', 'highlighted groups' },
    g = { '<cmd>lua require("plugins.telescope").command_history()<CR>', 'command history' },
    r = { '<cmd>Telescope oldfiles<cr>', 'recent file' },
    t = { '<cmd>Telescope live_grep<cr>', 'text' },
    k = { '<cmd>Telescope keymaps<cr>', 'keymaps' },
  },
  ["s"] = {
    name = "session",
    c = { '<cmd>SessionManager load_session<CR>', 'choose session' },
    r = { '<cmd>SessionManager delete_session<CR>', 'remove session' },
    d = { '<cmd>SessionManager load_current_dir_session<CR>', 'current dir session' },
    l = { '<cmd>SessionManager load_last_session<CR>', 'last session' },
    s = { '<cmd>SessionManager save_current_session<CR>', 'save session' },
  },
}
local visual_mode_mappings = {
  ["s"] = { "<cmd>'<,'>sort<CR>", 'sort' },
  ["/"] = { "<Plug>(comment_toggle_linewise_current)", "comment" },
  l = { name = "lsp", a = { 'range code action' }, f = { 'range format' }, },
  g = { name = "git", h = { name = "hunk", r = "reset hunk", s = "stage hunk", }, },
  p = { name = "project", r = { 'refactor' }, },
--[[   t = {
    name = "table mode",
    t = { 'tableize' },
  }, ]]
}
wk.register(normal_mode_mappings, opts)
wk.register(visual_mode_mappings, visual_opts)
local function attach_markdown(bufnr)
  wk.register({
    a = {
      name = "Actions",
      m = { '<cmd>MarkdownPreviewToggle<CR>', 'markdown preview' },
    }
  }, {
    buffer = bufnr ,
    mode = "n", 
    prefix = "<leader>",
    silent = true, 
    noremap = true, 
    nowait = false, 
  })
end
local function attach_typescript(bufnr)
  wk.register({
    c = {
      name = "LSP",
      e = { '<cmd>TSC<CR>', 'workspace errors (TSC)'},
      F = { '<cmd>TypescriptFixAll<CR>', 'fix all' },
      i = { '<cmd>TypescriptAddMissingImports<CR>', 'import all'},
      o = { '<cmd>TypescriptOrganizeImports<CR>', 'organize imports'},
      u = { '<cmd>TypescriptRemoveUnused<CR>', 'remove unused' },
    }
  }, {
    buffer = bufnr ,
    mode = "n", 
    prefix = "<leader>",
    silent = true, 
    noremap = true, 
    nowait = false, 
  })
end
local function attach_npm(bufnr)
  wk.register({
    n = {
      name = "NPM",
      c = { '<cmd>lua require("package-info").change_version()<CR>', 'change version' },
      d = { '<cmd>lua require("package-info").delete()<CR>', 'delete package' },
      h = { "<cmd>lua require('package-info').hide()<CR>", 'hide'},
      i = { '<cmd>lua require("package-info").install()<CR>', 'install new package' },
      r = { '<cmd>lua require("package-info").reinstall()<CR>', 'reinstall dependencies' },
      s = { '<cmd>lua require("package-info").show()<CR>', 'show' },
      u = { '<cmd>lua require("package-info").update()<CR>', 'update package'},
    }
  }, {
    buffer = bufnr,
    mode = "n", 
    prefix = "<leader>",
    silent = true, 
    noremap = true, 
    nowait = false, 
  })
end
local function attach_zen(bufnr)
  wk.register({
    ["z"] = { '<cmd>ZenMode<CR>', 'zen' },
  }, {
    buffer = bufnr,
    mode = "n", 
    prefix = "<leader>",
    silent = true, 
    noremap = true, 
    nowait = false, 
  })
end
local function attach_jest(bufnr)
  wk.register({
    j = {
      name = "jest",
      f = { '<cmd>lua require("neotest").run.run(vim.fn.expand("%"))<CR>', 'run current file' },
      i = { '<cmd>lua require("neotest").summary.toggle()<CR>', 'toggle info panel' },
      j = { '<cmd>lua require("neotest").run.run()<CR>', 'run nearest test' },
      l = { '<cmd>lua require("neotest").run.run_last()<CR>', 'run last test' },
      o = { '<cmd>lua require("neotest").output.open({ enter = true })<CR>', 'open test output'},
      s = { '<cmd>lua require("neotest").run.stop()<CR>', 'stop' },
    }
  }, {
    buffer = bufnr,
    mode = "n", 
    prefix = "<leader>",
    silent = true, 
    noremap = true, 
    nowait = false, 
  })
end
local function attach_spectre(bufnr)
  wk.register({
    ["r"] = { '[SPECTRE] Replace all'},
    ["o"] = { '[SPECTRE] Show options'},
    ["q"] = { '[SPECTRE] Send all to quicklist'},
    ["v"] = { '[SPECTRE] Change view mode'},
  }, {
    buffer = bufnr,
    mode = "n", 
    prefix = "<leader>",
    silent = true, 
    noremap = true, 
    nowait = false, 
  })
end
local function attach_nvim_tree(bufnr)
  wk.register({
    ["="] = { "<cmd>NvimTreeResize +5<CR>", "resize +5" },
    ["-"] = { "<cmd>NvimTreeResize -5<CR>", "resize +5" },
  }, {
    buffer = bufnr,
    mode = "n",   
    prefix = "<leader>",
    silent = true, 
    noremap = true, 
    nowait = false, 
  })
end
return {
  attach_markdown = attach_markdown,
  attach_typescript = attach_typescript,
  attach_npm = attach_npm,
  attach_zen = attach_zen,
  attach_jest = attach_jest,
  attach_spectre = attach_spectre,
  attach_nvim_tree = attach_nvim_tree,
}
