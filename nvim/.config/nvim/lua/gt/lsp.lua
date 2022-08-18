local lsp = require'lspconfig'

lsp.gopls.setup{
    cmd = {"gopls", "serve"},
    settings = {
      gopls = {
        analyses = {
          unusedparams = true,
        },
        staticcheck = true,
      },
    },
}

require'lspconfig'.rust_analyzer.setup{}
require'lspconfig'.svelte.setup{}
require'lspconfig'.tsserver.setup{
  filetypes = { "typescript", "typescriptreact", "typescript.tsx", "javascript", "javascritpt.jsx" },
  root_dir = function() return vim.loop.cwd() end      -- run lsp for javascript in any directory
}
