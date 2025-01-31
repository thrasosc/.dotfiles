return {
	"nvim-neo-tree/neo-tree.nvim",
	dependencies = {
		"nvim-lua/plenary.nvim",
		"nvim-tree/nvim-web-devicons", -- not strictly required, but recommended
		"MunifTanjim/nui.nvim",
		-- {"3rd/image.nvim", opts = {}}, -- Optional image support in preview window: See `# Preview Mode` for more information
	},
	config = function()
		vim.keymap.set("n", "<leader>e", ":Neotree toggle<CR>", {})
		require("neo-tree").setup({
			popup_border_style = "rounded",
			filesystem = {
				follow_current_file = {
					enabled = true, -- This will find and focus the file in the active buffer every time
				},
			},
			use_libuv_file_watcher = true, -- This will use the OS level file watchers to detect changes
			window = {
				position = "right",
				mappings = {
					["l"] = "open",
					["h"] = "close_node",
				},
			},
		})
	end,
}
