return {
		"akinsho/toggleterm.nvim",
		version = "*",
		opts ={size = 20},
		config = function(_,opts)
			require("toggleterm").setup(opts)
			vim.keymap.set({"n"}, "<leader>t", "<cmd>ToggleTerm<CR>", {noremap = true})
	end,
}

