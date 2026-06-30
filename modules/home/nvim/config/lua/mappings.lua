require "nvchad.mappings"

-- add yours here

local map = vim.keymap.set

map("i", "jk", "<ESC>")

map('n', '<C-->', '<C-w>-')
map('n', '<C-+>', '<C-w>+')
map('n', '<C-<>', '<C-w><')
map('n', '<C->>', '<C-w>>')

map('n', "<leader>o", ":wqa<CR>", {silent=true})
map('n', "<leader><leader>", ":so<CR>", {silent=true})
map('n', "<leader>pdd", ":lua vim.diagnostic.disable()<CR>", { silent=true, desc="disable diagnostics"})
map('n', "<leader>pde", ":lua vim.diagnostic.enable()<CR>", { silent=true, desc="enable diagnostics" })
map('n', "<leader>s", "$0v$h", {silent=true})
map('n', "<leader>y", ":redo<CR>", {silent=true})
map('n', "<leader>xd", ":%!xxd<CR>", {silent=true})
map("n", "gD", "<cmd>lua vim.lsp.buf.declaration()<CR>", { noremap = true, silent = true })
map("n", "gd", "<cmd>lua vim.lsp.buf.definition()<CR>", { noremap = true, silent = true })
map("n", "dd", "Vd", { silent = true })
map("n", "<leader>B", ":hi Normal guibg=NONE ctermbg=NONE<CR>", { silent = true, desc = "remove bg color" })
map("n", "<leader>e", ":lua vim.diagnostic.open_float()<CR>", { silent = true, desc = "popup diagnostic" })
map("n", "<leader>E", ":lua vim.lsp.buf.hover() <CR>", { silent = true, desc = "popup description" })

map("n", "<leader>S", ":DBUIToggle<CR>", { silent = true, desc = "SQL" })

map("n", "<leader>ce", ":vsplit | edit ~/.dotfiles/modules/home/nvim/config/lua/mappings.lua<CR>", { silent = true, desc = "edit config" })

map("n", "T", ":lua vim.diagnostic.goto_next()<CR>", { silent = true, desc = "goto next error" })
map("n", "<C-f>", "V/\\%V", { silent = true, desc = "search line" })

vim.keymap.set("v", "<", "<gv")
vim.keymap.set("v", ">", ">gv")

vim.keymap.set("n", "L", ":copen<CR>")
vim.keymap.set("n", "Ö", ":cnext<CR>")
vim.keymap.set("n", "Ä", ":cprev<CR>")

-- Terminal Movements
map("t", "<C-h>", "<C-\\><C-n><C-w>h")
map("t", "<C-l>", "<C-\\><C-n><C-w>l")
map("t", "<C-j>", "<C-\\><C-n><C-w>j")
map("t", "<C-k>", "<C-\\><C-n><C-w>k")
