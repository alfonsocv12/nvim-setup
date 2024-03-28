local output, _ = os.execute("uname")

vim.g.mapleader = " "

if output == "Darwin" then
    vim.keymap.set("n", "<leader>pt", vim.cmd.NvimTreeToggle)
    vim.keymap.set("n", "<C-t>", vim.cmd.vsp)
    vim.keymap.set("n", "<C-x>", vim.cmd.q)
    vim.keymap.set("n", "<C-s>", vim.cmd.w)
    vim.keymap.set("n", "<C-q>", vim.cmd.qa)
end

-- Copy to clipboard
vim.o.clipboard = "unnamedplus"
vim.api.nvim_set_keymap("v", "<leader>y", '"+y', { noremap = true, silent = true })
