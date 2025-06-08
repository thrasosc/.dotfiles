return {
    "mfussenegger/nvim-dap",
    dependencies = {
        "jay-babu/mason-nvim-dap.nvim", -- Integrates Mason with nvim-dap
    },
    config = function()
        local dap = require("dap")

        -- Configure codelldb adapter
        dap.adapters.codelldb = {
            type = "server",
            port = "${port}",
            executable = {
                -- Replace with the actual path to codelldb
                -- Mason typically installs it at ~/.local/share/nvim/mason/bin/codelldb
                command = vim.fn.stdpath("data") .. "/mason/bin/codelldb",
                args = { "--port", "${port}" },
            },
        }

        -- Configure for Swift
        dap.configurations.swift = {
            {
                name = "Launch Swift",
                type = "codelldb",
                request = "launch",
                program = function()
                    return vim.fn.input("Path to executable: ", vim.fn.getcwd() .. "/.build/debug/", "file")
                end,
                cwd = "${workspaceFolder}",
                stopOnEntry = false,
                args = {},
                runInTerminal = false,
            },
            {
                name = "Launch Swift (Custom)",
                type = "codelldb",
                request = "launch",
                program = function()
                    return vim.fn.input("Path to executable: ", vim.fn.getcwd() .. "/", "file")
                end,
                cwd = "${workspaceFolder}",
                stopOnEntry = false,
                args = function()
                    local args_str = vim.fn.input("Arguments: ")
                    return vim.split(args_str, " ")
                end,
                runInTerminal = false,
            },
        }
    end,
}
