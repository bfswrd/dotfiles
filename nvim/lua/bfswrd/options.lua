-- UI
vim.opt.nu = true -- Номер строки
vim.opt.relativenumber = true -- Относительный номер строки
vim.opt.numberwidth = 2 -- Отступ возле строк
vim.opt.signcolumn = "yes" -- Всегда показывать смещение строк
vim.opt.ruler = true -- Показывать позицию курсора

vim.o.completeopt = "menu,menuone,noselect"

-- Табы
vim.opt.tabstop = 4
vim.opt.softtabstop = 4
vim.opt.shiftwidth = 4
vim.opt.expandtab = true
vim.opt.smartindent = true
vim.opt.autoindent = true
vim.opt.wrap = false
vim.opt.showmatch = true
vim.opt.termguicolors = true

-- Лучшее меню на свете
vim.opt.pumheight = 10
vim.opt.pumblend = 15
vim.opt.wildmode = "longest:full"
vim.opt.wildoptions = "pum"

-- Бекапы
vim.opt.swapfile = false
vim.opt.backup = false
vim.opt.undodir = os.getenv("HOME") .. "/.vim/undodir"
vim.opt.undofile = true

vim.opt.hlsearch = false
vim.opt.incsearch = true

vim.opt.scrolloff = 9
vim.opt.isfname:append("@-@")

vim.opt.updatetime = 50

vim.opt.colorcolumn = "80"
vim.opt.clipboard = "unnamed"

vim.opt.list = true -- Show some invisible characters
vim.opt.listchars = { -- Strings to use when 'list' option set.
  tab = '│ ', -- Characters to be used to show a tab.
  multispace = '⋅', -- Characters to be used to show spaces
  nbsp = '␣', -- Character to show for a non-breakable space character.
  extends = '❯', -- Character to show in last column, when 'wrap' is off
  precedes = '❮', -- Character to show in first visible column
  eol = '¬', -- Character to show at end of line       
}

