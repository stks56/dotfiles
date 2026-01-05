vim.g.mapleader = " "

local keymap = vim.keymap.set
local opts = { noremap = true, silent = true }
local noremap = { noremap = true }

-- LSP
keymap("n", "<leader>ll", vim.lsp.buf.definition, { desc = "Lsp Definition (builtin)" })
keymap("n", "<leader>ln", vim.lsp.buf.rename, { desc = "Lsp Rename (builtin)" })
keymap("n", "<leader>la", vim.lsp.buf.code_action, { desc = "Lsp CodeAction (builtin)" })
keymap("n", "<leader>lr", vim.lsp.buf.references, { desc = "Lsp References (builtin)" })
keymap("n", "<leader>li", vim.lsp.buf.implementation, { desc = "Lsp Implementation (builtin)" })
keymap("n", "<leader>lt", vim.lsp.buf.type_definition, { desc = "Lsp TypeDefinition (builtin)" })
keymap("n", "<leader>lo", vim.lsp.buf.document_symbol, { desc = "Lsp DocumentSymbol (builtin)" })
keymap("n", "<leader>ls", vim.lsp.buf.signature_help, { desc = "Lsp SignatureHelp (builtin)" })
keymap("n", "<leader>lf", vim.lsp.buf.format, { desc = "Lsp Format (builtin)" })

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
