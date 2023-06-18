return {
	{ "folke/tokyonight.nvim", lazy = false, priority = 1000, config = function() vim.cmd([[colorscheme tokyonight]]) require("plugins.xotonight") end },
	{ "kylechui/nvim-surround", lazy = false, config = function() require("plugins.surround") end }, 
	{ "ahmedkhalf/project.nvim", lazy = true, event = "VeryLazy", config = function() require('plugins.project') end }, 
	{ 'gen740/SmoothCursor.nvim', lazy = true, event = "BufEnter", config = function() require('plugins.smoothcursor') end },
	{ 'karb94/neoscroll.nvim', lazy = true, event = "VeryLazy", config = function() require('plugins.smoothscroll') end }, 
	{ 'is0n/fm-nvim', lazy = true, event = "VeryLazy", config = function() require('plugins.fmnvim') end }, 
	{ 'petertriho/nvim-scrollbar', lazy = true, event = "VeryLazy", config = function() require('plugins.scrollbar') end },
	{ 'abecodes/tabout.nvim', lazy = false, wants = {'nvim-treesitter'},  after = {'nvim-cmp'},  config = function() require('plugins.tabula') end }, 
	{ 'nvim-telescope/telescope-ui-select.nvim', event = "BufReadPre" }, 
	{ 'rmagatti/goto-preview', lazy = true, event = "VeryLazy", config = function() require("plugins.preview") end }, { "https://git.sr.ht/~whynothugo/lsp_lines.nvim", lazy = false, config = function() require("lsp_lines").setup() end },
	-- { 'christoomey/vim-tmux-navigator', lazy = false }, 
	{ "nvim-lua/plenary.nvim" },
	{ "nvim-tree/nvim-web-devicons", config = function() require("nvim-web-devicons").setup({ default = true }) end },
	{ "goolord/alpha-nvim", lazy = false, config = function() require("plugins.alpha") end },
	{ "nvim-treesitter/nvim-treesitter", event = "BufReadPre", config = function() require("plugins.treesitter") end, dependencies = { "mrjones2014/nvim-ts-rainbow", "JoosepAlviste/nvim-ts-context-commentstring", "nvim-treesitter/nvim-treesitter-textobjects", "RRethy/nvim-treesitter-textsubjects" } },
	{ "nvim-pack/nvim-spectre" },
	{ "nvim-telescope/telescope.nvim", lazy = false, config = function() require("plugins.telescope") end, dependencies = { { "nvim-lua/popup.nvim" }, { "nvim-lua/plenary.nvim" }, { "nvim-telescope/telescope-ui-select.nvim" }, { "nvim-telescope/telescope-fzf-native.nvim", build = "make" }, { "cljoly/telescope-repo.nvim" } } },
	{ "nvim-tree/nvim-tree.lua", cmd = { "NvimTreeOpen", "NvimTreeClose", "NvimTreeToggle", "NvimTreeFindFile", "NvimTreeFindFileToggle" }, keys = { { "<C-e>", "<cmd>lua require('nvim-tree.api').tree.toggle()<CR>", desc = "NvimTree" } }, config = function() require("plugins.tree") end },
	{ "gbprod/stay-in-place.nvim", lazy = false, config = true,  },
	{ "neovim/nvim-lspconfig", event = "BufReadPre", dependencies = { "mason.nvim", "williamboman/mason-lspconfig.nvim", "hrsh7th/cmp-nvim-lsp" }, servers = nil },
	{ "williamboman/mason.nvim", cmd = "Mason", keys = { { "<leader>cm", "<cmd>Mason<cr>", desc = "Mason" } } },
	{ "jose-elias-alvarez/null-ls.nvim", event = "BufNewFile", dependencies = { "mason.nvim" } },
	{ "jay-babu/mason-null-ls.nvim", event = { "BufReadPre", "BufNewFile" }, dependencies = { "williamboman/mason.nvim", "jose-elias-alvarez/null-ls.nvim" }, config = function() require("plugins.null-ls") end },
	{ "hrsh7th/nvim-cmp", event = "InsertEnter", config = function() require("plugins.cmp") end, dependencies = { "hrsh7th/cmp-nvim-lua", "hrsh7th/cmp-nvim-lsp", "hrsh7th/cmp-buffer", "hrsh7th/cmp-path", "hrsh7th/cmp-cmdline", "hrsh7th/cmp-calc", "saadparwaiz1/cmp_luasnip", { "L3MON4D3/LuaSnip", dependencies = "rafamadriz/friendly-snippets" }, { cond = xotovim.plugins.ai.tabnine.enabled, "tzachar/cmp-tabnine", build = "./install.sh" }, { "David-Kunz/cmp-npm", config = function() require("plugins.cmp-npm") end }, { "zbirenbaum/copilot-cmp", cond = xotovim.plugins.ai.copilot.enabled, config = function() require("copilot_cmp").setup() end } } },
	{ "onsails/lspkind-nvim" },
	{ "folke/trouble.nvim", cmd = { "TroubleToggle", "Trouble" }, config = function() require("plugins.trouble") end },
	{ "nvim-lua/popup.nvim" },
	{ "SmiteshP/nvim-navic", config = function() require("plugins.navic") end, dependencies = "neovim/nvim-lspconfig" },
	{ "jose-elias-alvarez/typescript.nvim" },
	{ "axelvc/template-string.nvim", event = "InsertEnter", ft = { "javascript", "typescript", "javascriptreact", "typescriptreact" }, config = true,  },
	{ "lvimuser/lsp-inlayhints.nvim", branch = "main",  config = function() require("plugins.inlay-hints") end },
	{ "barrett-ruth/import-cost.nvim", build = "sh install.sh yarn", ft = { "javascript", "typescript", "javascriptreact", "typescriptreact" }, config = true },
	{ "dmmulroy/tsc.nvim", cmd = { "TSC" }, config = true },
	{ "dnlhc/glance.nvim", config = true, opts = { hooks = { before_open = function(results, open, jump, method) if #results == 1 then jump(results[1])  else open(results)  end end } }, cmd = { "Glance" }, keys = { { "gd", "<cmd>Glance definitions<CR>", desc = "LSP Definition" }, { "gr", "<cmd>Glance references<CR>", desc = "LSP References" }, { "gm", "<cmd>Glance implementations<CR>", desc = "LSP Implementations" }, { "gy", "<cmd>Glance type_definitions<CR>", desc = "LSP Type Definitions" } } },
	{ "AndrewRadev/switch.vim", lazy = false },
	{ "Wansmer/treesj", lazy = true, cmd = { "TSJToggle", "TSJSplit", "TSJJoin" }, keys = { { "gJ", "<cmd>TSJToggle<CR>", desc = "Toggle Split/Join" } }, config = function() require("treesj").setup({ use_default_keymaps = false }) end },
	{ "numToStr/Comment.nvim", lazy = false, branch = "jsx", config = function() require("plugins.comment") end },
	{ "LudoPinelli/comment-box.nvim" },
	{ "akinsho/nvim-toggleterm.lua", lazy = false, branch = "main", config = function() require("plugins.toggleterm") end },
	{ "tpope/vim-repeat", lazy = false },
	{ "tpope/vim-speeddating", lazy = false },
	{ "dhruvasagar/vim-table-mode", ft = { "markdown" } },
	{ "mg979/vim-visual-multi", keys = { "<C-n>", "<C-Up>", "<C-Down>", "<S-Up>", "<S-Down>", "<S-Left>", "<S-Right>" }, config = function() vim.g.VM_leader = ";" end },
	{ "nacro90/numb.nvim", lazy = false, config = function() require("plugins.numb") end },
	{ "folke/todo-comments.nvim", lazy = false, event = "BufEnter", config = function() require("plugins.todo-comments") end },
	{ "folke/zen-mode.nvim", cmd = { "ZenMode" }, config = function() require("plugins.zen") end, cond = xotovim.plugins.zen.enabled },
	{ "folke/twilight.nvim", config = true, cond = xotovim.plugins.zen.enabled },
	{ "ggandor/lightspeed.nvim", keys = "s", config = function() require("plugins.lightspeed") end },
	{ "folke/which-key.nvim", event = "VeryLazy", lazy = true, config = function() require("plugins.which-key") end },
	{ "echasnovski/mini.bufremove", version = "*", config = function() require("mini.bufremove").setup({ silent = true }) end },
	{ "akinsho/bufferline.nvim", event = "VeryLazy", dependencies = { "nvim-tree/nvim-web-devicons", "echasnovski/mini.bufremove" }, version = "*", config = function() require("plugins.bufferline") end },
	{ "antoinemadec/FixCursorHold.nvim" }, 
	{ "rcarriga/nvim-notify", config = function() require("notify").setup({ background_colour = "#000000" }) end, init = function() local banned_messages = { "No information available", "LSP[tsserver] Inlay Hints request failed. Requires TypeScript 4.4+.", "LSP[tsserver] Inlay Hints request failed. File not opened in the editor." } vim.notify = function(msg, ...) for _, banned in ipairs(banned_messages) do if msg == banned then return end end return require("notify")(msg, ...) end end },
	{ "vuki656/package-info.nvim", event = "BufEnter package.json", config = function() require("plugins.package-info") end },
	{ "iamcco/markdown-preview.nvim", build = "cd app && npm install", setup = function() vim.g.mkdp_filetypes = { "markdown" } end, ft = { "markdown" } },
	{ "airblade/vim-rooter", setup = function() vim.g.rooter_patterns = xotovim.plugins.rooter.patterns end },
	{ "Shatur/neovim-session-manager", lazy = false, config = function() require("plugins.session-manager") end },
	{ "kylechui/nvim-surround", lazy = false, config = true },
	{ "sunjon/shade.nvim", config = function() require("shade").setup() require("shade").toggle() end },
	{ "kevinhwang91/nvim-ufo", dependencies = "kevinhwang91/promise-async", config = function() vim.keymap.set("n", "zR", require("ufo").openAllFolds) vim.keymap.set("n", "zM", require("ufo").closeAllFolds) vim.keymap.set("n", "zr", require("ufo").openFoldsExceptKinds) end },
	{ "echasnovski/mini.align", lazy = false, version = false, config = function() require("mini.align").setup() end },
	{ "rareitems/printer.nvim", event = "BufEnter", ft = { "lua", "javascript", "typescript", "javascriptreact", "typescriptreact" }, config = function() require("plugins.printer") end },
	{ "lukas-reineke/indent-blankline.nvim", event = "BufReadPre", config = function() require("plugins.indent") end },
	{ "chrisgrieser/nvim-spider", cond = xotovim.plugins.jump_by_subwords.enabled, lazy = true, keys = { "w", "e", "b", "ge" }, config = function() vim.keymap.set({ "n", "o", "x" }, "W", "w", { desc = "Normal w" }) vim.keymap.set({ "n", "o", "x" }, "w", "<cmd>lua require('spider').motion('w')<CR>", { desc = "Spider-w" }) vim.keymap.set({ "n", "o", "x" }, "e", "<cmd>lua require('spider').motion('e')<CR>", { desc = "Spider-e" }) vim.keymap.set({ "n", "o", "x" }, "b", "<cmd>lua require('spider').motion('b')<CR>", { desc = "Spider-b" }) vim.keymap.set( { "n", "o", "x" }, "ge", "<cmd>lua require('spider').motion('ge')<CR>", { desc = "Spider-ge" } ) end },
	{ "windwp/nvim-autopairs", event = "InsertEnter", config = function() require("plugins.autopairs") end },
	{ "NvChad/nvim-colorizer.lua", config = function() require("plugins.colorizer") end },
	{ "jcdickinson/codeium.nvim", cond = xotovim.plugins.ai.codeium.enabled, event = "InsertEnter", cmd = "Codeium", dependencies = { "nvim-lua/plenary.nvim", "hrsh7th/nvim-cmp" }, config = true },
	{ "zbirenbaum/copilot.lua", cond = xotovim.plugins.ai.copilot.enabled, event = "InsertEnter", config = function() require("plugins.copilot") end },
	{ "Bryley/neoai.nvim", cond = xotovim.plugins.ai.chatgpt.enabled, dependencies = { "MunifTanjim/nui.nvim" }, cmd = { "NeoAI", "NeoAIOpen", "NeoAIClose", "NeoAIToggle", "NeoAIContext", "NeoAIContextOpen", "NeoAIContextClose", "NeoAIInject", "NeoAIInjectCode", "NeoAIInjectContext", "NeoAIInjectContextCode" }, keys = { { "<leader>as", desc = "summarize text" }, { "<leader>ag", desc = "generate git message" } }, config = true },
	{ "lewis6991/gitsigns.nvim", event = "BufReadPre", dependencies = { "nvim-lua/plenary.nvim" }, config = function() require("plugins.git.signs") end },
	{ "sindrets/diffview.nvim", lazy = true, enabled = false, event = "BufRead", config = function() require("plugins.git.diffview") end },
	{ "akinsho/git-conflict.nvim", lazy = false, config = function() require("plugins.git.conflict") end },
	{ "ThePrimeagen/git-worktree.nvim", keys = { "<Leader>gwc", "<Leader>gww" }, config = function() require("plugins.git.worktree") end },
	{ "kdheepak/lazygit.nvim", cmd = { "LazyGit", "LazyGitCurrentFile", "LazyGitFilterCurrentFile", "LazyGitFilter" }, config = function() vim.g.lazygit_floating_window_scaling_factor = 1 end },
	{ "rcarriga/neotest", dependencies = { "nvim-lua/plenary.nvim", "nvim-treesitter/nvim-treesitter", "antoinemadec/FixCursorHold.nvim", "haydenmeade/neotest-jest" }, config = function() require("plugins.neotest") end },
	{ "andythigpen/nvim-coverage", dependencies = "nvim-lua/plenary.nvim", cmd = { "Coverage", "CoverageSummary", "CoverageLoad", "CoverageShow", "CoverageHide", "CoverageToggle", "CoverageClear" }, config = function() require("coverage").setup() end },
	{ "mfussenegger/nvim-dap", config = function() require("plugins.dap") end, keys = { "<Leader>da", "<Leader>db", "<Leader>dc", "<Leader>dd", "<Leader>dh", "<Leader>di", "<Leader>do", "<Leader>dO", "<Leader>dt" }, dependencies = { "theHamsta/nvim-dap-virtual-text", "rcarriga/nvim-dap-ui", "mxsdev/nvim-dap-vscode-js" } },
	{ "LiadOz/nvim-dap-repl-highlights", config = true, dependencies = { "mfussenegger/nvim-dap", "nvim-treesitter/nvim-treesitter" }, build = function() if not require("nvim-treesitter.parsers").has_parser("dap_repl") then vim.cmd(":TSInstall dap_repl") end end },
}
