source $HOME/.config/nvim/vim-plug/plugins.vim
source $HOME/.config/nvim/general/settings.vim
source $HOME/.config/nvim/keys/mappings.vim
source $HOME/.config/nvim/themes/gruvbox.vim
source $HOME/.config/nvim/plug-config/telescope.vim
source $HOME/.config/nvim/plug-config/lsp.vim
source $HOME/.config/nvim/plug-config/cmp.vim
source $HOME/.config/nvim/plug-config/harpoon.vim

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

" vim the hard way
let g:maplocalleader='-'

nnoremap <leader>ev :vsplit $MYVIMRC<CR>
nnoremap <leader>so :source $MYVIMRC<CR>  

vnoremap <leader>' :<esc>ea"<esc>bi"<esc>A

inoremap jk <esc>
inoremap <esc> <nop>

 augroup CPP_COMMENT
     autocmd!
     autocmd FileType cpp setlocal commentstring=//\ %s
 augroup END

 augroup ABBREVS
    autocmd!
    autocmd FileType go :iabbrev <buffer> ien if err != nil<esc>
    autocmd FileType go :iabbrev <buffer> mn func main()<esc>
 augroup END

 augroup ABBREVS
    autocmd BufWrite,BufLeave *.go :GoFmt
 augroup END
