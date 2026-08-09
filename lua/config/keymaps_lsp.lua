-- ~/.config/nvim/lua/config/lsp-keymaps.lua

vim.api.nvim_create_autocmd("LspAttach", {
	callback = function(event)
		-- Navigation

		-- Go to definition
		vim.keymap.set("n", "gd", vim.lsp.buf.definition, {
			buffer = event.buf,
			desc = "Go to definition",
		})

		-- Go to declaration
		vim.keymap.set("n", "gD", vim.lsp.buf.declaration, {
			buffer = event.buf,
			desc = "Go to declaration",
		})

		-- Formatting

		-- Format entire buffer
		vim.keymap.set("n", "<leader>cf", function()
			vim.lsp.buf.format()
		end, {
			buffer = event.buf,
			desc = "Format buffer",
		})

		-- Format selected range
		vim.keymap.set("v", "<leader>cf", function()
			vim.lsp.buf.format({
				range = {
					start = vim.api.nvim_buf_get_mark(0, "<"),
					["end"] = vim.api.nvim_buf_get_mark(0, ">"),
				},
			})
		end, {
			buffer = event.buf,
			desc = "Format selection",
		})

		-- Diagnostics

		-- Show diagnostic under cursor
		vim.keymap.set("n", "<leader>cd", vim.diagnostic.open_float, {
			buffer = event.buf,
			desc = "Show diagnostic",
		})

		-- Previous error
		vim.keymap.set("n", "[e", function()
			vim.diagnostic.jump({
				count = -1,
				severity = vim.diagnostic.severity.ERROR,
			})
		end, {
			buffer = event.buf,
			desc = "Previous error",
		})

		-- Next error
		vim.keymap.set("n", "]e", function()
			vim.diagnostic.jump({
				count = 1,
				severity = vim.diagnostic.severity.ERROR,
			})
		end, {
			buffer = event.buf,
			desc = "Next error",
		})

		-- Previous warning
		vim.keymap.set("n", "[w", function()
			vim.diagnostic.jump({
				count = -1,
				severity = vim.diagnostic.severity.WARN,
			})
		end, {
			buffer = event.buf,
			desc = "Previous warning",
		})

		-- Next warning
		vim.keymap.set("n", "]w", function()
			vim.diagnostic.jump({
				count = 1,
				severity = vim.diagnostic.severity.WARN,
			})
		end, {
			buffer = event.buf,
			desc = "Next warning",
		})
	end,
})
