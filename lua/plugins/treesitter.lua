require'nvim-treesitter.configs'.setup {
  ensure_installed = { "tsx", "typescript", "javascript", "html", "css", "vue", "astro", "svelte", "gitcommit", "graphql", "json", "json5", "lua", "markdown", "prisma", "vim"},          
  sync_install = false,           
  ignore_install = { "haskell" }, 
  auto_install = true,
  highlight = { enable = true, additional_vim_regex_highlighting = true},
  incremental_selection = { enable = false },
  indent = { enable = true },
  rainbow = { enable = true, colors = { "#68a0b0", "#946EaD", "#c7aA6D"}, disable = { "html" }},
  -- context_commentstring = { enable = true, enable_autocmd = false},
  textobjects = {
    move = { enable = true, set_jumps = true,  goto_next_start = { ["]]"] = "@function.outer", ["]m"] = "@class.outer"}, goto_next_end = { ["]["] = "@function.outer", ["]M"] = "@class.outer"}, goto_previous_start = { ["[["] = "@function.outer", ["[m"] = "@class.outer"}, goto_previous_end = { ["[]"] = "@function.outer", ["[M"] = "@class.outer"} },
    select = { enable = true, lookahead = true,  keymaps = {  ["af"] = "@function.outer", ["if"] = "@function.inner", ["ac"] = "@class.outer", ["ic"] = "@class.inner"} },
    swap = {
      enable = true,
      swap_next = { ["~"] = "@parameter.inner"},
    },
  },
  textsubjects = {
    enable = true,
  },
}
