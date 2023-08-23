vim.g.mapleader = " "

vim.keymap.set("n", "<leader>pt", vim.cmd.NvimTreeToggle)
vim.keymap.set("n", "<C-t>", vim.cmd.vsp)
vim.keymap.set("n", "<C-x>", vim.cmd.q)
vim.keymap.set("n", "<C-s>", vim.cmd.w)
vim.keymap.set("n", "<C-q>", vim.cmd.qa)

vim.opt.number = true
