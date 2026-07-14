local function diagnostic_icon(lnum)
	local diags = vim.diagnostic.get(0, { lnum = lnum - 1 })
	if #diags == 0 then
		return "  " -- keep width consistent when nothing to show
	end

	local severity = vim.diagnostic.severity.HINT
	for _, d in ipairs(diags) do
		if d.severity < severity then
			severity = d.severity
		end
	end

	local icons = {
		[vim.diagnostic.severity.ERROR] = "E",
		[vim.diagnostic.severity.WARN] = "W",
		[vim.diagnostic.severity.INFO] = "I",
		[vim.diagnostic.severity.HINT] = "H",
	}
	local hl = {
		[vim.diagnostic.severity.ERROR] = "DiagnosticError",
		[vim.diagnostic.severity.WARN] = "DiagnosticWarn",
		[vim.diagnostic.severity.INFO] = "DiagnosticInfo",
		[vim.diagnostic.severity.HINT] = "DiagnosticHint",
	}

	return string.format("%%#%s#%s%%*", hl[severity], icons[severity])
end

local function line_number()
	local width = 1 + #tostring(vim.fn.line("$")) -- widest possible number in this buffer
	local num = vim.v.relnum == 0 and vim.v.lnum or vim.v.relnum
	return string.format("%" .. width .. "d", num)
end

function _G.CustomStatusColumn()
	return diagnostic_icon(vim.v.lnum) .. line_number() .. " "
end

vim.o.statuscolumn = "%{%v:lua.CustomStatusColumn()%}"
