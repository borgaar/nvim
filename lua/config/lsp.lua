-- Advertise cmp's extra client capabilities (snippets, resolve, label details) to every server
vim.lsp.config("*", {
	capabilities = require("cmp_nvim_lsp").default_capabilities(),
})

vim.lsp.enable({
	"clangd",
	"jsonnet_ls",
	"lemminx",
	"leanls",
	"lua_ls",
	"pyright",
	"rust_analyzer",
	"tailwindcss",
	"vtsls",
})

vim.api.nvim_create_autocmd("LspAttach", {
	group = vim.api.nvim_create_augroup("config.lsp", { clear = true }),
	callback = function(ev)
		vim.keymap.set("n", "gd", vim.lsp.buf.definition, { buf = ev.buf, desc = "Go to definition" })

		-- Overrides the global grr: the loclist survives the DiagnosticChanged qflist rewrite
		vim.keymap.set("n", "grr", function()
			vim.lsp.buf.references(nil, { loclist = true })
		end, { buf = ev.buf, desc = "Go to references" })
	end,
})
