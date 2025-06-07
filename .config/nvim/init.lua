-- Plugins
require("config.lazy")

-- General
vim.opt.spelllang = "en_gb" -- Set spell check language to British English
vim.opt.mouse = "a" -- Enable mouse support in all modes
vim.opt.clipboard = "unnamed" -- Use system clipboard (on Linux use "unnamedplus")
-- Prevent automatic comment insertion on new lines
vim.api.nvim_create_autocmd("FileType", {
    pattern = "*",
    callback = function()
        vim.opt_local.formatoptions:remove({ "c", "r", "o" })
    end,
})

-- Interface
vim.opt.number = true -- Show absolute line numbers
vim.opt.relativenumber = true -- Show relative line numbers (useful for motions like 5j)
vim.opt.wrap = false -- Don't wrap long lines
vim.opt.termguicolors = true -- Enable 24-bit RGB color support
vim.opt.wildmode = "longest,list,full" -- Command-line completion behavior
vim.diagnostic.config({ virtual_text = true }) -- Show diagnostic messages inline
vim.opt.guicursor = "n-v-c:block,i-ci-ve:block-blinkwait300-blinkon200-blinkoff150,r-cr:hor20,o:hor50" -- Blinking block cursor in insert mode
vim.opt.laststatus = 3 -- Set statusline to be global across all windows

-- Indentation
vim.opt.shiftwidth = 4 -- Number of spaces for each indentation level
vim.opt.tabstop = 4 -- Number of spaces a tab character represents
vim.opt.softtabstop = 4 -- Number of spaces for tab key in insert mode
vim.opt.expandtab = true -- Convert tabs to spaces
vim.opt.autoindent = true -- Copy indent from current line when starting new line

-- Search
vim.opt.hlsearch = true -- Highlight all search matches
vim.opt.incsearch = true -- Show search matches as you type
vim.opt.ignorecase = true -- Ignore case in search patterns
vim.opt.smartcase = true -- Override ignorecase if search contains uppercase
