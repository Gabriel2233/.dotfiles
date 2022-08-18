local cmp = require'cmp'
local lspkind = require'lspkind'

cmp.setup({
  snippet = {
      expand = function(args)
      end,
  },
  mapping = {
      ['<C-u>'] = cmp.mapping.scroll_docs(-4),
      ['<C-d>'] = cmp.mapping.scroll_docs(4),
      ['<C-Space>'] = cmp.mapping.complete(),
      ['<C-n>'] = cmp.mapping.select_next_item(),
      ['<C-p>'] = cmp.mapping.select_prev_item(),
      ['<C-e>'] = cmp.mapping.close(),
      ['<C-q>'] = cmp.mapping.abort(),
      ['<CR>'] = cmp.mapping.confirm({ select = true }),
  },

  sources = {
      { name = 'nvim_lsp' },
      { name = 'buffer', keyword_length = 5 },
  },

  formatting = {
      format = lspkind.cmp_format({
        with_text = true,
        menu = {
            buffer = "[buf]",
            nvim_lsp = "[LSP]",
            path = "[path]",
        }
      })
  },

   experimental = {
    native_menu = false,
    ghost_text = false,
  },
})

local capabilities = require('cmp_nvim_lsp').update_capabilities(vim.lsp.protocol.make_client_capabilities())
require('lspconfig')['gopls'].setup {
    capabilities = capabilities
}
require('lspconfig')['clangd'].setup {
    capabilities = capabilities
}

