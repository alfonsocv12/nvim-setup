local builtin = require('telescope.builtin')
local utils = require('telescope.utils')

vim.keymap.set('n', '<leader>ff', builtin.find_files, {})
-- vim.keymap.set('n', '<C-p>', builtin.git_files, {})
vim.keymap.set("n", '<leader>pf', function()
  local _, ret, _ = utils.get_os_command_output({'git', 'rev-parse', '--is-inside-work-tree' })

  if ret == 0 then
	  builtin.git_files()
  else
	  builtin.find_files()
  end
end)
vim.keymap.set('n', '<leader>ps', function()
	builtin.grep_string({ search = vim.fn.input("Grep > ") });
end)
