require("blink.cmp").setup({
    keymap = {
        preset = "none",
        ["<Tab>"] = { "select_next", "fallback" },
        ["<S-Tab>"] = { "select_prev", "fallback" },
        ["<CR>"] = { "accept", "fallback" },
        ["<C-e>"] = { "hide", "fallback" },
        ["<C-space>"] = { "show", "show_documentation", "hide_documentation" },

        ["<C-j>"] = { "select_next", "fallback" },
        ["<C-k>"] = { "select_prev", "fallback" },
        ["<C-l>"] = { "show", "show_documentation", "hide_documentation" },
        ["<C-h>"] = { "hide", "fallback" },
    },
	completion = {
		menu = {
            border = "none",
            draw = {
                columns = { { "label", "label_description", gap = 1 } },
            },
        },
		documentation = { auto_show = false },
        list = {
            max_items = 8
        }
	},
	sources = { default = { "lsp" } },
	fuzzy = { implementation = "prefer_rust_with_warning" },
    cmdline = {
        enabled = false,
    },
})
