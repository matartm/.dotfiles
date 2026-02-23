require("config")
-- Basic settings
vim.opt.number = true
vim.opt.relativenumber = true
vim.opt.tabstop = 4
vim.opt.shiftwidth = 4
vim.opt.scrolloff = 15

-- 1. Load the Termdebug package
vim.cmd('packadd termdebug')

-- 2. Set default behavior (Optional but helpful)
vim.g.termdebug_wide = 1 -- Uses a vertical split for the source/GDB window
vim.g.termdebug_popup = 1 -- Enables a floating window for variable evaluation

