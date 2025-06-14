return {
    "nvim-lualine/lualine.nvim",
    dependencies = { "nvim-tree/nvim-web-devicons" },
    config = function()
        require("lualine").setup({
            sections = {
                lualine_x = { "encoding", { "fileformat", symbols = { unix = "" } }, "filetype" },
            },
            options = {
                component_separators = "",
                section_separators = "",
            },
        })
    end,
}
