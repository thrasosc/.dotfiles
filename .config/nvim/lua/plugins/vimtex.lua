return {
    "lervag/vimtex",
    lazy = false, -- we don't want to lazy load VimTeX
    -- tag = "v2.15", -- uncomment to pin to a specific release
    init = function()
        -- VimTeX configuration goes here
        vim.g.vimtex_view_method = "skim"
        vim.g.vimtex_view_skim_reading_bar = 1 -- Highlight current line
        vim.g.vimtex_view_skim_sync = 1 -- Perform forward search after compilation
    end,
}
