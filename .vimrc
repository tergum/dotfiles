set secure
set nocompatible              " be iMproved, required
filetype off                  " required
set exrc                      " read also .vimrc in the current working dorectory
                              " to add some project specific settings

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')
"
" let Vundle manage Vundle, required
" https://github.com/VundleVim/Vundle.vim
Plugin 'VundleVim/Vundle.vim'

" key bindings to move between tmux panes and Vim splits seamlessly
" e.g. C-h = Left
" https://github.com/christoomey/vim-tmux-navigator
Plugin 'christoomey/vim-tmux-navigator'

" Enhanced C++ syntax highlighting
" https://github.com/octol/vim-cpp-enhanced-highlight
Plugin 'octol/vim-cpp-enhanced-highlight'

" Vim One colorscheme (light and dark)
" https://github.com/rakr/vim-one
Plugin 'rakr/vim-one'

" fzf integration
" https://github.com/junegunn/fzf
Plugin 'junegunn/fzf'
Plugin 'junegunn/fzf.vim'

" remove selection when cursor moves
Plugin 'haya14busa/is.vim'
" select some text in Visual Mode and then use * and # for the search
" Plugin 'nelstrom/vim-visual-star-search'

" The following are examples of different formats supported.
" Keep Plugin commands between vundle#begin/end.
" plugin on GitHub repo
" Plugin 'tpope/vim-fugitive'
" plugin from http://vim-scripts.org/vim/scripts.html
" Plugin 'L9'
" Git plugin not hosted on GitHub
" Plugin 'git://git.wincent.com/command-t.git'
" git repos on your local machine (i.e. when working on your own plugin)
" Plugin 'file:///home/gmarik/path/to/plugin'
" The sparkup vim script is in a subdirectory of this repo called vim.
" Pass the path to set the runtimepath properly.
" Plugin 'rstacruz/sparkup', {'rtp': 'vim/'}
" Install L9 and avoid a Naming conflict if you've already installed a
" different version somewhere else.
" Plugin 'ascenator/L9', {'name': 'newL9'}
"
" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required
" To ignore plugin indent changes, instead use:
"filetype plugin on
"
" Brief help
" :PluginList       - lists configured plugins
" :PluginInstall    - installs plugins; append `!` to update or just :PluginUpdate
" :PluginSearch foo - searches for foo; append `!` to refresh local cache
" :PluginClean      - confirms removal of unused plugins; append `!` to auto-approve removal
"
" see :h vundle for more details or wiki for FAQ
" Put your non-Plugin stuff after this line

" The first configuration will instruct Vim to automatically re-balance the
" visible splits as tmux panes are created, destroyed, or resized.
autocmd VimResized * :wincmd =
" map <leader> to Spacebar
" <leader> key is "\" by default
let mapleader=" "
let maplocalleader=" "
" zoom a vim pane, <C-w>= to re-balance
nnoremap <leader>- :wincmd _<cr>:wincmd \|<cr>
nnoremap <leader>= :wincmd =<cr>

" save file
nnoremap <leader>w :w<cr>

"show line numbers
set number
"highlight searched word
set hlsearch
"highlight patterns while typing
set incsearch

" .............................................................................
" FILE BROWSING:
" .............................................................................
let g:netrw_banner=0        " disable annoying banner
let g:netrw_browse_split=4  " open in prior window
let g:netrw_altv=1          " open splits to the right
let g:netrw_liststyle=3     " tree view
let g:netrw_list_hide=netrw_gitignore#Hide()
let g:netrw_list_hide.=',\(^\|\s\s\)\zs\.\S\+'

" Per default, netrw leaves unmodified buffers open. This autocommand
" deletes netrw's buffer once it's hidden (using ':q', for example)
autocmd FileType netrw setl bufhidden=delete

" Files search with :find
" NOTE: use * for fuzzy search
set path+=.,**
set wildmenu

" show existing tab with 4 spaces width
set tabstop=4
" when indenting with '>', use 4 spaces width
set shiftwidth=4
" On pressing tab, insert 4 spaces
set expandtab

set autoindent
set smartindent

" .............................................................................
" vim-cpp-enahanced-highlight
" .............................................................................
let g:cpp_class_scope_highlight = 1
let g:cpp_member_variable_highlight = 0
let g:cpp_class_decl_highlight = 1
let g:cpp_experimental_template_highlight = 1

" .............................................................................
" One color scheme
" .............................................................................
set termguicolors

let g:airline_theme='one'
colorscheme one 
set background=dark

" .............................................................................
" fzf key-bindings
" .............................................................................
let $FZF_DEFAULT_OPTS = '--bind ctrl-a:select-all'

" Customize fzf colors to match your color scheme.
let g:fzf_colors =
  \ { 'fg':      ['fg', 'Normal'],
  \ 'bg':      ['bg', 'Normal'],
  \ 'hl':      ['fg', 'Comment'],
  \ 'fg+':     ['fg', 'CursorLine', 'CursorColumn', 'Normal'],
  \ 'bg+':     ['bg', 'CursorLine', 'CursorColumn'],
  \ 'hl+':     ['fg', 'Statement'],
  \ 'info':    ['fg', 'PreProc'],
  \ 'prompt':  ['fg', 'Conditional'],
  \ 'pointer': ['fg', 'Exception'],
  \ 'marker':  ['fg', 'Keyword'],
  \ 'spinner': ['fg', 'Label'],
  \ 'header':  ['fg', 'Comment'] }

let g:fzf_action = {
  \ 'ctrl-t': 'tab split',
  \ 'ctrl-b': 'split',
  \ 'ctrl-v': 'vsplit'}

" list all files (also might be remapped to <C-p>)
nnoremap <silent> <leader>p :Files<CR>
" list loaded buffers
nnoremap <silent> <leader>b :Buffers<CR>
" show lines in loaded buffers
nnoremap <silent> <leader>l :Lines<CR>
" Allow passing optional flags into the Rg command.
"   Example: :Rg myterm -g '*.md'
command! -bang -nargs=* Rg
  \ call fzf#vim#grep(
  \ "rg --column --line-number --no-heading --color=always --smart-case " .
  \ <q-args>, 1, fzf#vim#with_preview(), <bang>0)

" .............................................................................
" universal-ctags
" .............................................................................
nnoremap <silent> <leader>t :!ctags -R .<CR><CR>
