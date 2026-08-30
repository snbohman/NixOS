vim.keymap.set('n', '!', function()
  vim.ui.input({ prompt = '$ ' }, function(cmd)
    if not cmd or cmd == '' then return end
    vim.cmd('botright 10new')
    local script = 'echo "$ ' .. cmd:gsub('"', '\\"') .. '"; ' .. cmd
    vim.fn.termopen({ vim.o.shell, vim.o.shellcmdflag, script })
  end)
end)
