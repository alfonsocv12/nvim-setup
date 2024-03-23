vim.g.mapleader = " "

vim.keymap.set("n", "<C-\\>", vim.cmd.NvimTreeToggle)
-- vim.keymap.set("n", "<A-t>", vim.cmd.vsp)
vim.keymap.set("n", "<D-t>", vim.cmd.vsp)
vim.keymap.set("n", "<D-x>", vim.cmd.q)
vim.keymap.set("n", "<D-s>", vim.cmd.w)
vim.keymap.set("n", "<D-q>", vim.cmd.qa)
vim.o.clipboard = "unnamedplus"
vim.api.nvim_set_keymap("n", '<A-w>', '<C-w>', { noremap = true })
vim.api.nvim_set_keymap("v", "<leader>y", '"+y', { noremap = true})

vim.opt.number = true
