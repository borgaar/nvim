vim.keymap.set("n", "<leader>e", "<Cmd>Ex<CR>", { desc = "Open file explorer" })

vim.keymap.set("n", "<A-h>", "<C-w>h", { desc = "Go to left window" })
vim.keymap.set("n", "<A-j>", "<C-w>j", { desc = "Go to below window" })
vim.keymap.set("n", "<A-k>", "<C-w>k", { desc = "Go to above window" })
vim.keymap.set("n", "<A-l>", "<C-w>l", { desc = "Go to right window" })

vim.keymap.set("t", "<A-h>", [[<C-\><C-n><C-w>h]], { desc = "Go to left window" })
vim.keymap.set("t", "<A-j>", [[<C-\><C-n><C-w>j]], { desc = "Go to below window" })
vim.keymap.set("t", "<A-k>", [[<C-\><C-n><C-w>k]], { desc = "Go to above window" })
vim.keymap.set("t", "<A-l>", [[<C-\><C-n><C-w>l]], { desc = "Go to right window" })
vim.keymap.set("t", "<A-n>", [[<C-\><C-n>]], { desc = "Leave terminal mode" })

vim.keymap.set("n", "<leader>s", "<Cmd>vsplit<CR><C-w>w", { desc = "Split current file vertically" })

local function toggle_split_orientation()
	if vim.fn.winnr("$") < 2 then
		return
	end

	vim.cmd("wincmd t")
	local before = vim.fn.winrestcmd()

	vim.cmd("wincmd K")

	-- "wincmd K" is a no-op on an already-horizontal layout, so that means we want vertical
	if vim.fn.winrestcmd() == before then
		vim.cmd("wincmd t")
		vim.cmd("wincmd H")
	end
end

vim.keymap.set("n", "<leader>d", toggle_split_orientation, { desc = "Toggle split orientation" })

local function open_terminal_rightmost()
	vim.cmd("botright 120vnew")
	vim.cmd("terminal")
	vim.cmd("startinsert")
end

vim.keymap.set("n", "<leader>t", open_terminal_rightmost, { desc = "Open a terminal on the right" })

vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv", { desc = "Move selection down" })
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv", { desc = "Move selection up" })

-- expr, so a count reaches J instead of being swallowed by the mark
vim.keymap.set("n", "J", function()
	return "mz" .. vim.v.count1 .. "J`z"
end, { expr = true, desc = "Join lines, keeping the cursor put" })

vim.keymap.set("n", "<C-d>", "<C-d>zz", { desc = "Scroll down, centered" })
vim.keymap.set("n", "<C-u>", "<C-u>zz", { desc = "Scroll up, centered" })
vim.keymap.set("n", "n", "nzzzv", { desc = "Next search result, centered" })
vim.keymap.set("n", "N", "Nzzzv", { desc = "Previous search result, centered" })
