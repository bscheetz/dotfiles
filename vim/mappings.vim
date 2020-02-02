nnoremap <Left> :vertical resize -1<CR>
nnoremap <Right> :vertical resize +1<CR>
nnoremap <Up> :resize -1<CR>
nnoremap <Down> :resize +1<CR>

" return to the last file opened by pressing leader leader
nmap <Leader><Leader> <c-^>

" press `tab` to switch to the next buffer
" press `shift tab` to switch to the previous buffer
nnoremap <Tab> :bnext!<CR>
nnoremap <S-Tab> :bprev!<CR>
