return {
	{
		"williamboman/mason.nvim",
		config = function()
			require("mason").setup()
		end,
	},
	{
		"williamboman/mason-lspconfig.nvim",
		config = function()
			require("mason-lspconfig").setup({
				ensure_installed = { "lua_ls", "texlab" },
			})
		end,
	},
	{
		"neovim/nvim-lspconfig",
		config = function()
			local lspconfig = require("lspconfig")
			
			-- Global LSP settings
			vim.diagnostic.config({
				virtual_text = true,
				signs = true,
				update_in_insert = false,
				underline = true,
				float = { border = "rounded" },
			})

			-- LSP keymaps
			vim.keymap.set("n", "gD", vim.lsp.buf.declaration, { desc = "Go to declaration" })
			vim.keymap.set("n", "gd", vim.lsp.buf.definition, { desc = "Go to definition" })
			vim.keymap.set("n", "K", vim.lsp.buf.hover, { desc = "Show hover information" })
			vim.keymap.set("n", "gi", vim.lsp.buf.implementation, { desc = "Go to implementation" })
			vim.keymap.set("n", "<leader>ca", vim.lsp.buf.code_action, { desc = "Code actions" })
			vim.keymap.set("n", "<leader>rn", vim.lsp.buf.rename, { desc = "Rename symbol" })
			vim.keymap.set("n", "<leader>D", vim.lsp.buf.type_definition, { desc = "Type definition" })
			vim.keymap.set("n", "gr", vim.lsp.buf.references, { desc = "Find references" })
			vim.keymap.set("n", "<leader>d", vim.diagnostic.open_float, { desc = "Show diagnostics" })
			vim.keymap.set("n", "[d", vim.diagnostic.goto_prev, { desc = "Previous diagnostic" })
			vim.keymap.set("n", "]d", vim.diagnostic.goto_next, { desc = "Next diagnostic" })

			-- Server configurations
			lspconfig.lua_ls.setup({
				settings = {
					Lua = {
						diagnostics = {
							globals = { "vim" }, -- Recognize vim global
						},
					},
				},
			})
			
			lspconfig.texlab.setup({})
		end,
	},
}
