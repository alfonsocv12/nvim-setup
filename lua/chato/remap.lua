vim.g.mapleader = " "

vim.keymap.set("n", "<C-\\>", vim.cmd.NvimTreeToggle)
-- vim.keymap.set("n", "<A-t>", vim.cmd.vsp)
vim.keymap.set("n", "<D-t>", vim.cmd.vsp)
vim.keymap.set("n", "<D-x>", vim.cmd.q)
vim.keymap.set("n", "<D-s>", vim.cmd.w)
vim.keymap.set("n", "<D-q>", vim.cmd.qa)
vim.o.clipboard = "unnamedplus"

vim.api.nvim_set_keymap("n", "<D-]>", "<C-]>", { noremap = true })
vim.api.nvim_set_keymap("n", '<D-w>', '<C-w>', { noremap = true })
vim.api.nvim_set_keymap("n", "<D-6>", "<C-^>", { noremap = true })
vim.api.nvim_set_keymap("v", "<leader>y", '"+y', { noremap = true})

vim.on_key(function(key)
	print("Key: ", key)
end)

vim.opt.number = true
