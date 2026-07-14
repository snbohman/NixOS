local harpoon = require("harpoon")
harpoon:setup()

local map = vim.keymap.set

map("n", "<C-a>", function() harpoon:list():add() end)
map("n", "<leader>R", function() harpoon.ui:toggle_quick_menu(harpoon:list()) end)

map("n", "!", function() harpoon:list():select(1) end)
map("n", "\"", function() harpoon:list():select(2) end)
map("n", "#", function() harpoon:list():select(3) end)
map("n", "€", function() harpoon:list():select(4) end)
map("n", "%", function() harpoon:list():select(5) end)

-- Toggle previous and next buffers stored within Harpoon list
map("n", "<C-P>", function() harpoon:list():prev() end)
map("n", "<C-+>", function() harpoon:list():next() end)
