require("tokyonight").setup({
	transparent = true,
	styles = {
		-- Style to be applied to different syntax groups
		-- Value is any valid attr-list value for `:help nvim_set_hl`
		comments = { italic = true },
		keywords = { italic = true },
		functions = {},
		variables = {},
		-- Background styles. Can be "dark", "transparent" or "normal"
		sidebars = "transparent", -- style for sidebars, see below
		floats = "transparent", -- style for floating windows
	},
})

vim.cmd("match ExtraWhitespace /\\s\\+$/")
vim.cmd("highlight ExtraWhitespace ctermbg=red guibg=red")

vim.cmd.colorscheme("tokyonight-night")
