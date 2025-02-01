return {
	"goolord/alpha-nvim",
	dependencies = {
		"echasnovski/mini.icons",
		"nvim-lua/plenary.nvim",
	},
	config = function()
		local config_path = vim.fn.stdpath("config")
		require("alpha").setup(require("alpha.themes.orthodox").config)
	end,
}
