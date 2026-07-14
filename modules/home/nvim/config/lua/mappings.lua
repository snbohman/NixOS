local map = vim.keymap.set
vim.g.mapleader = " "
vim.g.maplocalleader = " "

map("n", "<C-->", "<C-w>-")
map("n", "<C-+>", "<C-w>+")
map("n", "<C-<>", "<C-w><")
map("n", "<C->>", "<C-w>>")

map("n", "<C-h>", "<C-w>h")
map("n", "<C-j>", "<C-w>j")
map("n", "<C-k>", "<C-w>k")
map("n", "<C-l>", "<C-w>l")
map("n", "<C-t>", "<C-w>T")

map("t", "<Esc>", "<C-\\><C-n>")
map("t", "<C-h>", "<C-\\><C-n><C-w>h")
map("t", "<C-l>", "<C-\\><C-n><C-w>l")
map("t", "<C-j>", "<C-\\><C-n><C-w>j")
map("t", "<C-k>", "<C-\\><C-n><C-w>k")
map("t", "<C-t>", "<C-\\><C-n><C-w>Ta")

map("v", "<", "<gv")
map("v", ">", ">gv")
map("n", "J", "mzJ`z")

map("n", "<C-w>l", "<C-W>v<C-w>l")
map("n", "<C-w>j", "<C-W>s<C-w>j")

map("n", "<leader>o", ":wqa<CR>", { silent = true })
map("n", "<leader><leader>", ":so<CR>", { silent = true })
map("n", "<leader>s", "vg_o", { silent = true })
map("n", "-", "$", { silent = true })
map("v", "-", "$", { silent = true })
map("n", "<C-c>", "ggyG<C-o>", { silent = true })
map("n", ";", "/")
map("n", ",", "?")

local function surround_visual()
  local char = vim.fn.getcharstr()
  local pairs_map = { ['('] = ')', ['['] = ']', ['{'] = '}' }
  local right = pairs_map[char] or char
  vim.cmd('normal! c' .. char .. vim.fn.getreg('"') .. right .. vim.api.nvim_replace_termcodes('<Esc>', true, false, true))
end

vim.keymap.set('x', 's', surround_visual, { desc = 'Surround selection with typed char' })

map("n", "<leader>xd", ":%!xxd<CR>", { silent = true })
map("n", "<C-f>", "V/\\%V", { silent = true, desc = "search line" })
map("n", "<Esc>", ":noh<CR>", { silent = true })
map("n", "<leader>v", ":botright vert term<CR>a", { silent = true })
map("n", "<leader>h", ":botright hori term<CR>", { silent = true })

map("n", "<leader>dd", ":lua vim.diagnostic.enable(not vim.diagnostic.is_enabled())<CR>", { silent = true })
map("n", "gD", "<cmd>lua vim.lsp.buf.declaration()<CR>", { noremap = true, silent = true })
map("n", "gd", "<cmd>lua vim.lsp.buf.definition()<CR>", { noremap = true, silent = true })
map("n", "<leader>e", ":lua vim.diagnostic.open_float()<CR>", { silent = true, desc = "popup diagnostic" })
map("n", "<leader>E", ":lua vim.lsp.buf.hover() <CR>", { silent = true, desc = "popup description" })
map("n", "T", ":lua vim.diagnostic.goto_next()<CR>", { silent = true, desc = "goto next error" })
map("n", "<leader>L", vim.diagnostic.setloclist)
map("n", "<leader>fm", ":lua vim.lsp.buf.format()<CR>", { silent = true })

map("n", "Ö", ":cprev<CR>", { silent = true })
map("n", "Ä", ":cnext<CR>", { silent = true })
map("n", "M", function()
	vim.cmd("botright vert copen")
	vim.cmd("vertical resize " .. math.floor(vim.o.columns / 2))
end, { silent = true })
map("n", "m", ":make<CR>", { silent = true })

map("n", "<leader>rv", function()
	local cmd = ":vert resize " .. vim.o.columns
	vim.fn.feedkeys(cmd, "n")
end, { silent = true })
map("n", "<leader>rh", function()
	local cmd = ":hori resize " .. vim.o.rows
	vim.fn.feedkeys(cmd, "n")
end, { silent = true })

map("n", "<leader>S", ":DBUIToggle<CR>", { silent = true })
map("n", "<C-n>", ":Oil<CR>", { silent = true })

map("n", "<leader>ce", ":vsplit | edit ~/.config/nvim/lua/mappings.lua<CR>", { silent = true })

vim.api.nvim_create_user_command("GrepHere", function(opts)
	local dir = vim.fn.expand("%:p:h")
	vim.cmd("grep -rn " .. vim.fn.shellescape(opts.args) .. " " .. vim.fn.shellescape(dir))
end, { nargs = 1 })

vim.api.nvim_create_user_command("GrepH", function(opts)
	local dir = vim.fn.expand("%:p:h")
	vim.cmd("grep -rn " .. vim.fn.shellescape(opts.args) .. " " .. vim.fn.shellescape(dir))
end, { nargs = 1 })

vim.api.nvim_create_user_command("CdHere", function()
  vim.cmd("cd " .. vim.fn.fnameescape(vim.fn.expand("%:p:h")))
end, {})

vim.api.nvim_create_user_command("CdH", function()
  vim.cmd("cd " .. vim.fn.fnameescape(vim.fn.expand("%:p:h")))
end, {})
