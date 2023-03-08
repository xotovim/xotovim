return {{
    "xotovim/xotonight",
    lazy = true,
    priority = 1000,
	event = "BufEnter",
    config = function()
        -- load the colorscheme here
        vim.cmd([[colorscheme xotonight]])
        require("config.colorscheme")
    end
}, {
    'is0n/fm-nvim',
    lazy = true,
    event = "VeryLazy",
    config = function()
        require("plugins.fmnvim")
    end
}, {
    'petertriho/nvim-scrollbar',
    lazy = true,
    event = "VeryLazy",
    config = function()
        require('plugins.scrollbar')
    end
}, {
    'karb94/neoscroll.nvim',
    lazy = true,
    event = "VeryLazy",
    config = function()
        require('plugins.smoothscroll')
    end
}, {
    "ahmedkhalf/project.nvim",
    lazy = true,
    event = "VeryLazy",
    config = function()
        require('plugins.project')
    end
}, {
    'is0n/fm-nvim',
    lazy = true,
    event = "VeryLazy",
    config = function()
        require('plugins.fmnvim')
    end
}, {
    'lilibyte/tabhula.nvim',
    lazy = true,
    event = "VeryLazy",
    config = function()
        require('plugins.tabula')
    end
}, {
    'm-demare/hlargs.nvim',
    lazy = true,
    event = "VeryLazy",
    config = function()
        require('hlargs').setup({
            color = "#F7768E"
        })
    end
}, 

{
    'nvim-telescope/telescope-ui-select.nvim',
    lazy = true,
    event = "VeryLazy"
}, {
    'rmagatti/goto-preview',
    lazy = true,
    event = "VeryLazy",
    config = function()
        require("plugins.preview")
    end
}, {
    "https://git.sr.ht/~whynothugo/lsp_lines.nvim",
    lazy = true,
    event = "VeryLazy",
    config = function()
        require("lsp_lines").setup()
    end
},

{"nvim-lua/plenary.nvim"}, {
    "nvim-tree/nvim-web-devicons",
    config = function()
        require("nvim-web-devicons").setup({
            default = true
        })
    end
}, {
    "goolord/alpha-nvim",
    lazy = false,
    config = function()
        require("plugins.alpha")
    end
}, 

-- Treesitter

{
    "nvim-treesitter/nvim-treesitter",
    lazy = true,
    event = "VeryLazy",
    -- event = "BufReadPre",
    config = function()
        require("plugins.treesitter")
    end,
    dependencies = {"mrjones2014/nvim-ts-rainbow", "JoosepAlviste/nvim-ts-context-commentstring",
                    "nvim-treesitter/nvim-treesitter-textobjects", "RRethy/nvim-treesitter-textsubjects", {
        "m-demare/hlargs.nvim",
        config = function()
            require("hlargs").setup({
                color = "#F7768E"
            })
        end
    }}
},

-- Navigating (Telescope/Tree/Refactor)

{
    "nvim-telescope/telescope.nvim",
    lazy = false,
    config = function()
        require("plugins.telescope")
    end,
    dependencies = {{"nvim-lua/popup.nvim"}, {"nvim-lua/plenary.nvim"}, {
        "nvim-telescope/telescope-fzf-native.nvim",
        build = "make"
    }, {"cljoly/telescope-repo.nvim"}}
}, {"nvim-pack/nvim-spectre"}, {
    "nvim-tree/nvim-tree.lua",
    lazy = true,
    event = "BufEnter",
    keys = {{
        "<C-e>",
        "<cmd>lua require'nvim-tree'.toggle()<CR>",
        desc = "NvimTree"
    }},
    config = function()
        require("plugins.tree")
    end
}, {
    "gbprod/stay-in-place.nvim",
    lazy = false,
    config = true -- run require("stay-in-place").setup()
}, 

-- LSP Base

{
    "neovim/nvim-lspconfig",
    event = "BufReadPre",
    dependencies = {"mason.nvim", "williamboman/mason-lspconfig.nvim", "hrsh7th/cmp-nvim-lsp"},
    servers = nil
}, {
    "williamboman/mason.nvim",
    cmd = "Mason",
    keys = {{
        "<leader>cm",
        "<cmd>Mason<cr>",
        desc = "Mason"
    }}
}, -- Formatters
{
    "jose-elias-alvarez/null-ls.nvim",
    event = "BufReadPre",
    dependencies = {"mason.nvim"},
    config = function()
        local nls = require("null-ls")
        nls.setup({
            sources = { 
			-- nls.builtins.formatting.prettierd,
            nls.builtins.formatting.stylua, nls.builtins.diagnostics.flake8}
        })
    end
}, -- LSP Cmp
{
    "hrsh7th/nvim-cmp",
    event = "InsertEnter",
    dependencies = {"hrsh7th/cmp-nvim-lua", "hrsh7th/cmp-nvim-lsp", "hrsh7th/cmp-buffer", "hrsh7th/cmp-path",
                    "hrsh7th/cmp-cmdline", "hrsh7th/cmp-calc", "saadparwaiz1/cmp_luasnip", {
        "tzachar/cmp-tabnine",
        build = "./install.sh"
    }, {
        "David-Kunz/cmp-npm",
        config = function()
            require("plugins.cmp-npm")
        end
    }, {
        "L3MON4D3/LuaSnip",
        dependencies = "rafamadriz/friendly-snippets"
    }, {
        "zbirenbaum/copilot-cmp",
		after = { "copilot.lua", "nvim-cmp" },

        disable = not XotoVimGlobal.plugins.copilot.enabled,
 
        config = function()
            require("copilot_cmp").setup({
				formatters = {
					insert_text = require("copilot_cmp.format").remove_existing,
					label = require("copilot_cmp.format").format_label_text,
					-- insert_text = require("copilot_cmp.format").format_insert_text,
					preview = require("copilot_cmp.format").deindent,
				  },
			})
        end
    }},
    config = function()
        require("plugins.cmp")
    end
}, 

-- LSP Addons

{"onsails/lspkind-nvim"}, {
    "folke/trouble.nvim",
    cmd = {"TroubleToggle", "Trouble"},
    config = function()
        require("plugins.trouble")
    end
}, {"nvim-lua/popup.nvim"}, {
    "ChristianChiarulli/nvim-gps",
    branch = "text_hl",
    config = function()
        require("plugins.gps")
    end
}, {"jose-elias-alvarez/typescript.nvim"}, {
    "axelvc/template-string.nvim",
    event = "InsertEnter",
    ft = {"javascript", "typescript", "javascriptreact", "typescriptreact"},
    config = true -- run require("template-string").setup()
}, {
    "lvimuser/lsp-inlayhints.nvim",
    branch = "main", -- or "anticonceal"
    config = function()
        require("plugins.inlay-hints")
    end
}, -- General
{
    "AndrewRadev/switch.vim",
    lazy = false
}, {
    "AndrewRadev/splitjoin.vim",
    lazy = false
}, {
    "numToStr/Comment.nvim",
    lazy = false,
    branch = "jsx",
    config = function()
        require("plugins.comment")
    end
}, {"LudoPinelli/comment-box.nvim"}, {
    "akinsho/nvim-toggleterm.lua",
    lazy = false,
    branch = "main",
    config = function()
        require("plugins.toggleterm")
    end
}, {
    "tpope/vim-repeat",
    lazy = false
}, {
    "tpope/vim-speeddating",
    lazy = false
}, {
    "dhruvasagar/vim-table-mode",
    ft = {"markdown"}
}, {
    "mg979/vim-visual-multi",
    keys = {"<C-n>", "<C-Up>", "<C-Down>", "<S-Up>", "<S-Down>", "<S-Left>", "<S-Right>"},
    config = function()
        vim.g.VM_leader = ";"
    end
}, {
    "nacro90/numb.nvim",
    lazy = false,
    config = function()
        require("plugins.numb")
    end
}, {
    "folke/todo-comments.nvim",
    lazy = false,
    event = "BufEnter",
    config = function()
        require("plugins.todo-comments")
    end
}, {
    "folke/zen-mode.nvim",
    cmd = {"ZenMode"},
    config = function()
        require("plugins.zen")
    end,
    disable = not XotoVimGlobal.plugins.zen.enabled
}, {
    "folke/twilight.nvim",
    config = true,
    disable = not XotoVimGlobal.plugins.zen.enabled
}, {
    "ggandor/lightspeed.nvim",
    config = function()
        require("plugins.lightspeed")
    end
}, {
    "folke/which-key.nvim",
    event = "VeryLazy",
    lazy = true,
    config = function()
        require("plugins.which-key")
    end
}, 
{
    "romgrk/barbar.nvim",
    dependencies = {"nvim-tree/nvim-web-devicons"},
    event = "BufAdd",
    config = function()
        require("plugins.barbar")
    end
}, {"antoinemadec/FixCursorHold.nvim"}, -- Needed while issue https://github.com/neovim/neovim/issues/12587 is still open
        {
    "rcarriga/nvim-notify",
    config = function()
        require("notify").setup({
            background_colour = "#000000"
        })
    end,
    init = function()
        local banned_messages = {"no information available",
                                 "lsp[tsserver] inlay hints request failed. requires typescript 4.4+."}
        vim.notify = function(msg, ...)
            for _, banned in ipairs(banned_messages) do
                if msg == banned then
                    return
                end
            end
            require("notify")(msg, ...)
        end
    end
}, {
    "vuki656/package-info.nvim",
    event = "BufEnter package.json",
    config = function()
        require("plugins.package-info")
    end
}, {
    "iamcco/markdown-preview.nvim",
    build = "cd app && npm install",
    setup = function()
        vim.g.mkdp_filetypes = {"markdown"}
    end,
    ft = {"markdown"}
}, {
    "declancm/cinnamon.nvim",
    config = function()
        require("plugins.cinnamon")
    end
}, {
    "airblade/vim-rooter",
    setup = function()
        vim.g.rooter_patterns = XotoVimGlobal.plugins.rooter.patterns
    end
}, {
    "Shatur/neovim-session-manager",
    lazy = false,
    config = function()
        require("plugins.session-manager")
    end
}, {
    "kylechui/nvim-surround",
    lazy = false,
    config = true
}, {
    "sunjon/shade.nvim",
    config = function()
        require("shade").setup()
        require("shade").toggle()
    end
}, {
    "kevinhwang91/nvim-ufo",
    dependencies = "kevinhwang91/promise-async",
    config = function()
        vim.keymap.set("n", "zR", require("ufo").openAllFolds)
        vim.keymap.set("n", "zM", require("ufo").closeAllFolds)
        vim.keymap.set("n", "zr", require("ufo").openFoldsExceptKinds)
    end
}, {
    "echasnovski/mini.align",
    lazy = false,
    version = false,
    config = function()
        require("mini.align").setup()
    end
}, {
    "rareitems/printer.nvim",
    lazy = false,
    config = function()
        require("plugins.printer")
    end
}, 

{
    "lukas-reineke/indent-blankline.nvim",
    event = "BufReadPre",
    config = function()
        require("plugins.indent")
    end
}, 

-- Snippets & Language & Syntax
{
    "windwp/nvim-autopairs",
    event = "InsertEnter",
    config = function()
        require("plugins.autopairs")
    end
}, {
    "NvChad/nvim-colorizer.lua",
    config = function()
        require("plugins.colorizer")
    end
}, 

{
    "zbirenbaum/copilot.lua",
    disable = not XotoVimGlobal.plugins.copilot.enabled,
    event = "InsertEnter",
	-- config = true
    config = function()
        vim.g.copilot_tab_fallback = ""
        vim.g.copilot_assume_mapped = true
        vim.g.copilot_no_tab_map = true
        local copilotObject = require("plugins.copilot")
        require("copilot").setup({copilotObject})
      end,
}, 
-- Git
{
    "lewis6991/gitsigns.nvim",
    event = "BufReadPre",
    dependencies = {"nvim-lua/plenary.nvim"},
    config = function()
        require("plugins.git.signs")
    end
}, {
    "sindrets/diffview.nvim",
    event = "BufRead",
    config = function()
        require("plugins.git.diffview")
    end
}, {
    "akinsho/git-conflict.nvim",
    config = function()
        require("plugins.git.conflict")
    end
}, {
    "ThePrimeagen/git-worktree.nvim",
    keys = {"<Leader>gwc", "<Leader>gww"},
    config = function()
        require("plugins.git.worktree")
    end
}, {
    "kdheepak/lazygit.nvim",
    cmd = {"LazyGit", "LazyGitCurrentFile", "LazyGitFilterCurrentFile", "LazyGitFilter"},
    config = function()
        vim.g.lazygit_floating_window_scaling_factor = 1
    end
}, -- Testing
{
    "rcarriga/neotest",
    dependencies = {"nvim-lua/plenary.nvim", "nvim-treesitter/nvim-treesitter", "antoinemadec/FixCursorHold.nvim",
                    "haydenmeade/neotest-jest"},
    config = function()
        require("plugins.neotest")
    end
}, -- DAP
{
    "mfussenegger/nvim-dap",
    config = function()
        require("plugins.dap")
    end,
    keys = {"<Leader>da", "<Leader>db", "<Leader>dc", "<Leader>dd", "<Leader>dh", "<Leader>di", "<Leader>do",
            "<Leader>dO", "<Leader>dt"},
    dependencies = {"theHamsta/nvim-dap-virtual-text", "rcarriga/nvim-dap-ui"}
}}
