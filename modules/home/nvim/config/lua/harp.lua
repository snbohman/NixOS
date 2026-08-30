local harpoon = require("harpoon")
harpoon:setup()

local map = vim.keymap.set

map("n", "<C-a>", function() harpoon:list():add() end)
map("n", "<leader>R", function() harpoon.ui:toggle_quick_menu(harpoon:list()) end)

map("n", "<C-1>", function() harpoon:list():select(1) end)
map("n", "<C-2>", function() harpoon:list():select(2) end)
map("n", "<C-3>", function() harpoon:list():select(3) end)
map("n", "<C-4>", function() harpoon:list():select(4) end)
map("n", "<C-5>", function() harpoon:list():select(5) end)
map("n", "<C-6>", function() harpoon:list():select(6) end)
map("n", "<C-7>", function() harpoon:list():select(7) end)
map("n", "<C-8>", function() harpoon:list():select(8) end)
map("n", "<C-9>", function() harpoon:list():select(9) end)

-- Toggle previous and next buffers stored within Harpoon list
map("n", "<C-P>", function() harpoon:list():prev() end)
map("n", "<C-+>", function() harpoon:list():next() end)
