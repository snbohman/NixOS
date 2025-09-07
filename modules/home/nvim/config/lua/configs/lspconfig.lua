local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities = require('cmp_nvim_lsp').default_capabilities(capabilities)


local lspconfig = require("lspconfig")
lspconfig.clangd.setup {
    cmd = { "clangd" },
    filetypes = { "c", "cpp", "hpp" },
    root_dir = lspconfig.util.root_pattern("compile_commands.json", "compile_flags.txt", ".git"),
    capabilities = require("cmp_nvim_lsp").default_capabilities(),

    on_attach = function(client, bufnr)
        local buf_map = function(mode, lhs, rhs, opts)
            opts = opts or {}
            opts.buffer = bufnr
            vim.keymap.set(mode, lhs, rhs, opts)
        end

        buf_map("n", "gd", vim.lsp.buf.definition)
        buf_map("n", "K", vim.lsp.buf.hover)
        buf_map("n", "<leader>rn", vim.lsp.buf.rename)
  end,
}
