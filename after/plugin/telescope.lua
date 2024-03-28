require('chato.os_detect')
local builtin = require('telescope.builtin')
local utils = require('telescope.utils')
local telescope = require('telescope')

telescope.setup {
	pickers = {
		find_files = {
			hidden = true,
		}
	},
}

vim.keymap.set('n', '<leader>ps', function()
    builtin.grep_string({ search = vim.fn.input("Grep > ") });
end)

print(OS_NAME)
if OS_NAME == "Darwin" then
    vim.keymap.set('n', '<leader>pf', builtin.find_files, {})
    vim.keymap.set("n", '<C-p>', function()
      local _, ret, _ = utils.get_os_command_output({'git', 'rev-parse', '--is-inside-work-tree' })

      if ret == 0 then
          builtin.git_files()
      else
          builtin.find_files()
      end
    end)
elseif OS_NAME == "Linux" then
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
end

