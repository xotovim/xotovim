local icons = xotovim.icons

require('package-info').setup{
  colors = {up_to_date = "#3C4048", outdated = "#fc514e", },
  icons = {enable = true, style = { up_to_date = icons.checkSquare,  outdated = icons.gitRemove,  },},
  autostart = true, 
  hide_up_to_date = true, 
  hide_unstable_versions = true, 
  package_manager = 'yarn'
}
