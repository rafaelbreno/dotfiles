"go to normal mode using double esc
tnoremap <Esc><Esc> <C-\\><C-n>

" move vertically by visual line on wrapped lines
nnoremap j gj
nnoremap k gk

" better yank behaviour
nnoremap Y y$

" copy to system clipboard
vnoremap <A-y> "+y

" toggle hlsearch
nnoremap <Leader>n <CMD>nohl<CR>

"Remove Highlight
nmap <silent><leader>rh :let @/=""<cr>

" Enter Visual mode
nnoremap <leader>lv <S-v>
nnoremap <leader>v <C-v>


"GoFmt
nmap <silent><leader>gf :GoFmt<cr>

"GoImports
nmap <silent><leader>gi :GoImports<cr>

noremap <F2>
      \ :exe "let g:strip_whitespace = !g:strip_whitespace"<CR>
      \ :exe "echo 'Strip whitespace mode toggled!'"<CR>

" Reload init.vim file
nnoremap <leader>r <cmd>:source $MYVIMRC<cr>

" Use <Tab> and <S-Tab> to navigate through popup menu
"inoremap <expr> <Tab>   pumvisible() ? "\<C-n>" : "\<Tab>"
"inoremap <expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"
"imap <tab> <Plug>(completion_smart_tab)
"imap <s-tab> <Plug>(completion_smart_s_tab)

function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

" Toggle Folding
nnoremap <leader>c za

" JSON Formatting
au FileType json nnoremap <leader>j <cmd>%!jq<cr>
