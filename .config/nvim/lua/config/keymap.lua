vim.g.mapleader = " "

local keymap = vim.keymap.set
local opts = { noremap = true, silent = true }
local noremap = { noremap = true }

-- LSP
keymap("n", "grd", vim.lsp.buf.document_symbol, { desc = "Lsp DocumentSymbol (builtin)" })
keymap("n", "grs", vim.lsp.buf.signature_help, { desc = "Lsp SignatureHelp (builtin)" })
keymap("n", "grR", "<cmd>lsp restart<CR>", { desc = "Lsp Restart" })

-- Redo reverse u
keymap("n", "U", "<c-r>", opts)

-- Clear Slash Search
keymap("n", "<c-r>", ":nohlsearch<CR>", opts)

-- x to blackhole register
keymap("n", "x", '"_d', opts)
keymap("n", "xx", "_dd", opts)
keymap("n", "X", '"_D', opts)
keymap("x", "x", '"_x', opts)
keymap("o", "x", "d", noremap)

-- select innner word on space
keymap("o", "i<space>", "iW", opts)
keymap("x", "i<spcae>", "iW", noremap)

-- terminal mode escape
keymap("t", "<C-\\>", "<C-\\><C-n>", opts)
