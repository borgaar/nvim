local function resize(direction, amount)
	return function()
		require("smart-splits")["resize_" .. direction](amount)
	end
end

local function swap(direction)
	return function()
		require("smart-splits")["swap_buf_" .. direction]()
	end
end

return {
	{
		"mrjones2014/smart-splits.nvim",
		opts = {},
		keys = {
			{ "<C-h>", resize("left", 5), desc = "Resize split left" },
			{ "<C-j>", resize("down", 2), desc = "Resize split down" },
			{ "<C-k>", resize("up", 2), desc = "Resize split up" },
			{ "<C-l>", resize("right", 5), desc = "Resize split right" },
			{ "<leader>h", swap("left"), desc = "Swap buffer left" },
			{ "<leader>j", swap("down"), desc = "Swap buffer down" },
			{ "<leader>k", swap("up"), desc = "Swap buffer up" },
			{ "<leader>l", swap("right"), desc = "Swap buffer right" },
		},
	},
	{
		"voldikss/vim-floaterm",
		keys = {
			{
				"<A-i>",
				"<Cmd>FloatermNew --height=0.9 --width=0.6 --wintype=float<CR>",
				desc = "Open floating terminal",
			},
		},
	},
}
