require('cmp-npm').setup({
  ignore = {},
  only_semantic_versions = true,
  only_latest_version = false,
  sources = { { name = 'npm', keyword_length = 3 }, }
})

