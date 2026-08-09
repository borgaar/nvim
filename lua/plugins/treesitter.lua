local parsers = {
	"bash",
	"c",
	"c_sharp",
	"cpp",
	"css",
	"diff",
	"gitcommit",
	"html",
	"javascript",
	"json",
	"jsonnet",
	"lua",
	"luadoc",
	"markdown",
	"markdown_inline",
	"python",
	"query",
	"rust",
	"toml",
	"tsx",
	"typescript",
	"vim",
	"vimdoc",
	"xml",
	"yaml",
}

return {
	"nvim-treesitter/nvim-treesitter",
	branch = "main",
	lazy = false,
	build = ":TSUpdate",
	config = function()
		require("nvim-treesitter").install(parsers)

		-- There is no jsonc parser, and Nvim does not fall back to json on its own
		vim.treesitter.language.register("json", "jsonc")

		vim.api.nvim_create_autocmd("FileType", {
			group = vim.api.nvim_create_augroup("config.treesitter", { clear = true }),
			callback = function(ev)
				-- Asserts for filetypes whose parser is missing or not yet installed
				pcall(vim.treesitter.start, ev.buf)
			end,
		})
	end,
}
