-- Bootstrap lazy.nvim
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not (vim.uv or vim.loop).fs_stat(lazypath) then
	local lazyrepo = "https://github.com/folke/lazy.nvim.git"
	local out = vim.fn.system({ "git", "clone", "--filter=blob:none", "--branch=stable", lazyrepo, lazypath })
	if vim.v.shell_error ~= 0 then
		vim.api.nvim_echo({
			{ "Failed to clone lazy.nvim:\n", "ErrorMsg" },
			{ out, "WarningMsg" },
			{ "\nPress any key to exit..." },
		}, true, {})
		vim.fn.getchar()
		os.exit(1)
	end
end
vim.opt.rtp:prepend(lazypath)

-- Make sure to setup `mapleader` and `maplocalleader` before
-- loading lazy.nvim so that mappings are correct.
-- This is also a good place to setup other settings (vim.opt)
vim.g.mapleader = " "
vim.g.maplocalleader = "\\"
vim.opt.tabstop = 2 -- Number of spaces that a tab represents
vim.opt.shiftwidth = 2 -- Number of spaces to use for each indentation
vim.opt.expandtab = true -- Use spaces instead of actual tab characters
vim.opt.softtabstop = 2 -- Number of spaces to insert when pressing Tab
vim.wo.relativenumber = true -- Enable relative numbers
vim.opt.clipboard = "unnamedplus" -- Yank to system clipboard
-- vim.o.wrap = false -- Disable line wrapping
vim.opt.breakindent = true -- Maintain indentation of wrapped lines
vim.opt.linebreak = true -- Wrap at word boundaries instead of single letters
vim.opt.guicursor = "n-v-c:block,i-ci-ve:block-blinkwait300-blinkon200-blinkoff150,r-cr:hor20,o:hor50" -- Configure cursor to be a blinking block in insert mode
vim.opt.spelllang = "en_gb"
vim.opt.spell = true

-- Setup lazy.nvim
require("lazy").setup({
	spec = {
		-- import your plugins
		{ import = "plugins" },
	},
	-- Configure any other settings here. See the documentation for more details.
	-- automatically check for plugin updates
	checker = { enabled = true },
})
