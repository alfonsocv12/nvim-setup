-- For identation
vim.opt.tabstop = 4
vim.opt.sw = 4
vim.opt.expandtab = true
vim.opt.softtabstop = 4
vim.opt.smartindent = true

-- For line numbers
vim.opt.number = true
vim.opt.rnu = true

-- For search
vim.opt.hlsearch = false
vim.opt.incsearch = true

-- For colors
vim.opt.termguicolors = true

-- Fast update time
vim.opt.updatetime = 50

vim.opt.scrolloff = 8

-- For folds
-- vim.opt.foldmethod = "expr"
-- vim.opt.foldexpr = "nvim_treesitter#foldexpr()"

-- Autocommand unfold folds
vim.cmd[[
    augroup RunAfterOpening
        autocmd!
        autocmd BufReadPost,FileReadPost * normal zR 
    augroup END
]]
