-- Plugins
require("config.lazy")

-- General Settings
vim.cmd("setlocal spelllang=en_gb")
vim.cmd("set mouse=a")
vim.cmd("set clipboard=unnamed") -- on Linux this needs to be unnamedplus

-- Interface
vim.cmd("set number")
vim.cmd("set relativenumber")
vim.cmd("set nowrap")
vim.cmd("set termguicolors")
vim.cmd("set wildmode=longest,list,full")
vim.diagnostic.config({ virtual_text = true })
vim.cmd("set background=dark")
vim.cmd([[colorscheme gruvbox]])

-- Indentation
vim.cmd("set shiftwidth=4")
vim.cmd("set tabstop=4")
vim.cmd("set softtabstop=4")
vim.cmd("set expandtab")
vim.cmd("set autoindent")

-- Searching
vim.cmd("set hlsearch")
vim.cmd("set incsearch")
vim.cmd("set ignorecase")
vim.cmd("set smartcase")
