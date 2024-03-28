vim.g.mapleader = " "

vim.keymap.set("n", string.format("<%s-t>", OS_CTRL_KEY), vim.cmd.vsp)
vim.keymap.set("n", string.format("<%s-x>", OS_CTRL_KEY), vim.cmd.q)
vim.keymap.set("n", string.format("<%s-s>", OS_CTRL_KEY), vim.cmd.w)
vim.keymap.set("n", string.format("<%s-q>", OS_CTRL_KEY), vim.cmd.qa)

vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv")
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv")

if OS_NAME == "Darwin" then
    vim.keymap.set("n", "<leader>pt", vim.cmd.NvimTreeToggle)
elseif OS_NAME == "Linux" then
    vim.keymap.set("n", "<C-\\>", vim.cmd.NvimTreeToggle)
    -- vim.keymap.set("n", "<A-t>", vim.cmd.vsp)

    vim.api.nvim_set_keymap("n", "<D-]>", "<C-]>", { noremap = true })
    vim.api.nvim_set_keymap("n", '<D-w>', '<C-w>', { noremap = true })
    vim.api.nvim_set_keymap("n", "<D-6>", "<C-^>", { noremap = true })
    vim.api.nvim_set_keymap("v", "<leader>y", '"+y', { noremap = true})
end

-- Copy to clipboard
vim.o.clipboard = "unnamedplus"
vim.api.nvim_set_keymap("v", "<leader>y", '"+y', { noremap = true, silent = true })
