vim.pack.add({
	{ src = "https://github.com/neovim/nvim-lspconfig"},
	{ src = "https://github.com/nvim-treesitter/nvim-treesitter", version = "main" },
	{ src = "https://github.com/ellisonleao/gruvbox.nvim" },
	{ src = "https://github.com/stevearc/oil.nvim" },
	{ src = "https://github.com/nvim-lua/plenary.nvim" },
	{ src = "https://github.com/ThePrimeagen/harpoon", version = "harpoon2" },
	{ src = "https://github.com/gelguy/wilder.nvim" },
	{ src = "https://github.com/nvim-mini/mini.pairs" },
    { src = "https://github.com/saghen/blink.cmp", version="v1" },
    { src = "https://github.com/brenton-leighton/multiple-cursors.nvim" }
})

require("gruvbox").setup({
    transparent_mode=true
})
require("multiple-cursors").setup()
require("mini.pairs").setup()
require("oil").setup({
	columns = {
		"permissions",
		"size",
		"mtime",
		"icon",
	},
	view_options = {
		show_hidden = true,
        natural_order = false
	},
    float = {
        padding = 2
    }
})
