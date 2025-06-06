return {
    {
        "mason-org/mason-lspconfig.nvim", -- Bridge between Mason and Neovim
        opts = {
            ensure_installed = { -- LSPs
                "lua_ls",
                "pyright",
                "ts_ls",
                "rust_analyzer",
                "clangd",
                "tinymist",
                "texlab",
            },
        },
        dependencies = {
            { "mason-org/mason.nvim", opts = {} }, -- Package manager for LSPs
            "neovim/nvim-lspconfig",
        },
    },
    {
        "neovim/nvim-lspconfig", -- Official Neovim LSP plugin
        dependencies = { "saghen/blink.cmp", "nvim-telescope/telescope.nvim" },
        config = function()
            local lspconfig = require("lspconfig")
            local capabilities = require("blink.cmp").get_lsp_capabilities()

            -- Swift
            lspconfig.sourcekit.setup({
                capabilities = require("blink.cmp").get_lsp_capabilities({
                    workspace = {
                        didChangeWatchedFiles = {
                            dynamicRegistration = true,
                        },
                    },
                }),
            })
            -- Lua
            lspconfig.lua_ls.setup({ capabilities = capabilities })
            -- Python
            lspconfig.pyright.setup({ capabilities = capabilities })
            -- Typescript
            lspconfig.ts_ls.setup({ capabilities = capabilities })
            -- Rust
            lspconfig.rust_analyzer.setup({ capabilities = capabilities })
            -- C/C++
            lspconfig.clangd.setup({ capabilities = capabilities })
            -- Typst
            lspconfig.tinymist.setup({
                settings = {
                    formatterMode = "typstyle",
                    exportPdf = "onType",
                    semanticTokens = "disable",
                },
                capabilities = capabilities,
            })
            -- LaTeX
            lspconfig.texlab.setup({ capabilities = capabilities })

            -- Use LspAttach autocommand to only map the following keys
            -- after the language server attaches to the current buffer
            vim.api.nvim_create_autocmd("LspAttach", {
                group = vim.api.nvim_create_augroup("UserLspConfig", {}),
                callback = function(ev)
                    -- Enable completion triggered by <c-x><c-o>
                    vim.bo[ev.buf].omnifunc = "v:lua.vim.lsp.omnifunc"

                    -- Buffer local mappings.
                    -- See `:help vim.lsp.*` for documentation on any of the below functions
                    local opts = { buffer = ev.buf }

                    opts.desc = "Show LSP references"
                    vim.keymap.set("n", "gR", "<cmd>Telescope lsp_references<CR>", opts)

                    opts.desc = "Go to declaration"
                    vim.keymap.set("n", "gD", vim.lsp.buf.declaration, opts)

                    opts.desc = "Show LSP definitions"
                    vim.keymap.set("n", "gd", "<cmd>Telescope lsp_definitions<CR>", opts)

                    opts.desc = "Show LSP implementations"
                    vim.keymap.set("n", "gi", "<cmd>Telescope lsp_implementations<CR>", opts)

                    opts.desc = "Show LSP type definitions"
                    vim.keymap.set("n", "gt", "<cmd>Telescope lsp_type_definitions<CR>", opts)

                    opts.desc = "See available code actions"
                    vim.keymap.set({ "n", "v" }, "<leader>ca", vim.lsp.buf.code_action, opts)

                    opts.desc = "Smart rename"
                    vim.keymap.set("n", "<leader>rn", vim.lsp.buf.rename, opts)

                    opts.desc = "Show buffer diagnostics"
                    vim.keymap.set("n", "<leader>D", "<cmd>Telescope diagnostics bufnr=0<CR>", opts)

                    opts.desc = "Show line diagnostics"
                    vim.keymap.set("n", "<leader>d", vim.diagnostic.open_float, opts)

                    opts.desc = "Go to previous diagnostic"
                    vim.keymap.set("n", "[d", vim.diagnostic.goto_prev, opts)

                    opts.desc = "Go to next diagnostic"
                    vim.keymap.set("n", "]d", vim.diagnostic.goto_next, opts)

                    opts.desc = "Show documentation for what is under cursor"
                    vim.keymap.set("n", "K", vim.lsp.buf.hover, opts)
                end,
            })
        end,
    },
}
