return {
	cmd = { "tailwindcss-language-server", "--stdio" },
	filetypes = { "typescript", "typescriptreact", "javascript", "javascriptreact" },
	root_markers = {
		"tailwind.config.js",
		"tailwind.config.cjs",
		"tailwind.config.mjs",
		"tailwind.config.ts",
		"postcss.config.js",
	},
	-- Without this it would start in every JS project, Tailwind or not
	workspace_required = true,
}
