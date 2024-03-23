-- For identation
vim.opt.tabstop = 4
vim.opt.sw = 4
-- For folds
--vim.opt.foldmethod = "expr"
--vim.opt.foldexpr = "nvim_treesitter#foldexpr()"

-- Autocommand unfold folds
vim.cmd[[
    augroup RunAfterOpening
        autocmd!
        autocmd BufReadPost,FileReadPost * normal zR 
    augroup END
]]
