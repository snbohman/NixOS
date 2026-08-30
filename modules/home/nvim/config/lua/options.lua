vim.cmd.colorscheme("gruvbox")

local set = vim.opt
local sot = vim.o
set.guicursor = "a:block"
set.number = true
set.relativenumber = true
set.wrap = false
set.scrolloff = 6
set.colorcolumn = "80"

sot.foldenable = true
set.foldmethod = "indent"
sot.foldlevel = 99
sot.foldlevelstart = 99
set.mousemodel = "extend"

set.expandtab = true
set.tabstop = 4
set.shiftwidth = 4
set.softtabstop = -1
set.smarttab = true
vim.opt.showtabline = 0

vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1
vim.opt.clipboard = "unnamedplus"
vim.opt.signcolumn = "no"
vim.o.numberwidth = 4

vim.opt.exrc = true
vim.opt.secure = true

vim.diagnostic.config({
    underline = false,
    signs = true,
    virtual_text = false,
    severity_sort = true,
})

require("statuscolumn")
require("simpl")
