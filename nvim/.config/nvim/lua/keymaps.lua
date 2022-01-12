local key_mapper = function(mode, key, result)
  vim.api.nvim_set_keymap(
    mode,
    key,
    result,
    {noremap = true}
  )
end

key_mapper('i', 'kj', '<ESC>')
key_mapper('v', 'kj', '<ESC>')
key_mapper('n', '<Leader>so', ':so %<CR>')

-- Telescope keymaps
key_mapper('n', '<Leader>ff', ':Telescope find_files<CR>')
key_mapper('n', '<Leader>fg', ':Telescope git_files<CR>')
key_mapper('n', '<Leader>fb', ':Telescope buffers<CR>')

-- Harpoon keymaps
key_mapper('n', '<Leader>hq', ':lua require("harpoon.ui").toggle_quick_menu()<CR>')
key_mapper('n', '<Leader>hc', ':lua require("harpoon.mark").add_file()<CR>')
key_mapper('n', '<Leader>ha', ':lua require("harpoon.ui").nav_file(0)<CR>')
key_mapper('n', '<Leader>hs', ':lua require("harpoon.ui").nav_file(1)<CR>')
key_mapper('n', '<Leader>hd', ':lua require("harpoon.ui").nav_file(2)<CR>')
key_mapper('n', '<Leader>hf', ':lua require("harpoon.ui").nav_file(3)<CR>')

-- Lsp Actions keymaps
key_mapper('n', 'gd', ':lua vim.lsp.buf.definition()<CR>')
key_mapper('n', 'gD', ':lua vim.lsp.buf.declaration()<CR>')
key_mapper('n', 'gi', ':lua vim.lsp.buf.implementation()<CR>')
key_mapper('n', 'gw', ':lua vim.lsp.buf.document_symbol()<CR>')
key_mapper('n', 'gW', ':lua vim.lsp.buf.workspace_symbol()<CR>')
key_mapper('n', 'gr', ':lua vim.lsp.buf.references()<CR>')
key_mapper('n', 'gt', ':lua vim.lsp.buf.type_definition()<CR>')
key_mapper('n', 'K', ':lua vim.lsp.buf.hover()<CR>')
key_mapper('n', '<c-k>', ':lua vim.lsp.buf.signature_help()<CR>')
key_mapper('n', '<Leader>af', ':lua vim.lsp.buf.code_action()<CR>')
key_mapper('n', '<Leader>rn', ':lua vim.lsp.buf.rename()<CR>')


-- Buffer delete
key_mapper('n', '<Leader>q', ':Bdelete<CR>')

-- Window management keymaps
key_mapper('n', '<C-h>', '<C-w><C-h>')
key_mapper('n', '<C-j>', '<C-w><C-j>')
key_mapper('n', '<C-k>', '<C-w><C-k>')
key_mapper('n', '<C-l>', '<C-w><C-l>')
key_mapper('n', '<Left>', ':vertical resize +2<CR>')
key_mapper('n', '<Right>', ':vertical resize -2<CR>')
key_mapper('n', '<Up>', ':resize +2<CR>')
key_mapper('n', '<Down>', ':resize -2<CR>')
key_mapper('n', 'j', 'gj')
key_mapper('n', 'k', 'gk')

-- Some more
key_mapper('v', '<', '< <gv')
key_mapper('v', '>', '> >gv')

-- Clipboard (couldn't do it in lua :0)
vim.cmd [[
    vnoremap <Leader>y "+y
]]
