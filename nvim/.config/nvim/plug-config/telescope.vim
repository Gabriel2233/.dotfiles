lua require("telescope")

nnoremap <leader>p :Telescope find_files<CR>
nnoremap <leader>grp :Telescope live_grep<CR>
nnoremap <leader>buf :Telescope buffers<CR>
nnoremap <leader>gf :Telescope git_files<CR>

nnoremap <leader>vim :lua require('plugin.telescope').search_dotfiles()<CR>


