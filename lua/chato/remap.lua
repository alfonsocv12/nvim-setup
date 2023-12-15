vim.g.mapleader = " "

vim.keymap.set("n", "<C-\\>", vim.cmd.NvimTreeToggle)
vim.keymap.set("n", "<A-t>", vim.cmd.vsp)
vim.keymap.set("n", "<C-x>", vim.cmd.q)
vim.keymap.set("n", "<C-s>", vim.cmd.w)
vim.keymap.set("n", "<A-q>", vim.cmd.qa)
vim.api.nvim_set_keymap("n", '<A-w>', '<C-w>', { noremap = true })

vim.opt.number = true
