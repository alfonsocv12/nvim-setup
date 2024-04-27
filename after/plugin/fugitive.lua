vim.keymap.set('n', '<leader>gs', vim.cmd.Git);
vim.api.nvim_set_keymap('n', '<leader>gb', ':G blame<CR>', { noremap = true, silent = true })

