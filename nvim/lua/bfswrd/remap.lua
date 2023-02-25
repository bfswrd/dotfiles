function map(mode, lhs, rhs, opts)
    local options = { noremap = true, silent = true }
    if opts then options = vim.tbl_extend('force', options, opts) end
    vim.keymap.set(mode, lhs, rhs, options)
end

map("", "<Space>", "<Nop>")
vim.g.mapleader = " "
vim.g.maplocalleader = " "
map("n", "<leader>p", ":Ex<CR>")
map("n", ";", ":", { nowait = true })

map("n", "<TAB>", ":bnext<CR>")
map("n", "<S-TAB>", ":bprevious<CR>")

map("v", "K", ":m '<-2<CR>gv=gv")
map("v", "J", ":m '>+1<CR>gv=gv")

map("n", "n", "nzzzv")
map("n", "N", "Nzzzv")

-- Splits
map('n', '<leader>v', '<C-w>v<C-w>l') -- open a vertical split and switch to it
map('n', '<leader>h', '<C-w>s<C-w>j') -- open a horizontal split and switch to it

map("n", "<C-d>", "<C-d>zz")
map("n", "<C-u>", "<C-u>zz")

-- Перескакиваем по окнам
map('n', '<Left>', '<C-w>h')
map('n', '<Down>', '<C-w>j')
map('n', '<Up>', '<C-w>k')
map('n', '<Right>', '<C-w>l')

map("n", "<leader>x", ":bd<CR>")

-- Переключает чиселки
map('n', '<F10>', ':set number! relativenumber! relativenumber?<CR>')

-- next greatest remap ever : asbjornHaland
map({ "n", "v" }, "<leader>y", [["+y]])
map("n", "<leader>Y", [["+Y]])

map({ "n", "v" }, "d", [["_d]])

-- This is going to get me cancelled
map("i", "jk", "<Esc>")

map("n", "Q", "<nop>")

map("n", "<leader>s", [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]])

map("n", "<leader><leader>", ":noh<CR>")

-- Plugins
-- NvimTree
map("n", "<leader>E", "<cmd> NvimTreeToggle <CR>")
map("n", "<leader>e", "<cmd> NvimTreeFocus <CR>")
