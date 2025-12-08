return {
	{
    "nvim-neo-tree/neo-tree.nvim",
    branch = "v3.x",
    dependencies = {
      "nvim-lua/plenary.nvim",
      "MunifTanjim/nui.nvim",
      "nvim-tree/nvim-web-devicons", -- optional, but recommended
    },
    lazy = false, -- neo-tree will lazily load itself
		--@module 'neo-tree'
		--@type neotree.Config
		opts = {
			close_if_last_window = true,
			window = {
				position = "current",
			},
			filesystem = {
				filtered_items = {
					visible = true,
				},
				follow_current_file = {
					enable = true,
				},
			},
			event_handlers = {
				{
					event = "neo_tree_buffer_enter",
					handler = function()
						vim.opt_local.number = true
						vim.opt_local.relativenumber = true
					end,
				},
				{
					event = "file_opened",
					handler = function()
						vim.cmd("Neotree close")
					end,
				},
			},
		},
		config = function(_,opts)
			require("neo-tree").setup(opts)

			vim.keymap.set("n", "<leader>eh", "<cmd>Neotree reveal position=right<CR>", {noremap = true})
			vim.keymap.set("n", "<leader>et", function()
				vim.cmd("tabnew")
				vim.cmd("Neotree reveal")
			end, {noremap = true})
			vim.keymap.set("n", "<leader>er", function()
				vim.cmd("vs")
				vim.cmd("wincmd l")
				vim.cmd("Neotree reveal")
			end, {noremap = true})
			vim.keymap.set("n", "<leader>el", function()
				vim.cmd("vs")
				vim.cmd("Neotree reveal")
			end, {noremap = true})
		end,
	}
}
