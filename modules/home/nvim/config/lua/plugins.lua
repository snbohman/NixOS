vim.pack.add({
	{ src = "https://github.com/neovim/nvim-lspconfig" },
	{ src = "https://github.com/mason-org/mason.nvim" },
	{ src = "https://github.com/mason-org/mason-lspconfig.nvim" },
	{ src = "https://github.com/nvim-treesitter/nvim-treesitter", version = "main" },
	{ src = "https://github.com/ellisonleao/gruvbox.nvim" },
	{ src = "https://github.com/stevearc/oil.nvim" },
	{ src = "https://github.com/nvim-lua/plenary.nvim" },
	{ src = "https://github.com/ThePrimeagen/harpoon", version = "harpoon2" },
	{ src = "https://github.com/gelguy/wilder.nvim" },
	{ src = "https://github.com/numtostr/comment.nvim" },
	{ src = "https://github.com/nvim-mini/mini.pairs" },
    { src = "https://github.com/saghen/blink.cmp", version="v1" }
})

require("comment").setup()
require("mini.pairs").setup()
require("mason").setup()
require("mason-lspconfig").setup()
require("oil").setup({
	columns = {
		"icon",
		"permissions",
		"size",
		"mtime",
	},
	view_options = {
		show_hidden = true,
	},
})

require("wild")
require("ts")
require("lsp")
require("comp")
require("harp")
