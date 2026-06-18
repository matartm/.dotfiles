return {
    {
        "nvim-treesitter/nvim-treesitter",
        lazy = false,
        build = ":TSUpdate",
		config = function ()
			require("nvim-treesitter").setup {
				install_dir = vim.fn.stdpath('data') .. '/site'
			}
			require("nvim-treesitter").install{ "c", "cpp", "javascript", "typescript", "rust" }
		end
    },

    {
        "nvim-treesitter/nvim-treesitter-context",
        config = function()
            require("treesitter-context").setup({ enable = true, })
        end
    }
}
	--[[{
		"nvim-treesitter/nvim-treesitter",
		branch = "main",
		build = ":TSUpdate",
		config = function()
			require("nvim-treesitter").setup({
				-- A list of parser names, or "all"
				ensure_installed = {
					"vimdoc", "javascript", "typescript", "c", "lua", "rust", "jsdoc", "bash", "markdown", "markdown_inline", "perl"},


				-- Install parsers synchronously (only applied to `ensure_installed`)
				sync_install = false,

				-- Automatically install missing parsers when entering buffer
				-- Recommendation: set to false if you don"t have `tree-sitter` CLI installed locally
				auto_install = true,

				indent = {
					enable = true
				},

				highlight = {
					-- `false` will disable the whole extension
					enable = true,
					disable = function(lang, buf)
						if lang == "html" then
							print("disabled")
							return true
						end

						local max_filesize = 100 * 1024 -- 100 KB
						local ok, stats = pcall(vim.loop.fs_stat, vim.api.nvim_buf_get_name(buf))
						if ok and stats and stats.size > max_filesize then
							vim.notify(
							"File larger than 100KB treesitter disabled for performance",
							vim.log.levels.WARN,
							{title = "Treesitter"}
							)
							return true
						end
					end,

					-- Setting this to true will run `:h syntax` and tree-sitter at the same time.
					-- Set this to `true` if you depend on "syntax" being enabled (like for indentation).
					-- Using this option may slow down your editor, and you may see some duplicate highlights.
					-- Instead of true it can also be a list of languages
					additional_vim_regex_highlighting = { "markdown" },
				},
			})

			require("nvim-treesitter.parsers").templ = {
				install_info = {
					url = "https://github.com/vrischmann/tree-sitter-templ.git",
					files = {"src/parser.c", "src/scanner.c"},
					branch = "master",
				},
			}
			-- vim.treesitter.language.register("templ", "templ")
		end
	},]]
