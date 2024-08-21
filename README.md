# Neovim Configuration

Neovim configuration focused on js as I'm working as a React devleoper.

## Plugins

- catppuccin/nvim
  Theme

- sindrets/diffview.nvim
  Viewer for diff changes on git

- mbbill/undotree
  I haven't really used it. As far as I know, it keep tracking typing history and manage them like a try, therefore, if you make some mistakes during undoing, you don't lose all the history, you can still restore your history.

- nvim-tree/nvim-tree.lua
  Having a file browser is good, even though it's a vim...

- nvim-telescope/telescope.nvim
  Finding files by filtering and searching text/names.

- akinsho/git-conflict.nvim
  Helper when there are conflicts on git, I haven't really used it yet. 

- lsp
  needs to udpate configuration file and learn more. So far, it's not that bad to work on React projects.

  ```
	{'VonHeikemen/lsp-zero.nvim', branch = 'v4.x'},
	{'neovim/nvim-lspconfig'},
	{'hrsh7th/cmp-nvim-lsp'},
	{'hrsh7th/nvim-cmp'},
	{"williamboman/mason.nvim"},
	{"williamboman/mason.nvim"},
	{"williamboman/mason-lspconfig.nvim"},
	{"neovim/nvim-lspconfig"},
  ```

## Keymaps

I use default key maps. Those are key maps customized.
