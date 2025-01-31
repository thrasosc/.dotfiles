return {
	"lervag/vimtex",
	lazy = false, -- we don't want to lazy load VimTeX
	init = function()
		vim.g.vimtex_view_method = "skim"
		vim.g.vimtex_compiler_latexmk = {
			aux_dir = "./.latexmk/aux",
			out_dir = "./.latexmk/out",
		}
		-- Enable conceallevel for VimTeX
		vim.o.conceallevel = 2

		-- Configure VimTeX concealment
		vim.g.vimtex_syntax_conceal = {
			accents = 1,
			ligatures = 1,
			cites = 1,
			fancy = 1,
			spacing = 1,
			greek = 1,
			math_bounds = 1,
			math_delimiters = 1,
			math_fracs = 1,
			math_super_sub = 1,
			math_symbols = 1,
			sections = 1,
			styles = 1,
		}

		-- Add custom conceal rules for temporal logic operators
		vim.g.vimtex_syntax_custom_cmds = {
			{
				name = 'eventually',
				mathmode = true,
				concealchar = '◊',
				argstyle = 0,
			},
			{
				name = 'always',
				mathmode = true,
				concealchar = '□',
				argstyle = 0,
			},
			{
				name = 'next',
				mathmode = true,
				concealchar = '○',
				argstyle = 0,
			},
			{
				name = 'until',
				mathmode = true,
				concealchar = 'U',
				argstyle = 0,
			}
		}
	end,
}
