require "nvchad.options"

local set = vim.opt
local sot = vim.o
set.guicursor = ""
set.number = true
set.relativenumber = true
set.wrap = false
sot.scrolloff = 10

sot.foldenable = true
set.foldmethod = "indent"
sot.foldlevel = 99
sot.foldlevelstart = 99
set.mousemodel="extend"

set.expandtab = true
set.tabstop=4
set.shiftwidth = 4
set.softtabstop = -1
set.smarttab = true

vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

vim.api.nvim_create_user_command("CreatePair", function()
  local filepath = vim.fn.expand("%:p")
  local filename = vim.fn.expand("%:t:r") -- base name without extension
  local ext = vim.fn.expand("%:e")        -- file extension

  local alternate_path = nil

  if filepath:find("/src/") then
    -- For a source file, construct the header path:
    alternate_path = filepath:gsub("/src/", "/include/") -- change src to include
    -- Replace extension with hpp (or another header extension if you prefer)
    alternate_path = alternate_path:gsub("%.%w+$", ".hpp")
  elseif filepath:find("/include/") then
    -- For a header file, construct the source path:
    alternate_path = filepath:gsub("/include/", "/src/")
    -- Replace extension with cpp (or cc, depending on your setup)
    alternate_path = alternate_path:gsub("%.%w+$", ".cpp")
  else
    print("File is not inside /src/ or /include/")
    return
  end

  if vim.fn.filereadable(alternate_path) == 0 then
    -- Ensure the directory exists:
    local alt_dir = vim.fn.fnamemodify(alternate_path, ":h")
    if vim.fn.isdirectory(alt_dir) == 0 then
      vim.fn.mkdir(alt_dir, "p")
    end

    -- Create an empty file:
    vim.fn.writefile({}, alternate_path)
    print("Created: " .. alternate_path)
  else
    print("File already exists: " .. alternate_path)
  end
end, {})
