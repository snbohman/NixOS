vim.keymap.set('n', '!', function()
  -- Capture the Oil dir *before* the input prompt / new window changes context
  local dir
  if vim.bo.filetype == 'oil' then
    dir = require('oil').get_current_dir()
  end

  vim.ui.input({ prompt = '$ ' }, function(cmd)
    if not cmd or cmd == '' then return end
    vim.cmd('botright 10new')
    local script = 'echo "$ ' .. cmd:gsub('"', '\\"') .. '"; ' .. cmd
    vim.fn.termopen({ vim.o.shell, vim.o.shellcmdflag, script }, { cwd = dir })
  end)
end)
