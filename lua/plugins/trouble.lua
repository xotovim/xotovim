local icons = xotovim.icons

require("trouble").setup {
  position = "right", 
  height = 10, 
  width = 50, 
  icons = true, 
  mode = "document_diagnostics", 
  fold_open = "", 
  fold_closed = "", 
  group = true, 
  padding = true, 
  action_keys = {  close = "q",  cancel = "<esc>",  refresh = "r",  jump = {"<cr>", "<tab>"},  open_split = { "<c-x>" },  open_vsplit = { "<c-v>" },  open_tab = { "<c-t>" },  jump_close = {"o"},  toggle_mode = "m",  toggle_preview = "P",  hover = "K",  preview = "p",  close_folds = {"zM", "zm"},  open_folds = {"zR", "zr"},  toggle_fold = {"zA", "za"},  previous = "k",  next = "j"  },
  indent_lines = false, 
  auto_open = false, 
  auto_close = true, 
  auto_preview = true, 
  auto_fold = true, 
  auto_jump = {"lsp_definitions"}, 
  signs = {  error = icons.errorOutline, warning = icons.warningTriangleNoBg, hint = icons.lightbulbOutline, information = icons.infoOutline, },
  use_diagnostic_signs = true 
};
