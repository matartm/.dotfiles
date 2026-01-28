return {
	"neovim/nvim-lspconfig",
	dependencies = {
		"stevearc/conform.nvim",
		"williamboman/mason.nvim",
		"williamboman/mason-lspconfig.nvim",
		"hrsh7th/cmp-nvim-lsp",
		"hrsh7th/cmp-buffer",
		"hrsh7th/cmp-path",
		"hrsh7th/cmp-cmdline",
		"hrsh7th/nvim-cmp",
		"L3MON4D3/LuaSnip",
		"saadparwaiz1/cmp_luasnip",
		"j-hui/fidget.nvim",
	},

	config = function()
		require("conform").setup({ --formatter
			formatters_by_ft = {
			}
		})
		local cmp = require('cmp')          --completion
		local cmp_lsp = require("cmp_nvim_lsp") --cmp integration with lsp
		local capabilities = vim.tbl_deep_extend( --combine completion tables of cmp and nvim lsp
			"force",                        --overwrite from latter
			{},                             --target
			vim.lsp.protocol.make_client_capabilities(),
			cmp_lsp.default_capabilities())

		require("fidget").setup({})  --UI bottom right
		require("mason").setup()     --LSP Package Manager
		require("mason-lspconfig").setup({ --intall basic required lsps
			ensure_installed = {
				"lua_ls",
				"gopls",
			},
		})

		vim.lsp.config("lua_ls", { --configure lua ls
			capabilities = capabilities,
			settings = {
				Lua = {
					runtime = { version = "Lua 5.1" },
					diagnostics = { globals = "vim" },
				}
			}
		})
		vim.lsp.config("clangd", {
			capabilities = capabilities,
			cmd = {
				'clangd',
				'--background-index',
				--'--compile-commands-dir=build',
				'--query-driver=**/*xtensa*,**/*riscv*',
				'--log=verbose',
			},
			root_markers = { 'sdkconfig', 'CMakeLists.txt', '.git' },
			filetypes = { 'c', 'cpp'},
		})

		vim.lsp.enable({"clangd","rust_analyzer"})
		vim.api.nvim_create_autocmd('LspAttach', {
			group = vim.api.nvim_create_augroup('UserLspConfig', {}),
			callback = function(ev)
				local opts = { buffer = ev.buf, silent = true }
				vim.keymap.set('n', 'gd', vim.lsp.buf.definition, opts)
				vim.keymap.set('n', 'gD', vim.lsp.buf.declaration, opts)
				vim.keymap.set('n', 'gi', vim.lsp.buf.implementation, opts)
				vim.keymap.set('n', 'go', vim.lsp.buf.type_definition, opts)
				vim.keymap.set('n', 'gr', vim.lsp.buf.references, opts)
				vim.keymap.set('n', 'gs', vim.lsp.buf.signature_help, opts)
				vim.keymap.set('n', 'K', vim.lsp.buf.hover, opts)
				vim.keymap.set('n', '<F2>', vim.lsp.buf.rename, opts)
				vim.keymap.set({ 'n', 'x' }, '<F3>', function()
					vim.lsp.buf.format({ async = false, timeout_ms = 10000 })
				end, opts)
				vim.keymap.set('n', '<F4>', vim.lsp.buf.code_action, opts)
			end,
		})
		local cmp_select = { behavior = cmp.SelectBehavior.Select }

		cmp.setup({
			mapping = cmp.mapping.preset.insert({
				['<C-p>'] = cmp.mapping.select_prev_item(cmp_select),
				['<C-n>'] = cmp.mapping.select_next_item(cmp_select),
				['<C-y>'] = cmp.mapping.confirm({ select = true }),
				["<C-Space>"] = cmp.mapping.complete(),
			}),
			sources = cmp.config.sources({
				{ name = 'nvim_lsp' },
				{ name = 'buffer' },
			})
		})

		vim.diagnostic.config({ --config for floating warning/error window
			--update_in_insert = true,  --realtime warnings while typing
			float = {
				focusable = true,
				style = "minimal",
				source = "if_many",
				header = "",
				prefix = "",
			},
		})
	end
}
