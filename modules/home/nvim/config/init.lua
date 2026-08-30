-- For wilder
vim.g.loaded_python3_provider = nil
vim.g.python3_host_prog = vim.fn.exepath("python3")

require("plugins")
    require("wild")
    require("ts")
    require("lsp")
    require("comp")

require("options")
    require("statuscolumn")
    require("simpl")
    require("cmd")

require("mappings")
require("harp") -- For some reason
