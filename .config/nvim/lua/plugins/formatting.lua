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
                "latexindent",
            },
        },
    },
    {
        "stevearc/conform.nvim",
        event = { "BufWritePre" },
        cmd = { "ConformInfo" },
        -- This will provide type hinting with LuaLS
        ---@module "conform"
        ---@type conform.setupOpts
        keys = {
            {
                -- Customize or remove this keymap to your liking
                "<leader>f",
                function()
                    require("conform").format({ async = true })
                end,
                mode = "",
                desc = "Format buffer",
            },
        },
        opts = {
            -- Define your formatters
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
                tex = { "latexindent" },
            },
            -- Set default options
            default_format_opts = {
                lsp_format = "fallback",
            },
            -- Set up format-on-save
            format_on_save = { timeout_ms = 500 },
            -- Customize formatters
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
        init = function()
            -- If you want the formatexpr, here is the place to set it
            vim.o.formatexpr = "v:lua.require'conform'.formatexpr()"
        end,
    },
}
