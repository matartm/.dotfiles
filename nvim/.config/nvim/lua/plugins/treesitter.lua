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
