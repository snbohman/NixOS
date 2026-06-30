require "nvchad.mappings"

vim.keymap.set('n', '<C-->', '<C-w>-')
vim.keymap.set('n', '<C-+>', '<C-w>+')
vim.keymap.set('n', '<C-<>', '<C-w><')
vim.keymap.set('n', '<C->>', '<C-w>>')

vim.keymap.set('n', "<leader>o", ":wqa<CR>", {silent=true})
vim.keymap.set('n', "<leader><leader>", ":so<CR>", {silent=true})
vim.keymap.set('n', "<leader>dd", ":lua vim.diagnostic.enable(false)<CR>", { silent=true, desc="disable diagnostics"})
vim.keymap.set('n', "<leader>de", ":lua vim.diagnostic.enable()<CR>", { silent=true, desc="enable diagnostics" })
vim.keymap.set('n', "<leader>y", ":redo<CR>", {silent=true})
vim.keymap.set('n', "<leader>xd", ":vert term xxd<CR>", {silent=true})
vim.keymap.set("n", "gD", "<cmd>lua vim.lsp.buf.declaration()<CR>", { noremap = true, silent = true })
vim.keymap.set("n", "gd", "<cmd>lua vim.lsp.buf.definition()<CR>", { noremap = true, silent = true })

vim.keymap.set("n", "<leader>B", ":hi Normal guibg=NONE ctermbg=NONE<CR>", { silent = true, desc = "remove bg color" })
vim.keymap.set("n", "<leader>S", ":DBUIToggle<CR>", { silent = true, desc = "SQL" })

vim.keymap.set("n", "<leader>ce", ":vsplit | edit ~/.dotfiles/modules/home/nvim/config/lua/mappings.lua<CR>", { silent = true, desc = "edit config" })

vim.keymap.set("n", "T", ":lua vim.diagnostic.goto_next()<CR>", { silent = true, desc = "goto next error" })
vim.keymap.set("n", "<leader>e", ":lua vim.diagnostic.open_float()<CR>", { silent = true, desc = "popup diagnostic" })
vim.keymap.set("n", "<leader>E", ":lua vim.lsp.buf.hover() <CR>", { silent = true, desc = "popup description" })

vim.keymap.set("v", "<", "<gv")
vim.keymap.set("v", ">", ">gv")

vim.keymap.set("n", "L", ":copen<CR>")
vim.keymap.set("n", "Ö", ":cnext<CR>")
vim.keymap.set("n", "Ä", ":cprev<CR>")

vim.keymap.set("n", "<C-n>", ":Oil<CR>", { silent = true, desc = "oil" })
vim.keymap.set("n", "<C-m>", function()
  vim.cmd("new")
  vim.cmd("Oil")
end, { silent = true, desc = "oil horizontal" })
vim.keymap.set("n", "<C-.>", function()
  vim.cmd("vnew")
  vim.cmd("Oil")
end, { silent = true, desc = "oil vertical" })

vim.keymap.set("n", "M", function()
    local width = math.floor(vim.o.columns * 0.5)
    vim.cmd(("vertical botright copen %d"):format(width))
end, { desc = "quickfix", silent=true })

-- Terminal Movements
vim.keymap.set("t", "<C-h>", "<C-\\><C-n><C-w>h")
vim.keymap.set("t", "<C-l>", "<C-\\><C-n><C-w>l")
vim.keymap.set("t", "<C-j>", "<C-\\><C-n><C-w>j")
vim.keymap.set("t", "<C-k>", "<C-\\><C-n><C-w>k")
