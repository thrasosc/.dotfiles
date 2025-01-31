return {
	"nvim-lualine/lualine.nvim",
	dependencies = { "nvim-tree/nvim-web-devicons" },
	config = function()
		require("lualine").setup({
			options = {
				section_separators = { left = "", right = "" }, -- Remove arrow shapes for sections
				component_separators = { left = "|", right = "|" }, -- Use vertical bars for components
			},
		})
	end,
}
