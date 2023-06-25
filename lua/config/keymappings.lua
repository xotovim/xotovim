local keymap = vim.keymap.set
-- local keymap_del = vim.keymap.del
local silent = { silent = true }

table.unpack = table.unpack or unpack -- 5.1 compatibility

-- better window movement
keymap("n", "<C-h>", "<C-w>h", silent)
keymap("n", "<C-j>", "<C-w>j", silent)
keymap("n", "<C-k>", "<C-w>k", silent)
keymap("n", "<C-l>", "<C-w>l", silent)

-- h to move to the first non-blank character of the line
keymap("n", "H", "^", silent)

-- move selected line / block of text in visual mode
keymap("x", "K", ":move '<-2<CR>gv-gv", silent)
keymap("x", "J", ":move '>+1<CR>gv-gv", silent)

-- lazy 
keymap("n", "<eader>/l", "<cmd>:Lazy<cr>")

--nvim-spider
keymap({ "n", "o", "x" }, "W", "w", { desc = "Normal w" }) 
keymap({ "n", "o", "x" }, "w", "<cmd>lua require('spider').motion('w')<CR>", { desc = "Spider-w" }) 
keymap({ "n", "o", "x" }, "e", "<cmd>lua require('spider').motion('e')<CR>", { desc = "Spider-e" }) 
keymap({ "n", "o", "x" }, "b", "<cmd>lua require('spider').motion('b')<CR>", { desc = "Spider-b" }) 
keymap( { "n", "o", "x" }, "ge", "<cmd>lua require('spider').motion('ge')<CR>", { desc = "Spider-ge" } ) 

-- worktree
keymap("n", "<Leader>gww", "<CMD>lua require('telescope').extensions.git_worktree.git_worktrees()<CR>", silent)
keymap("n", "<Leader>gwc", "<CMD>lua require('telescope').extensions.git_worktree.create_git_worktree()<CR>", silent)

-- printer
keymap("n", "gP", "<Plug>(printer_print)iw")

-- promise - sync 
keymap("n", "zR", require("ufo").openAllFolds) 
keymap("n", "zM", require("ufo").closeAllFolds) 
keymap("n", "zr", require("ufo").openFoldsExceptKinds) 

-- todo comment 
keymap("n", "]t", function() require("todo-comments").jump_next() end, { desc = "Next todo comment" })
keymap("n", "[t", function() require("todo-comments").jump_prev() end, { desc = "Previous todo comment" })

-- keep visual mode indenting
keymap("v", "<", "<gv", silent)
keymap("v", ">", ">gv", silent)

-- case change in visual mode
keymap("v", "`", "u", silent)
keymap("v", "<A-`>", "U", silent)

-- save file by ctrl-s
keymap("n", "<C-s>", ":w<CR>", silent)
keymap("i", "<C-s>", "<ESC> :w<CR>", silent)

-- telescope
keymap("n", "<C-p>", "<CMD>lua require('plugins.telescope').project_files()<CR>")
keymap("n", "<S-p>", "<CMD>lua require('plugins.telescope.pickers.multi-rg')()<CR>")

-- remove highlights
keymap("n", "<CR>", ":noh<CR><CR>", silent)

--- light speed 
-- keymap_del("n", "S", silent)
-- keymap_del("n", "s", silent)
keymap("n", "s", "<Plug>Lightspeed_omni_s", silent)

-- find word/file across project
keymap("n", "<Leader>pf",
  "<CMD>lua require('plugins.telescope').project_files({ default_text = vim.fn.expand('<cword>'), initial_mode = 'normal' })<CR>")
keymap("n", "<Leader>pw", "<CMD>lua require('telescope.builtin').grep_string({ initial_mode = 'normal' })<CR>")

-- buffers
keymap("n", "<Tab>", ":BufferLineCycleNext<CR>", silent)
keymap("n", "gn", ":bn<CR>", silent)
keymap("n", "<S-Tab>", ":BufferLineCyclePrev<CR>", silent)
keymap("n", "gp", ":bp<CR>", silent)
keymap("n", "<S-q>", ":lua require('mini.bufremove').delete(0, false)<CR>", silent)

