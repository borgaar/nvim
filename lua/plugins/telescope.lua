return {
	"nvim-telescope/telescope.nvim",
	dependencies = { "nvim-lua/plenary.nvim" },
	cmd = "Telescope",
	keys = {
		{
			"<leader>ff",
			function()
				require("telescope.builtin").find_files({ hidden = true })
			end,
			desc = "Find files",
		},
		{
			"<leader>fw",
			function()
				require("telescope.builtin").grep_string({ search = vim.fn.input("Grep > ") })
			end,
			desc = "Grep for a word",
		},
	},
}
