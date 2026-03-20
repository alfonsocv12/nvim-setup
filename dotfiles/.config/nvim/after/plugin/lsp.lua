local lsp_zero = require('lsp-zero')
local cmp = require('cmp')

-- on_attach is now a standalone function
lsp_zero.on_attach(function(client, bufnr)
  local opts = { buffer = bufnr, remap = false }

  lsp_zero.default_keymaps({ buffer = bufnr, preserve_mappings = false })

  vim.keymap.set("n", "<leader>vca", vim.lsp.buf.code_action, opts)
end)

-- Setup mason
require('mason').setup({})
require('mason-lspconfig').setup({
  ensure_installed = {},
  handlers = {
    function(server_name)
      require('lspconfig')[server_name].setup({})
    end,
  },
})

cmp.setup({
  mapping = cmp.mapping.preset.insert({
    ["<C-l>"] = cmp.mapping.confirm({ select = true }),
  })
})
