local present_dapui, dapui = pcall(require, "dapui")
local present_dap, dap = pcall(require, "dap")
local present_virtual_text, dap_vt = pcall(require, "nvim-dap-virtual-text")
local _, shade = pcall(require, "shade")
local keymap = vim.keymap.set
local opts = { noremap = true, silent = true }

if not present_dapui or not present_dap or not present_virtual_text then return end

dap_vt.setup({
  enabled = true, 
  enabled_commands = true, 
  highlight_changed_variables = true, 
  highlight_new_as_changed = false, 
  show_stop_reason = true, 
  commented = false, 
  only_first_definition = true, 
  all_references = false, 
  filter_references_pattern = "<module", 
  virt_text_pos = "eol", 
  all_frames = false, 
  virt_lines = false, 
  virt_text_win_col = nil, 
})

dapui.setup({
  icons = { expanded = "▾", collapsed = "▸" },
  mappings = { expand = { "<CR>", "<2-LeftMouse>" }, open = "o", remove = "d", edit = "e", repl = "r", toggle = "t", },
  expand_lines = vim.fn.has("nvim-0.7"),
  layouts = {{ elements = {{ id = "scopes", size = 0.25 }, "breakpoints", "stacks", "watches", }, size = 40,  position = "left", }, { elements = { "repl", "console", }, size = 0.25,  position = "bottom", }, },
  floating = { max_height = nil, max_width = nil, border = xotovim.ui.float.border or "single", mappings = { close = { "q", "<Esc>" }, }, },
  windows = { indent = 1 },
  render = { max_type_length = nil,  },
})

dap.set_log_level("TRACE")

dap.listeners.after.event_initialized["dapui_config"] = function() dapui.open() end
dap.listeners.after.event_terminated["dapui_config"] = function() dapui.close() end
dap.listeners.before.event_exited["dapui_config"] = function() dapui.close() end

vim.g.dap_virtual_text = true

vim.fn.sign_define("DapBreakpoint", { text = "🟥", texthl = "", linehl = "", numhl = "" })
vim.fn.sign_define("DapStopped", { text = "⭐️", texthl = "", linehl = "", numhl = "" })

keymap("n", "<Leader>db", "<CMD>lua require('dap').toggle_breakpoint()<CR>", opts)
keymap("n", "<Leader>dc", "<CMD>lua require('dap').continue()<CR>", opts)
keymap("n", "<Leader>dd", "<CMD>lua require('dap').continue()<CR>", opts)
keymap("n", "<Leader>dh", "<CMD>lua require('dapui').eval()<CR>", opts)
keymap("n", "<Leader>di", "<CMD>lua require('dap').step_into()<CR>", opts)
keymap("n", "<Leader>do", "<CMD>lua require('dap').step_out()<CR>", opts)
keymap("n", "<Leader>dO", "<CMD>lua require('dap').step_over()<CR>", opts)
keymap("n", "<Leader>dt", "<CMD>lua require('dap').terminate()<CR>", opts)
keymap("n", "<Leader>dC", "<CMD>lua require('dapui').close()<CR>", opts)

keymap("n", "<Leader>dw", "<CMD>lua require('dapui').float_element('watches', { enter = true })<CR>", opts)
keymap("n", "<Leader>ds", "<CMD>lua require('dapui').float_element('scopes', { enter = true })<CR>", opts)
keymap("n", "<Leader>dr", "<CMD>lua require('dapui').float_element('repl', { enter = true })<CR>", opts)

dap.adapters.node2 = {
  type = "executable",
  command = "node",
  args = { vim.fn.stdpath("data") .. "/mason/packages/node-debug2-adapter/out/src/nodeDebug.js" },
}

dap.adapters.chrome = {
  type = "executable",
  command = "node",
  args = { vim.fn.stdpath("data") .. "/mason/packages/chrome-debug-adapter/out/src/chromeDebug.js" },
}

require("dap-vscode-js").setup({
  debugger_path = vim.fn.stdpath("data") .. "/mason/packages/js-debug-adapter",
  debugger_cmd = { "js-debug-adapter" },
  adapters = { "pwa-node", "pwa-chrome", "pwa-msedge", "node-terminal", "pwa-extensionHost" },
})

dap.configurations.javascript = {
  { name = "Node.js", type = "node2", request = "launch", program = "${file}", cwd = vim.fn.getcwd(), sourceMaps = true, protocol = "inspector", console = "integratedTerminal", }, 
}

dap.configurations.javascript = {
  { name = "Chrome (9222)", type = "chrome", request = "attach", program = "${file}", cwd = vim.fn.getcwd(), sourceMaps = true, protocol = "inspector", port = 9222, webRoot = "${workspaceFolder}", },
}

dap.configurations.javascriptreact = {
  { name = "Chrome (9222)", type = "chrome", request = "attach", program = "${file}", cwd = vim.fn.getcwd(), sourceMaps = true, protocol = "inspector", port = 9222, webRoot = "${workspaceFolder}", },
}

dap.configurations.typescriptreact = {
  { name = "Chrome (9222)", type = "chrome", request = "attach", program = "${file}", cwd = vim.fn.getcwd(), sourceMaps = true, protocol = "inspector", port = 9222, webRoot = "${workspaceFolder}", },
  { name = "React Native (8081) (Node2)", type = "node2", request = "attach", program = "${file}", cwd = vim.fn.getcwd(), sourceMaps = true, protocol = "inspector", console = "integratedTerminal", port = 8081, },
  { name = "Attach React Native (8081)", type = "pwa-node", request = "attach", processId = require('dap.utils').pick_process, cwd = vim.fn.getcwd(), rootPath = '${workspaceFolder}', skipFiles = { "<node_internals>/**", "node_modules/**" }, sourceMaps = true, protocol = "inspector", console = "integratedTerminal", },
}
