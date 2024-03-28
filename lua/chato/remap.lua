local output, _ = os.execute("uname")

vim.g.mapleader = " "

if output == "Darwin" then
    vim.keymap.set("n", "<leader>pt", vim.cmd.NvimTreeToggle)
    vim.keymap.set("n", "<C-t>", vim.cmd.vsp)
    vim.keymap.set("n", "<C-x>", vim.cmd.q)
    vim.keymap.set("n", "<C-s>", vim.cmd.w)
    vim.keymap.set("n", "<C-q>", vim.cmd.qa)
elseif output == "Linux" then
    vim.keymap.set("n", "<C-\\>", vim.cmd.NvimTreeToggle)
    -- vim.keymap.set("n", "<A-t>", vim.cmd.vsp)
    vim.keymap.set("n", "<D-t>", vim.cmd.vsp)
    vim.keymap.set("n", "<D-x>", vim.cmd.q)
    vim.keymap.set("n", "<D-s>", vim.cmd.w)
    vim.keymap.set("n", "<D-q>", vim.cmd.qa)

    vim.api.nvim_set_keymap("n", "<D-]>", "<C-]>", { noremap = true })
    vim.api.nvim_set_keymap("n", '<D-w>', '<C-w>', { noremap = true })
    vim.api.nvim_set_keymap("n", "<D-6>", "<C-^>", { noremap = true })
    vim.api.nvim_set_keymap("v", "<leader>y", '"+y', { noremap = true})
end

-- Copy to clipboard
vim.o.clipboard = "unnamedplus"
vim.api.nvim_set_keymap("v", "<leader>y", '"+y', { noremap = true, silent = true })
