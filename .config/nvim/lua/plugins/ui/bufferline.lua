return {
	"akinsho/bufferline.nvim",
	version = "*",
	dependencies = "nvim-tree/nvim-web-devicons",
	config = function()
		-- Enable mousemoveevent for hover support
		vim.opt.mousemoveevent = true

		-- Buffer navigation keymaps
		vim.keymap.set("n", "<S-h>", ":BufferLineCyclePrev<CR>", { desc = "Previous buffer" })
		vim.keymap.set("n", "<S-l>", ":BufferLineCycleNext<CR>", { desc = "Next buffer" })

		require("bufferline").setup({
			options = {
				-- neo-tree integration
				offsets = {
					{
						filetype = "neo-tree",
						text = "Neo-tree",
						highlight = "Directory",
						text_align = "left",
						separator = true,
					},
				},
				-- other options
				diagnostics = "nvim_lsp",
				always_show_bufferline = true,
				separator_style = "thin",
				show_buffer_close_icons = true,
				show_close_icon = true,
				color_icons = true,
				hover = {
					enabled = true,
					delay = 50,
					reveal = { "close" },
				},
			},
		})
	end,
}
