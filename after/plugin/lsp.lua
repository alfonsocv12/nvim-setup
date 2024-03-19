local lsp = require('lsp-zero').preset({})
local cmp = require('cmp')

lsp.on_attach(function(client, bufnr)
  lsp.default_keymaps({
	  buffer = bufnr,
	  preserve_mappings = false
  })
end)

cmp.setup({
  mapping = cmp.mapping.preset.insert({
    -- confirm completion
    ['<C-l>'] = cmp.mapping.confirm({select = true}),
  })
})

-- (Optional) Configure lua language server for neovim
require('lspconfig').lua_ls.setup(lsp.nvim_lua_ls())

lsp.setup()
