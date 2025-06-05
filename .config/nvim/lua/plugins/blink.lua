return {
	"saghen/blink.cmp",
	-- optional: provides snippets for the snippet source
	dependencies = { "rafamadriz/friendly-snippets" },

	-- use a release tag to download pre-built binaries
	version = "1.*",

	opts = {
		keymap = { preset = "default" },

		-- appearance = {
		-- 	-- 'mono' (default) for 'Nerd Font Mono' or 'normal' for 'Nerd Font'
		-- 	-- Adjusts spacing to ensure icons are aligned
		-- 	nerd_font_variant = "mono",
		-- },
	},
	opts_extend = { "sources.default" },
}