-- move between barbar buffers
keymap("n", "<Space>1", ":BufferLineGoToBuffer 1<CR>", silent)
keymap("n", "<Space>2", ":BufferLineGoToBuffer 2<CR>", silent)
keymap("n", "<Space>3", ":BufferLineGoToBuffer 3<CR>", silent)
keymap("n", "<Space>4", ":BufferLineGoToBuffer 4<CR>", silent)
keymap("n", "<Space>5", ":BufferLineGoToBuffer 5<CR>", silent)
keymap("n", "<Space>6", ":BufferLineGoToBuffer 6<CR>", silent)
keymap("n", "<Space>7", ":BufferLineGoToBuffer 7<CR>", silent)
keymap("n", "<Space>8", ":BufferLineGoToBuffer 8<CR>", silent)
keymap("n", "<Space>9", ":BufferLineGoToBuffer 9<CR>", silent)
keymap("n", "<A-1>", ":BufferLineGoToBuffer 1<CR>", silent)
keymap("n", "<A-2>", ":BufferLineGoToBuffer 2<CR>", silent)
keymap("n", "<A-3>", ":BufferLineGoToBuffer 3<CR>", silent)
keymap("n", "<A-4>", ":BufferLineGoToBuffer 4<CR>", silent)
keymap("n", "<A-5>", ":BufferLineGoToBuffer 5<CR>", silent)
keymap("n", "<A-6>", ":BufferLineGoToBuffer 6<CR>", silent)
keymap("n", "<A-7>", ":BufferLineGoToBuffer 7<CR>", silent)
keymap("n", "<A-8>", ":BufferLineGoToBuffer 8<CR>", silent)
keymap("n", "<A-9>", ":BufferLineGoToBuffer 9<CR>", silent)

-- don't yank on delete char
keymap("n", "x", '"_x', silent)
keymap("n", "X", '"_X', silent)
keymap("v", "x", '"_x', silent)
keymap("v", "X", '"_X', silent)

-- don't yank on visual paste
keymap("v", "p", '"_dP', silent)

-- dap 
keymap("n", "<Leader>db", "<CMD>lua require('dap').toggle_breakpoint()<CR>",  { noremap = true, silent = true })
keymap("n", "<Leader>dc", "<CMD>lua require('dap').continue()<CR>",  { noremap = true, silent = true })
keymap("n", "<Leader>dd", "<CMD>lua require('dap').continue()<CR>",  { noremap = true, silent = true })
keymap("n", "<Leader>dh", "<CMD>lua require('dapui').eval()<CR>",  { noremap = true, silent = true })
keymap("n", "<Leader>di", "<CMD>lua require('dap').step_into()<CR>",  { noremap = true, silent = true })
keymap("n", "<Leader>do", "<CMD>lua require('dap').step_out()<CR>",  { noremap = true, silent = true })
keymap("n", "<Leader>dO", "<CMD>lua require('dap').step_over()<CR>",  { noremap = true, silent = true })
keymap("n", "<Leader>dt", "<CMD>lua require('dap').terminate()<CR>",  { noremap = true, silent = true })
keymap("n", "<Leader>dC", "<CMD>lua require('dapui').close()<CR>",  { noremap = true, silent = true })

keymap("n", "<Leader>dw", "<CMD>lua require('dapui').float_element('watches', { enter = true })<CR>",  { noremap = true, silent = true })
keymap("n", "<Leader>ds", "<CMD>lua require('dapui').float_element('scopes', { enter = true })<CR>",  { noremap = true, silent = true })
keymap("n", "<Leader>dr", "<CMD>lua require('dapui').float_element('repl', { enter = true })<CR>",  { noremap = true, silent = true })

-- avoid issues because of remapping <c-a> and <c-x> below
-- vim.cmd([[
--   nnoremap <Plug>SpeedDatingFallbackUp <c-a>
--   nnoremap <Plug>SpeedDatingFallbackDown <c-x>
-- ]])

