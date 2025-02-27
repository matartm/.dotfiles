-- Basic settings
vim.opt.number = true
vim.opt.relativenumber = true
vim.opt.tabstop = 4
vim.opt.shiftwidth = 4
vim.opt.expandtab = true
vim.cmd("language en_US.UTF-8")
-- Clipboard settings
vim.opt.clipboard = 'unnamedplus'
vim.g.clipboard = {
  name = 'wl-clipboard',
  copy = {
    ['+'] = 'wl-copy --foreground --type text/plain',
    ['*'] = 'wl-copy --foreground --type text/plain',
  },
  paste = {
    ['+'] = 'wl-paste --no-newline',
    ['*'] = 'wl-paste --no-newline',
  },
  cache_enabled = true,
}
