vim.api.nvim_create_autocmd("QuickFixCmdPost", {
  pattern = { "make", "cfile", "cgetfile" },
  callback = function()
    local qflist = vim.fn.getqflist()
    local changed = false

    for _, item in ipairs(qflist) do
      local fname
      if item.bufnr and item.bufnr > 0 then
        fname = vim.api.nvim_buf_get_name(item.bufnr)
      end

      if fname and fname ~= "" then
        local simplified = vim.fn.simplify(fname)
        if simplified ~= fname then
          local newbuf = vim.fn.bufadd(simplified)
          vim.fn.bufload(newbuf)
          item.bufnr = newbuf
          item.filename = nil -- bufnr takes precedence, avoid conflicting fields
          changed = true
        end
      end
    end

    if changed then
      vim.fn.setqflist(qflist, "r")
    end
  end,
})
