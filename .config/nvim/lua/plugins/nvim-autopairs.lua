return {
	"windwp/nvim-autopairs",
	event = "InsertEnter",
	config = function()
		require("nvim-autopairs").setup({
			check_ts = true, -- Optional, for Treesitter integration
		})
		-- npairs.add_rules({
		-- 	require("nvim-autopairs.rule")("$", "$", { "tex", "latex", "markdown" }),
		-- })
	end,
}
