return {
	{
		"WhoIsSethDaniel/mason-tool-installer.nvim", -- Ensure installed formatters, linters, etc. (mason-lspconfig only downloads LSPs)
		opts = {
			ensure_installed = { -- Formatters
				"stylua",
				"prettier",
				"black",
				"isort",
				"clang-format",
                "typstyle"
			},
		},
	},
	{
		"nvimtools/none-ls.nvim", -- Integrates formatters and linters by simulating an LSP server
		config = function()
			local null_ls = require("null-ls")
			null_ls.setup({
				sources = {
					null_ls.builtins.formatting.stylua,
					null_ls.builtins.formatting.prettier,
					null_ls.builtins.formatting.black,
					null_ls.builtins.formatting.isort,
					null_ls.builtins.formatting.clang_format,
					null_ls.builtins.formatting.typstyle,
				},
			})
		end,
	},
}
