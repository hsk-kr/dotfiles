local lsp_zero = require("lsp-zero")

local lsp_attach = function(client, bufnr)
	-- this is where you enable features that only work
	-- if there is a language server active in the file
end

lsp_zero.extend_lspconfig({
	sign_text = true,
	lsp_attach = lsp_attach,
})

local opts = {
	ui = {
		icons = {
			package_installed = "✓",
			package_pending = "➜",
			package_uninstalled = "✗",
		},
	},
	max_concurrent_installers = 10,
	ensure_installed = {
		-- Lua stuff
		"lua-language-server",
		"stylua",

		-- Web dev stuff
		"css-lsp",
		"html-lsp",
		"typescript-language-server",
		"prettier",
		"prettierd",
		"tailwindcss-language-server",
		"fixjson",

		-- yaml
		"yaml-language-server",

		-- python stuff
		"pyright",
		"python-lsp-server",
		"black",

		-- go stuff
		"gopls",
		"goimports",
		"delve",
	},
}

vim.api.nvim_set_keymap("n", "gr", "<cmd>lua vim.lsp.buf.references()<CR>", { noremap = true, silent = true })

require("mason").setup(opts)

vim.api.nvim_create_user_command("MasonInstallAll", function()
	vim.cmd("MasonInstall " .. table.concat(opts.ensure_installed, " "))
end, {})

require("mason-lspconfig").setup({
	handlers = {
		function(server_name)
			require("lspconfig")[server_name].setup({})
		end,
	},
})

local cmp = require("cmp")

cmp.setup({
	sources = {
		{ name = "nvim_lsp" },
	},
	mapping = {
		["<C-y>"] = cmp.mapping.confirm({
			behavior = cmp.ConfirmBehavior.Insert,
			select = true,
		}),
		-- ['<C-.>'] = cmp.mapping.confirm({select = false}),
		["<C-e>"] = cmp.mapping.abort(),
		-- ["<C-p>"] = cmp.mapping.select_prev_item({ behavior = "select" }),
		-- ["<C-t>"] = cmp.mapping.select_next_item({ behavior = "select" }),
		["<C-p>"] = cmp.mapping(function()
			if cmp.visible() then
				cmp.select_prev_item()
			else
				cmp.complete()
			end
		end),
		["<C-n>"] = cmp.mapping(function()
			if cmp.visible() then
				cmp.select_next_item()
			else
				cmp.complete()
			end
		end),
	},
	snippet = {
		expand = function(args)
			require("luasnip").lsp_expand(args.body)
		end,
	},
})

vim.keymap.set("n", "gd", vim.lsp.buf.definition)
