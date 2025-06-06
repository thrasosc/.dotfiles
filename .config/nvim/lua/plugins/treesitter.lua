return {
    "nvim-treesitter/nvim-treesitter",
    branch = "master",
    lazy = false,
    build = ":TSUpdate",
    config = function()
        require("nvim-treesitter.configs").setup({
            auto_install = true,
            ignore_install = { "latex" }, -- Interferes with vimtex
            highlight = { enable = true },
            indent = { enable = true },
        })
    end,
}
