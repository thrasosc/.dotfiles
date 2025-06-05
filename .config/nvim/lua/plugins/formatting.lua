return {
	{
		"WhoIsSethDaniel/mason-tool-installer.nvim", -- Ensure installed formatters, linters, etc. (mason-lspconfig only downloads LSPs)
		opts = {
			ensure_installed = { -- Formatters
				"stylua",
				"prettier",
				"isort",
				"black",
				"clang-format",
				"rustfmt",
				"typstyle",
			},
		},
	},
	{
		"stevearc/conform.nvim",
		keys = {
			{
				"<leader>f",
				function()
					require("conform").format({ async = true, lsp_fallback = true })
				end,
				mode = "",
				desc = "Format buffer",
			},
		},
		opts = {
			formatters_by_ft = {
				lua = { "stylua" },
				javascript = { "prettier" },
				json = { "prettier" },
				html = { "prettier" },
				css = { "prettier" },
				markdown = { "prettier" },
				python = { "isort", "black" }, -- Conform will run multiple formatters sequentially
				c = { "clang_format" },
				cpp = { "clang_format" },
				rust = { "rustfmt" },
				typst = { "typstyle" },
			},
			formatters = {
				stylua = {
					prepend_args = { "--indent-type", "Spaces", "--indent-width", "4" },
				},
				prettier = {
					prepend_args = { "--tab-width", "4", "--use-tabs", "false" },
				},
				clang_format = {
					prepend_args = { "--style", "{IndentWidth: 4, UseTab: Never}" },
				},
			},
		},
	},
}
