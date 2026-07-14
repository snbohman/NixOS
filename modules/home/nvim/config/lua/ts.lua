require("nvim-treesitter").setup()
vim.api.nvim_create_autocmd("FileType", {
	callback = function(args)
		local buf = args.buf
		local ft = vim.bo[buf].filetype

		if vim.bo[buf].buftype ~= "" then
			return
		end

		if pcall(vim.treesitter.start, buf) then
			vim.bo[buf].indentexpr = "v:lua.require'nvim-treesitter'.indentexpr()"
		end
	end,
})
