vim.keymap.set('n', 'i', 'k')
vim.keymap.set('n', 'k', 'j')
vim.keymap.set('n', 'j', 'h')
vim.keymap.set('n', 'h', 'i')

vim.opt.clipboard = "unnamedplus"

require("config.lazy")
