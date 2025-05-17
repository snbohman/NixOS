-- This file needs to have same structure as nvconfig.lua 
-- https://github.com/NvChad/ui/blob/v3.0/lua/nvconfig.lua
-- Please read that file to know all available options :( 

---@type ChadrcConfig
local M = {}

M.base46 = {
	theme = "gruvchad",

	hl_override = {
		Comment = { italic = true },
		["@comment"] = { italic = true },
	},
}

M.ui.tabufline.enabled = false
M.term.sizes.vsp = 0.5

return M
