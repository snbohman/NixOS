vim.api.nvim_create_autocmd("ColorScheme", {
  pattern = "*",
  callback = function()
    local groups = {
      "Normal", "NormalNC", "NonText",
      "SignColumn", "EndOfBuffer",
      "LineNr", "Folded", "MsgArea",
    }
    for _, group in ipairs(groups) do
      vim.api.nvim_set_hl(0, group, { bg = "none" })
    end
  end,
})
