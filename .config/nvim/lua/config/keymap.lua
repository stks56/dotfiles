local opts = { noremap = true, silent = true }

vim.g.mapleader = " "

vim.keymap.set("n", "i", "k")
vim.keymap.set("n", "k", "j")
vim.keymap.set("n", "j", "h")
vim.keymap.set("n", "h", "i")

vim.keymap.set("v", "i", "k")
vim.keymap.set("v", "k", "j")
vim.keymap.set("v", "j", "h")
vim.keymap.set("v", "h", "i")

vim.keymap.set("n", "<leader>/", ":<C-u>set nohlsearch<Return>", opts)

local bufopts = { noremap = true, silent = true }
vim.keymap.set("n", "gd", vim.lsp.buf.definition, bufopts)
