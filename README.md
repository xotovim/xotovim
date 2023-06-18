# xotovim: Neovim Config

[![Last commit](https://img.shields.io/github/last-commit/xotovim/xotovim?style=for-the-badge)](https://github.com/xotovim/xotovim/commits/development)
![Stars](https://img.shields.io/github/stars/xotovim/xotovim?style=for-the-badge)
![License](https://img.shields.io/github/license/xotovim/xotovim?style=for-the-badge)
![Neovim Version](https://img.shields.io/badge/For%20Neovim-0.9+-yellowgreen?style=for-the-badge&logo=neovim&logoColor=d8abbb&color=d8abbb)

### A non-minimal Neovim config built to work most efficiently with any development

## Features 💠

- Recommended default theme: [XotoNight](https://github.com/xotovim/xotonight)
- Highly performant even with a lot of plugins
- Lazy loaded
- Extendable LSP configuration
- Support for [TailwindCSS](https://tailwindcss.com/) with highlighted colors
- Support for [Tabnine](https://www.tabnine.com/) and copilot
- JSON autocompletion for most popular Frontend config
- NPM packages autocompletion
- Internal [Jest](https://github.com/facebook/jest) testing
- Treesitter-based folding
- Git management with [Lazygit](https://github.com/jesseduffield/lazygit), custom telescope commits view with [git-delta](https://github.com/dandavison/delta), [gitsigns](https://github.com/lewis6991/gitsigns.nvim) & [diffview](https://github.com/sindrets/diffview.nvim), custom git blame

And of course usage of [telescope](https://github.com/nvim-telescope/telescope.nvim), [nvim-tree](https://github.com/kyazdani42/nvim-tree.lua), [barbar](https://github.com/romgrk/barbar.nvim), [cmp](https://github.com/hrsh7th/nvim-cmp), [treesitter](https://github.com/nvim-treesitter/nvim-treesitter), [blankline](https://github.com/lukas-reineke/indent-blankline.nvim) & more!

## Screenshots 📸

Dashboard

![Dashboard](./.screenshots/1-alpha.png)

## Installation ⚡️

Copy it into your terminal:

```bash
# install nvim 8
bash <(curl -s https://raw.githubusercontent.com/xotovim/xotovim/development/.install/nvim.sh)

# install xotovim
git clone git@github.com:xotovim/xotovim.git ~/.config/nvim
```

After install configuration:

1. Treesitter Languages are <ins>installed</ins> by default.\
   If you wish to add more of them make sure to run `:TSInstall <lang>` for specific language you want to install and configure them in the lsp folder. 
2. LSP servers are enabled by default. You can check installed LSP servers by :Mason command.

## Configuration 💻

To change xotovim related config use the `config.lua` file.\
To change vim settings use the `settings.lua` file.

