return {
    ------------------ INTELLISENSE -------------------
    {
        "neovim/nvim-lspconfig",
        config = function()
            require "configs.lspconfig"
        end,
    },
    {
        "nvim-lua/lsp_extensions.nvim",
        config = function()
            require 'configs.lsp_extensions'
        end,
    },

    ------------------ SQL DEV -------------------
    {
        "tpope/vim-dadbod",
        event = "VeryLazy",
        opts = {},
        config = function() end
    },
    {
        "kristijanhusak/vim-dadbod-ui",
        event = "VeryLazy",
        opts = {},
        config = function() end
    },
    {
        "kristijanhusak/vim-dadbod-completion",
        event = "VeryLazy",
        after = 'nvim-cmp',
        opts = {},
        config = function() end
    },

    ------------------ OVERWRITES -------------------
    {
        "williamboman/mason.nvim",
        opts = {
            ensure_installed = {
                "clangd",
                "clang-format",
                "pyright",
                "lua-language-server",
                "rust-analyzer",
            }
        }
    },
    {
        "williamboman/mason-lspconfig.nvim",
        event = "VeryLazy",
        opts = {}
    },
    {
        "nvim-telescope/telescope.nvim",
        opts = {
            defaults = {
                file_ignore_patterns = {
                    "node_modules",
                    "build",
                    "bin",
                    "gfx",
                    "assets",
                    "__pyache__",
                    "venv",
                    "submods",
                    "imgui",
                    "vmmlib",
                    "extern",
                    "shaders",
                    ".obj",
                    "obj",
                    ".make",
                    "Makefile",
                    ".compile_commands",
                    ".compile_flags"
                }
            }
        }
    },

    {
        "hrsh7th/nvim-cmp",
        opts = {
            sources = {
                { name = "nvim_lsp" },
                { name = "luasnip" },
                { name = "buffer" },
                { name = "nvim_lua" },
                { name = "path" },
                { name = "vim-dadbod-completion" },
            }
        }
    },

    ------------------ OTHER -------------------
    {
        "ThePrimeagen/harpoon",
        branch = "harpoon2",
        dependencies = { "nvim-lua/plenary.nvim" },
        event = "VeryLazy",
        config = function()
            require "configs.harpoon"
        end,
    },
    {
        "iamcco/markdown-preview.nvim",
        cmd = { "MarkdownPreviewToggle", "MarkdownPreview", "MarkdownPreviewStop" },
        ft = { "markdown" },
        build = function() vim.fn["mkdp#util#install"]() end,
    },
    {
        'vidocqh/data-viewer.nvim',
        opts = {},
        event = "VeryLazy",
        dependencies = {
          "nvim-lua/plenary.nvim",
          "kkharji/sqlite.lua", -- Optional, sqlite support
        }
    },

    {
        "stevearc/oil.nvim",
        ---@module 'oil'
        ---@type oil.SetupOpts
        opts = {},
        -- Optional dependencies
        dependencies = { { "echasnovski/mini.icons", opts = {} } },
        lazy = false,
    }
}
