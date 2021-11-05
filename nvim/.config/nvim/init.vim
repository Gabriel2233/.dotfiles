source $HOME/.config/nvim/vim-plug/plugins.vim
source $HOME/.config/nvim/general/settings.vim
source $HOME/.config/nvim/keys/mappings.vim
source $HOME/.config/nvim/themes/gruvbox.vim
source $HOME/.config/nvim/plug-config/telescope.vim
source $HOME/.config/nvim/plug-config/lsp.vim
source $HOME/.config/nvim/plug-config/harpoon.vim
source $HOME/.config/nvim/plug-config/snip.vim

luafile $HOME/.config/nvim/lua/plugin/treesitter.lua
luafile $HOME/.config/nvim/lua/plugin/telescope.lua
luafile $HOME/.config/nvim/lua/plugin/lsp.lua
luafile $HOME/.config/nvim/lua/plugin/harpoon.lua
luafile $HOME/.config/nvim/lua/plugin/statusline.lua

nnoremap <leader>q :Bdelete<CR>

fun! EmptyRegisters()
    let regs=split('abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789/-"', '\zs')
    for r in regs
        call setreg(r, [])
    endfor
endfun
nnoremap <leader>reg :call EmptyRegisters()<CR>

fun! ColorMyPencils()
    highlight ColorColumn ctermbg=0 guibg=grey
    hi SignColumn guibg=none
    hi CursorLineNR guibg=None
    highlight Normal guibg=none
    highlight LineNr guifg=#5eacd3
endfun

call ColorMyPencils()
nnoremap <leader>cmp :call ColorMyPencils()<CR>

nnoremap <leader>so :source $MYVIMRC<CR>  
vnoremap <leader>' :<esc>ea"<esc>bi"<esc>
inoremap kj <esc>
inoremap <esc> <nop>

nnoremap <Tab> :bnext<CR>

augroup CPP_COMMENT
     autocmd!
     autocmd FileType cpp setlocal commentstring=//\ %s
augroup END
