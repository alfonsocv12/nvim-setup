local lsp = require('lsp-zero').preset({})
local cmp = require('cmp')

lsp.on_attach(function(client, bufnr)
  local opts = { buffer = bufnr, remap = false}

  lsp.default_keymaps({
	  buffer = bufnr,
	  preserve_mappings = false
  })

  vim.keymap.set("n", "<leader>vca", function() vim.lsp.buf.code_action() end, opts)
end)

cmp.setup({
  mapping = cmp.mapping.preset.insert({
    -- confirm completion
    ['<D-l>'] = cmp.mapping.confirm({select = true}),
  })
})

-- (Optional) Configure lua language server for neovim
require('lspconfig').lua_ls.setup(lsp.nvim_lua_ls())

lsp.setup()
