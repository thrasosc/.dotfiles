return {
	"lervag/vimtex",
	lazy = false, -- we don't want to lazy load VimTeX
	init = function()
		vim.g.vimtex_view_method = "sioyek"
		vim.g.vimtex_compiler_latexmk = {
			aux_dir = "./.latexmk/aux",
			out_dir = "./.latexmk/out",
		}
		vim.g.vimtex_conceal = "abdmfgsc"
		vim.o.conceallevel = 2
	end,
}
