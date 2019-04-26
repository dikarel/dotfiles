call plug#begin()
  Plug 'ctrlpvim/ctrlp.vim'
  Plug 'ervandew/supertab'
  Plug 'itchyny/lightline.vim'
  Plug 'morhetz/gruvbox'
  Plug 'takac/vim-hardtime'
  Plug 'tpope/vim-fugitive'
  Plug 'tpope/vim-sensible'
  Plug 'tpope/vim-sleuth'
  Plug 'wincent/ferret'

  " Looks cool; not using right now
  " Plug '/usr/local/opt/fzf'
  " Plug 'Valloric/YouCompleteMe'
  " Plug 'alvan/vim-closetag'
  " Plug 'garbas/vim-snipmate'
  " Plug 'junegunn/fzf.vim'
  " Plug 'majutsushi/tagbar'
  " Plug 'scrooloose/nerdtree'
  " Plug 'sickill/vim-monokai'
  " Plug 'vim-scripts/vim-auto-save'

  " Would be great to use, but too slow
  " Plug 'tmhedberg/SimpylFold'
call plug#end()

" Automate things I would do anyways
autocmd BufWritePre * %s/\s\+$//e  " Trim trailing whitespace

" Theming
colorscheme gruvbox

" Use space-bar to fold/un-fold code
nnoremap <space> za
set foldlevel=99
set foldmethod=indent
set foldnestmax=2
vnoremap <space> zf

" Useful information
set colorcolumn=100  " Mark long lines
set number " Show line numbers
syntax on  " Syntax highlighting

" Less gotchas, more intuitive behavior
noremap U <C-R>        " Redo with Shift+U instead of CTRL+R
set clipboard=unnamed  " Allow copy-pasting across different vim instances
set foldlevelstart=20  " Don't start off with everything folded
set nocompatible  " Enable vim-only features
set shellcmdflag=-ic  " Allow Bash aliases to be run
set shortmess+=I  " Turn off startup message
set ignorecase  " Searches are case-insensitive by default
set smartcase   " Searches are case-insensitive by default

" Swapfiles are more trouble than they're worth. They're disruptive
set noswapfile

" Minimal status line configuration
let g:lightline =
  \ {
  \   'colorscheme': 'molokai',
  \   'active': {
  \     'left': [[ 'mode' ], ['readonly', 'filename', 'modified']],
  \     'right': [['gitbranch']]
  \   },
  \   'component_function': {'gitbranch': 'fugitive#head'},
  \ }
set noshowmode  " Disable system status line

" Use rg for fuzzy-finding files (using CtrlP). This is much faster
if executable('rg')
  set grepprg=rg\ --color=never
  let g:ctrlp_user_command = 'rg %s --files --color=never --glob ""'
  let g:ctrlp_use_caching = 0
endif

" Force yourself to use vim correctly
let g:hardtime_default_on = 1
