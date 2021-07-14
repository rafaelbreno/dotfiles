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
" move buffer
tnoremap <A-h> <C-\><C-n>:bp<CR>
tnoremap <A-l> <C-\><C-n>:bn<CR>
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

" buffer movements
noremap <A-h> <CMD>bp<CR>
noremap <A-l> <CMD>bn<CR>

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

" Use tab for trigger completion with characters ahead and navigate.
" NOTE: Use command ':verbose imap <tab>' to make sure tab is not mapped by
" other plugin before putting this into your config.
inoremap <silent><expr> <TAB>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

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
