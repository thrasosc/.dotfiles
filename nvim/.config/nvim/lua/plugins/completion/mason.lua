return {
	"WhoIsSethDaniel/mason-tool-installer.nvim",
	dependencies = {
		"williamboman/mason.nvim",
	},
	config = function()
		require("mason-tool-installer").setup({
			ensure_installed = {
				-- Formatters
				"black", -- Python formatter
				"isort", -- Python import sorter
				"shfmt", -- Shell formatter
				"shellcheck", -- Shell linter
				"stylua", -- Lua formatter
				"prettier", -- Web formatter (JS/TS/HTML/CSS/JSON)
				"jq", -- JSON formatter
				"yamlfmt", -- YAML formatter
				"latexindent", -- LaTeX formatter
			},
			auto_update = true,
			run_on_start = true,
		})
	end,
}
