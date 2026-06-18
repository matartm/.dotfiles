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

vim.filetype.add({
  extension = {
    vert = "glsl",
    frag = "glsl",
    geom = "glsl",
    tesc = "glsl",
    tese = "glsl",
    comp = "glsl",
    fs = "glsl",
    vs = "glsl",
  },
})

vim.opt.foldlevel = 99
vim.opt.foldlevelstart = 99
vim.opt.foldenable = true
vim.opt.foldcolumn = "1"
vim.opt.foldtext = ""

vim.api.nvim_create_autocmd("BufReadPost", {
    callback = function(args)
        local ok = pcall(vim.treesitter.start, args.buf)
        if ok then
            vim.wo[0][0].foldmethod = "expr"
            vim.wo[0][0].foldexpr = "v:lua.vim.treesitter.foldexpr()"
        else
            vim.wo[0][0].foldmethod = "indent"
        end
        vim.schedule(function()
            vim.cmd("normal! zx")  -- force recompute after parser is ready
        end)
    end,
})
