return {
    "nvim-tree/nvim-tree.lua",
    version = "*",
    lazy = false,
    dependencies = {
        "nvim-tree/nvim-web-devicons",
    },
    config = function()
        -- Disable default netrw file explorer that comes with Neovim
        vim.g.loaded_netrw = 1
        vim.g.loaded_netrwPlugin = 1

        local api = require("nvim-tree.api")

        -- Start of "h, j, k, l Style Navigation And Editing" recipe callbacks
        local function edit_or_open()
            local node = api.tree.get_node_under_cursor()

            if node.nodes ~= nil then
                -- expand or collapse folder
                api.node.open.edit()
            else
                -- open file
                api.node.open.edit()
                -- Close the tree if file was opened
                api.tree.close()
            end
        end

        -- open as vsplit on current node
        local function vsplit_preview()
            local node = api.tree.get_node_under_cursor()

            if node.nodes ~= nil then
                -- expand or collapse folder
                api.node.open.edit()
            else
                -- open file as vsplit
                api.node.open.vertical()
            end

            -- Finally refocus on tree if it was lost
            api.tree.focus()
        end
        -- End of "h, j, k, l Style Navigation And Editing" recipe callbacks

        require("nvim-tree").setup({
            view = {
                width = 42,
                side = "right",
                relativenumber = true,
            },
            renderer = {
                indent_markers = {
                    enable = true,
                },
            },
            actions = {
                open_file = {
                    window_picker = {
                        enable = true,
                    },
                },
            },
            filters = {
                dotfiles = true,
                git_ignored = false,
            },

            on_attach = function(bufnr)
                local opts = function(desc)
                    return { desc = "nvim-tree: " .. desc, buffer = bufnr, noremap = true, silent = true, nowait = true }
                end
                -- default mappings
                api.config.mappings.default_on_attach(bufnr)

                -- custom mappings
                vim.keymap.set("n", "?", api.tree.toggle_help, opts("Help"))

                -- "h, j, k, l Style Navigation And Editing" recipe mappings
                vim.keymap.set("n", "l", edit_or_open, opts("Edit Or Open"))
                vim.keymap.set("n", "L", vsplit_preview, opts("Vsplit Preview"))
                vim.keymap.set("n", "h", api.tree.close, opts("Close"))
                vim.keymap.set("n", "H", api.tree.collapse_all, opts("Collapse All"))
            end,
        })
        -- Global "h, j, k, l Style Navigation And Editing" recipe mappings
        vim.api.nvim_set_keymap("n", "<C-h>", ":NvimTreeToggle<cr>", { silent = true, noremap = true })
    end,
}
