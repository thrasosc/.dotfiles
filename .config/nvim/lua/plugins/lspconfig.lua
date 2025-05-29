return {
    {
        "mason-org/mason-lspconfig.nvim", -- Bridge between Mason and Neovim
        opts = {
            ensure_installed = {
                "lua_ls",
                "pyright",
                "ts_ls",
                "rust_analyzer",
                "clangd"
            }
        },
        dependencies = {
            { "mason-org/mason.nvim", opts = {} }, -- Package manager for LSPs
            "neovim/nvim-lspconfig",
        },
    },
    {
        "neovim/nvim-lspconfig", -- Official Neovim LSP plugin
        config = function()
            local lspconfig = require("lspconfig")

            lspconfig.lua_ls.setup({})
            lspconfig.pyright.setup({})
            lspconfig.ts_ls.setup({})
            lspconfig.rust_analyzer.setup({})
            lspconfig.clangd.setup({})
        end
    }
}
