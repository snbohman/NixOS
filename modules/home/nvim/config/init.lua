vim.g.loaded_python3_provider = nil
vim.g.python3_host_prog = vim.fn.exepath("python3")

require("plugins")
require("options")
require("mappings")
require("harp")
