require("vscode-settings")

local null_ls = require("null-ls")
local augroup = vim.api.nvim_create_augroup("LspFormatting", {})

null_ls.setup({
    sources = {
        null_ls.builtins.formatting.stylua,
        null_ls.builtins.completion.spell,
        require("none-ls.diagnostics.eslint"), -- requires none-ls-extras.nvim
        null_ls.builtins.formatting.prettier,
        require("none-ls.formatting.autopep8"),
    },
    on_attach = function(client, bufnr)
        if client.supports_method("textDocument/formatting") then
            vim.api.nvim_clear_autocmds({ group = augroup, buffer = bufnr })
            vim.api.nvim_create_autocmd("BufWritePre", {
                group = augroup,
                buffer = bufnr,
                callback = function()
                    -- on 0.8, you should use vim.lsp.buf.format({ bufnr = bufnr }) instead
                    -- on later neovim version, you should use vim.lsp.buf.format({ async = false }) instead
                    if FORMAT_ON_SAVE then
                        vim.lsp.buf.format()
                    end
                end,
            })
        end
    end,
})

vim.keymap.set("n", "<leader>f", vim.lsp.buf.format, {})
