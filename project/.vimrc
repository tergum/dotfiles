" ignore directories while using :find <file> command
set wildignore+=**/build/**
" .............................................................................
" grep and Quick Fix windows
" .............................................................................
" bind to grep word under cursor
" nnoremap <leader>k :grep! "\b<C-R><C-W>\b" -R --exclude-dir={.vscode,build} --exclude=tags **<CR>:cw<CR>
nnoremap <leader>k :grep! <C-R><C-W> -R --exclude-dir={.vscode,build} --exclude=tags **<CR>:cw<CR><CR>
