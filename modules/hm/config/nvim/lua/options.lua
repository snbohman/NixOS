require "nvchad.options"

local set = vim.opt
local sot = vim.o
set.guicursor = ""
set.number = true
set.relativenumber = true
set.wrap = false
sot.scrolloff = 10

sot.foldenable = true
set.foldmethod = "indent"
sot.foldlevel = 99
sot.foldlevelstart = 99
set.mousemodel="extend"

set.expandtab = true
set.tabstop=4
set.shiftwidth = 4
set.softtabstop = -1
set.smarttab = true

vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1
