""" NERDTree
let NERDTreeShowHidden=1
autocmd vimenter * NERDTree

"NerdTreeToggle
nmap <silent><leader>ne :NERDTree<cr>
nmap <silent><leader>nt :NERDTreeToggle<cr>

" in terminal
" move between window
tnoremap <C-h> <C-\><C-n><C-w><C-h>
tnoremap <C-j> <C-\><C-n><C-w><C-j>
tnoremap <C-k> <C-\><C-n><C-w><C-k>
tnoremap <C-l> <C-\><C-n><C-w><C-l>

" resize
tnoremap <Left>  <C-\><C-n>:vertical resize +2<CR>
tnoremap <Right> <C-\><C-n>:vertical resize -2<CR>
tnoremap <Up>    <C-\><C-n>:resize   +2<CR>
tnoremap <Down>  <C-\><C-n>:resize   -2<CR>
" go to normal mode using double esc
tnoremap <Esc><Esc> <C-\\><C-n>

" better movement between windows
nnoremap <C-h> <C-w><C-h>
nnoremap <C-j> <C-w><C-j>
nnoremap <C-k> <C-w><C-k>
nnoremap <C-l> <C-w><C-l>

" resize buffer easier
nnoremap <Left>  <CMD>vertical resize +2<CR>
nnoremap <Right> <CMD>vertical resize -2<CR>
nnoremap <Up>    <CMD>resize   +2<CR>
nnoremap <Down>  <CMD>resize   -2<CR>

" move vertically by visual line on wrapped lines
nnoremap j gj
nnoremap k gk

" better yank behaviour
nnoremap Y y$

" remove annoying exmode
nnoremap Q  <Nop>
nnoremap q: <Nop>

" copy to system clipboard
vnoremap <A-y> "+y

" toggle hlsearch
nnoremap <Leader>n <CMD>nohl<CR>

"Remove Highlight
nmap <silent><leader>rh :let @/=""<cr>

" Enter Visual mode
nnoremap <leader>lv <S-v>
nnoremap <leader>v <C-v>

" Highlights code for multiple indents without reselecting
" better indenting experience
vnoremap < <gv
vnoremap > >gv

"Move Line Up/Down
nnoremap <A-j> :m .+1<CR>==
nnoremap <A-k> :m .-2<CR>==
inoremap <A-j> <Esc>:m .+1<CR>==gi
inoremap <A-k> <Esc>:m .-2<CR>==gi
vnoremap <A-j> :m '>+1<CR>gv=gv
vnoremap <A-k> :m '<-2<CR>gv=gv

"Save/Exit
nmap <silent><leader>w :w<cr>
nmap <silent><leader>q :wq<cr>


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


" Telescope
nnoremap <leader>ff <cmd>Telescope find_files<cr>
nnoremap <leader>fg <cmd>Telescope live_grep<cr>
nnoremap <leader>fb <cmd>Telescope buffers<cr>
nnoremap <leader>fh <cmd>Telescope help_tags<cr>

" LazyGit
noremap <silent> <leader>lg :LazyGit<CR>

" Trouble
nnoremap <leader>xx <cmd>TroubleToggle<cr>
nnoremap <leader>xw <cmd>TroubleToggle lsp_workspace_diagnostics<cr>
nnoremap <leader>xd <cmd>TroubleToggle document_diagnostics<cr>
nnoremap <leader>xq <cmd>TroubleToggle quickfix<cr>
nnoremap <leader>xl <cmd>TroubleToggle loclist<cr>
nnoremap gR <cmd>TroubleToggle lsp_references<cr>

" Toggle Folding
nnoremap <leader>c za

" JSON Formatting
au FileType json nnoremap <leader>j <cmd>%!jq<cr>
