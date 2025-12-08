vim.g.mapleader = " "
vim.g.maplocalleader = "\\"

local modes = { "n", "i", "v" ,"x", "t", "c", "s"}

vim.o.updatetime = 1000

vim.keymap.set(modes, "<C-h>", "<cmd>wincmd h<CR>", {noremap = true})
vim.keymap.set(modes, "<C-j>", "<cmd>wincmd j<CR>", {noremap = true})
vim.keymap.set(modes, "<C-k>", "<cmd>wincmd k<CR>", {noremap = true})
vim.keymap.set(modes, "<C-l>", "<cmd>wincmd l<CR>", {noremap = true})

vim.keymap.set({"i", "t", "c"}, "jk", "<Esc>", {noremap = true})
vim.keymap.set("v", "<leader>jk", "<Esc>", {noremap = true})
vim.keymap.set("n", "<leader>ec", "<cmd>edit $MYVIMRC<CR>")
vim.keymap.set("n", "<leader><CR>", "<cmd>lua ReloadConfig()<CR>")
vim.keymap.set("n", "<leader>l", "<cmd>Lazy<CR>")

function ReloadConfig()
	for name,_ in pairs(package.loaded) do
		local prefix = "config"
		if name:match('^'..prefix) and not name:match('^'..prefix..'.*lazy') then
			package.loaded[name] = nil
		end
	end
	dofile(vim.env.MYVIMRC)
end

