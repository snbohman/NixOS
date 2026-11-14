-- For wilder
vim.g.loaded_python3_provider = nil
vim.g.python3_host_prog = vim.fn.exepath("python3")
vim.env.PYTHONPATH = vim.fn.expand("~/.local/share/cpsm/build")
    .. (vim.env.PYTHONPATH and (":" .. vim.env.PYTHONPATH) or "")

require("plugins")
    require("wild")
    require("lsp")
    require("comp")

require("options")
    require("statuscolumn")
    require("simpl")
    require("cmd")

require("mappings")
require("harp") -- For some reason
require("ts")
