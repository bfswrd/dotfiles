require("bfswrd.autocmds")
require("bfswrd.options")
require("bfswrd.remap")
require("bfswrd.packer")
require("bfswrd.plugins")

vim.api.NVIM_TUI_ENABLE_CURSOR_SHAPE = 1

function R(name)
    require("plenary.reload").reload_module(name)
end

vim.g.netrw_browse_split = 0
vim.g.netrw_banner = 0
vim.g.netrw_winsize = 25
