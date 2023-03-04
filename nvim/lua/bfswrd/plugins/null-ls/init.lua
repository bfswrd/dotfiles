local ok, null_ls = pcall(require, "null-ls")

if not ok then
	return
end

local sources = require("bfswrd.plugins.null-ls.builtins")(null_ls.builtins) or {}

null_ls.setup({
	debug = true,
	sources = sources,
})
