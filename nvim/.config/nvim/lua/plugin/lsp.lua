local function on_attach()
end

-- require'lspconfig'.tsserver.setup{ on_attach=on_attach }
require'lspconfig'.ccls.setup{
  init_options = {
    compilationDatabaseDirectory = "build";
    index = {
      threads = 0;
    };
    clang = {
      excludeArgs = { "-frounding-math"} ;
    };
  }
}
-- require'lspconfig'.rust_analyzer.setup{ on_attach=on_attach }
-- require'lspconfig'.svelte.setup{ on_attach=on_attach }

require'lspconfig'.gopls.setup{
    on_attach=on_attach,
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

