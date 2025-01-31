return {
	{
		"f-person/auto-dark-mode.nvim",
		dependencies = {
			{
				"ellisonleao/gruvbox.nvim",
				priority = 1000, -- Load Gruvbox first
				config = function()
					vim.cmd("colorscheme gruvbox")
				end,
			},
		},
		config = function()
			-- Auto-dark-mode configuration
			require("auto-dark-mode").setup({
				set_dark_mode = function()
					vim.api.nvim_set_option_value("background", "dark", {})
					vim.cmd("colorscheme gruvbox") -- Set Gruvbox for dark mode
				end,
				set_light_mode = function()
					vim.api.nvim_set_option_value("background", "light", {})
					vim.cmd("colorscheme gruvbox") -- Set Gruvbox for light mode
				end,
				update_interval = 3000,
				fallback = "dark",
			})
		end,
	},
}
