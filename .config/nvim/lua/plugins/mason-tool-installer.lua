return {
    "WhoIsSethDaniel/mason-tool-installer.nvim", -- Ensure installed formatters, linters (mason-lspconfig only downloads LSPs)
    opts = {
        ensure_installed = {
            -- Formatters
            "stylua",
            "prettier",
            "isort",
            "black",
            "clang-format",
            "rustfmt",
            "typstyle",
            "latexindent",

            -- Linters
            "swiftlint",
        },
    },
}
