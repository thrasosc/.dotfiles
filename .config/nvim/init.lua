-- General
vim.opt.clipboard = "unnamedplus"

-- Keymaps
vim.g.mapleader = ' '
vim.keymap.set('n', '<Esc>', ':nohlsearch<cr>')

-- Search
vim.opt.ignorecase = true -- Ignore case in search patterns
vim.opt.smartcase = true -- Override ignorecase if search contains uppercase
