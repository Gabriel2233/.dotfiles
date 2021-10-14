source $HOME/.config/nvim/vim-plug/plugins.vim
source $HOME/.config/nvim/general/settings.vim
source $HOME/.config/nvim/keys/mappings.vim
" source $HOME/.config/nvim/themes/gruvbox.vim
source $HOME/.config/nvim/themes/vimconf.vim
source $HOME/.config/nvim/plug-config/commentary.vim
" source $HOME/.config/nvim/plug-config/nvimtree-config.vim
source $HOME/.config/nvim/plug-config/telescope.vim
source $HOME/.config/nvim/plug-config/lsp.vim
source $HOME/.config/nvim/plug-config/cmp.vim
source $HOME/.config/nvim/plug-config/symbols_outline.vim

luafile $HOME/.config/nvim/lua/plugin/treesitter.lua
luafile $HOME/.config/nvim/lua/plugin/telescope.lua
luafile $HOME/.config/nvim/lua/plugin/lsp.lua

nnoremap <Leader>q :Bdelete<CR>

fun! EmptyRegisters()
    let regs=split('abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789/-"', '\zs')
    for r in regs
        call setreg(r, [])
    endfor
endfun

nnoremap <leader>reg :call EmptyRegisters()<CR>
