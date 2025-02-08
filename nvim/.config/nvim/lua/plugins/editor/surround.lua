return {
	"kylechui/nvim-surround",
	version = "*", -- Use for stability; omit to use `main` branch for the latest features
	event = "VeryLazy",
	config = function()
		require("nvim-surround").setup({
			aliases = {
				["b"] = "b",  -- Map "b" to our LaTeX bold
			},
			surrounds = {
				-- LaTeX text styles
				b = {
					add = function()
						return {
							{ "\\textbf{" },
							{ "}" },
						}
					end,
				},
				i = {
					add = function()
						return {
							{ "\\textit{" },
							{ "}" },
						}
					end,
				},
				t = {
					add = function()
						return {
							{ "\\texttt{" },
							{ "}" },
						}
					end,
				},
			},
		})
	end,
}
