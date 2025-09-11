-- Initialize lazy.nvim
require("config.lazy")

-- General
vim.opt.clipboard = "unnamedplus"

-- Keymaps
vim.g.mapleader = ' '
vim.keymap.set('n', '<Esc>', ':nohlsearch<cr>')
vim.keymap.set('n', 'c', '"_c', { noremap = true })
vim.keymap.set('n', 'C', '"_C', { noremap = true })

-- Search
vim.opt.ignorecase = true -- Ignore case in search patterns
vim.opt.smartcase = true -- Override ignorecase if search contains uppercase
