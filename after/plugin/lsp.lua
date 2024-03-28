local lsp_zero = require('lsp-zero')
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
    [string.format("<%s-l>", OS_CTRL_KEY)] = cmp.mapping.confirm({select = true}),
  })
})

require('mason').setup({})
require('mason-lspconfig').setup({
  ensure_installed = {},
  handlers = {
    lsp_zero.default_setup,
  },
})

-- (Optional) Configure lua language server for neovim
require('lspconfig').lua_ls.setup(lsp.nvim_lua_ls())

lsp.setup()