-- -- quickfix
-- keymap("n", "<Space>,", ":cp<CR>", silent)
-- keymap("n", "<Space>.", ":cn<CR>", silent)

-- -- toggle quicklist
-- keymap("n", "<leader>q", "<cmd>lua require('utils').toggle_quicklist()<CR>", silent)

-- -- manually invoke speeddating in case switch.vim didn't work
-- keymap("n", "<C-a>", ":if !switch#Switch() <bar> call speeddating#increment(v:count1) <bar> endif<CR>", silent)
-- keymap("n", "<C-x>", ":if !switch#Switch({'reverse': 1}) <bar> call speeddating#increment(-v:count1) <bar> endif<CR>",
--   silent)

-- -- open links under cursor in browser with gx
-- if vim.fn.has('macunix') == 1 then
--   keymap("n", "gx", "<cmd>silent execute '!open ' . shellescape('<cWORD>')<CR>", silent)
-- else
--   keymap("n", "gx", "<cmd>silent execute '!xdg-open ' . shellescape('<cWORD>')<CR>", silent)
-- end

-- -- refactor with spectre
-- keymap("n", "<Leader>pr", "<cmd>lua require('spectre').open_visual({select_word=true})<CR>", silent)
-- keymap("v", "<Leader>pr", "<cmd>lua require('spectre').open_visual()<CR>")

-- -- lsp
-- -- keymap("n", "gd", "<cmd>lua vim.lsp.buf.definition()<CR>", silent) -- Replaced with Glance plugin
-- -- keymap("n", "gr", "<cmd>lua vim.lsp.buf.references({ includeDeclaration = false })<CR>", silent) -- Replaced with Glance plugin
-- keymap("n", "<C-Space>", "<cmd>lua vim.lsp.buf.code_action()<CR>", silent)
-- keymap("n", "<leader>ca", "<cmd>lua vim.lsp.buf.code_action()<CR>", silent)
-- keymap("v", "<leader>ca", "<cmd>'<,'>lua vim.lsp.buf.code_action()<CR>", silent)
-- keymap("n", "<leader>cr", "<cmd>lua vim.lsp.buf.rename()<CR>", silent)
-- keymap("n", "<leader>cf", "<cmd>lua vim.lsp.buf.format({ async = true })<CR>", silent)
-- keymap("v", "<leader>cf", function()
--   local start_row, _ = table.unpack(vim.api.nvim_buf_get_mark(0, "<"))
--   local end_row, _ = table.unpack(vim.api.nvim_buf_get_mark(0, ">"))

-- 	vim.lsp.buf.format({
-- 		range = {
-- 			["start"] = { start_row, 0 },
-- 			["end"] = { end_row, 0 },
-- 		},
-- 		async = true,
-- 	})
-- end, silent)
-- keymap("n", "<leader>cl", "<cmd>lua vim.diagnostic.open_float({ border = 'single', max_width = 100 })<CR>", silent)
-- keymap("n", "gl", "<cmd>lua vim.diagnostic.open_float({ border = 'single', max_width = 100 })<CR>", silent)
-- keymap("n", "L", "<cmd>lua vim.lsp.buf.signature_help()<CR>", silent)
-- keymap("n", "]g", "<cmd>lua vim.diagnostic.goto_next({ float = { border = 'single', max_width = 100 }})<CR>", silent)
-- keymap("n", "[g", "<cmd>lua vim.diagnostic.goto_prev({ float = { border = 'single', max_width = 100 }})<CR>", silent)

keymap("n", "K", function()
	local winid = require("ufo").peekFoldedLinesUnderCursor()
	if not winid then
		vim.lsp.buf.hover()
	end
end)

-- comment box
-- keymap("n", "<leader>ac", "<cmd>lua require('comment-box').lbox()<CR>", silent)
-- keymap("v", "<leader>ac", "<cmd>lua require('comment-box').lbox()<CR>", silent)
