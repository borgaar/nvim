-- The `jsonnet` binary is jsonnet-language-server. Jsonnet is a superset of JSON that
-- also allows comments, so it parses json and jsonc too — without schema validation.
return {
	cmd = { "jsonnet" },
	filetypes = { "json", "jsonc", "jsonnet" },
	root_markers = { "jsonnetfile.json", ".git" },
}
