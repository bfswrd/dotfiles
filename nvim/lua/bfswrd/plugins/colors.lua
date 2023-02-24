require("ayu").colorscheme()

function ColorMyPencils(color)
	color = color or "catppuccin"
	vim.cmd.colorscheme(color)
	vim.cmd("highlight ExtraWhitespace ctermbg=red guibg=red")
	vim.cmd("match ExtraWhitespace /\\s\\+$/")

	require("transparent").setup({
		enable = true,
	})
end

ColorMyPencils("ayu-mirage")
