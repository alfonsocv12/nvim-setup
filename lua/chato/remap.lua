vim.g.mapleader = " "

-- Taps Support
vim.keymap.set("n", string.format("<%s-t>", OS_CTRL_KEY), vim.cmd.vsp)
vim.keymap.set("n", string.format("<%s-x>", OS_CTRL_KEY), vim.cmd.q)
vim.keymap.set("n", string.format("<%s-s>", OS_CTRL_KEY), vim.cmd.w)
vim.keymap.set("n", string.format("<%s-q>", OS_CTRL_KEY), vim.cmd.qa)
vim.keymap.set("n", string.format("<%s-\\>", OS_CTRL_KEY), vim.cmd.NvimTreeToggle)

if OS_NAME == "Linux" then
    vim.api.nvim_set_keymap("n", '<D-w>', '<C-w>', { noremap = true })
    vim.api.nvim_set_keymap("n", '<D-t>', '<C-t>', { noremap = true })
end


-- Move lines
vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv")
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv")

-- Search stay center
vim.keymap.set("n", "n", "nzzzv")
vim.keymap.set("n", "N", "Nzzzv")

-- Paste keep yank
vim.keymap.set("x", "<leader>p", '"_dP')

-- Delete to void
vim.keymap.set("n", "<leader>d", '"_d')
vim.keymap.set("v", "<leader>d", '"_d')

-- Move lines
vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv")
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv")

-- Find and replace selacted word
vim.keymap.set("n", "<leader>sr", ":%s/\\<<C-r><C-w>\\>/<C-r><C-w>/g<left><left><left><left>")

-- Navigation
if OS_NAME == "Linux" then
    vim.api.nvim_set_keymap("n", "<D-]>", "<C-]>", { noremap = true })
    vim.api.nvim_set_keymap("n", "<D-o>", "<C-o>", { noremap = true })
    vim.api.nvim_set_keymap("n", "<D-6>", "<C-^>", { noremap = true })
end

-- Copy to clipboard
vim.o.clipboard = "unnamedplus"
vim.api.nvim_set_keymap("v", "<leader>y", '"+y', { noremap = true, silent = true })
