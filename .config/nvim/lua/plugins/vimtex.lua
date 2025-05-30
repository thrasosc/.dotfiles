return {
	"lervag/vimtex",
	lazy = false, -- we don't want to lazy load VimTeX
	-- tag = "v2.15", -- uncomment to pin to a specific release
	init = function()
		-- VimTeX configuration goes here
		vim.g.vimtex_view_method = "skim"
		vim.g.vimtex_view_skim_reading_bar = 1 -- Highlight current line
		vim.g.vimtex_view_skim_sync = 1 -- Perform forward search after compilation

		-- Return focus to Neovim after inverse search on macOS
		local function TexFocusVim()
			vim.fn.system("open -a Ghostty")
			vim.cmd("redraw!")
		end
		vim.api.nvim_create_augroup("vimtex_event_focus", { clear = true })
		vim.api.nvim_create_autocmd("User", {
			pattern = "VimtexEventViewReverse",
			callback = TexFocusVim,
			group = "vimtex_event_focus",
		})
	end,
}
