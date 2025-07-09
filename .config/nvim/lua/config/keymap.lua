vim.g.mapleader = " "

vim.keymap.set("n", "i", "k")
vim.keymap.set("n", "k", "j")
vim.keymap.set("n", "j", "h")
vim.keymap.set("n", "h", "i")

vim.keymap.set("v", "i", "k")
vim.keymap.set("v", "k", "j")
vim.keymap.set("v", "j", "h")
vim.keymap.set("v", "h", "i")

vim.keymap.set("n", "<leader>/", ":<C-u>set nohlsearch<Return>")

vim.keymap.set("n", "<leader>ll", vim.lsp.buf.definition, { desc = "Lsp Definition (builtin)" })
vim.keymap.set("n", "<leader>ln", vim.lsp.buf.rename, { desc = "Lsp Rename (builtin)" })
vim.keymap.set("n", "<leader>la", vim.lsp.buf.code_action, { desc = "Lsp CodeAction (builtin)" })
vim.keymap.set("n", "<leader>lr", vim.lsp.buf.references, { desc = "Lsp References (builtin)" })
vim.keymap.set("n", "<leader>li", vim.lsp.buf.implementation, { desc = "Lsp Implementation (builtin)" })
vim.keymap.set("n", "<leader>lt", vim.lsp.buf.type_definition, { desc = "Lsp TypeDefinition (builtin)" })
vim.keymap.set("n", "<leader>lo", vim.lsp.buf.document_symbol, { desc = "Lsp DocumentSymbol (builtin)" })
vim.keymap.set("n", "<leader>ls", vim.lsp.buf.signature_help, { desc = "Lsp SignatureHelp (builtin)" })
