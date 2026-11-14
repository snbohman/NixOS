vim.keymap.set('n', '!', function()
  local dir

  if vim.bo.filetype == 'oil' then
    dir = require('oil').get_current_dir()
  else
    local file = vim.api.nvim_buf_get_name(0)
    local path = file ~= '' and vim.fs.dirname(file) or vim.fn.getcwd()

    dir = vim.fs.root(path, {
      '.git',
      'package.json',
      'Cargo.toml',
      'Makefile',
      'pyproject.toml',
    }) or path
  end

  vim.ui.input({ prompt = '$ ' }, function(cmd)
    if not cmd or cmd == '' then return end

    vim.cmd('botright 10new')

    local script = 'echo "$ ' .. cmd:gsub('"', '\\"') .. '"; ' .. cmd

    vim.fn.termopen({ vim.o.shell, vim.o.shellcmdflag, script }, {
      cwd = dir,
    })
  end)
end)
