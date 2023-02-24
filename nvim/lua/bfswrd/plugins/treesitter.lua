require("nvim-treesitter.configs").setup({
	ensure_installed = { "help", "javascript", "typescript", "c", "cpp", "python", "php", "bash", "lua", "rust" },

	sync_install = false,
	auto_install = true,

	highlight = {
		enable = true,
		use_languagetree = true,
	},

	indent = {
		enable = true,
	},
})
