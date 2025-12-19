" ============================================================================
" Russty's Vim Configuration
" ============================================================================

" Basic settings
set nocompatible              " Use Vim defaults instead of Vi
syntax on                     " Enable syntax highlighting
filetype plugin indent on     " Enable file type detection

" Display
set number                    " Show line numbers
set relativenumber            " Show relative line numbers
set showcmd                   " Show command in bottom bar
set showmatch                 " Highlight matching parentheses
set ruler                     " Show cursor position
set laststatus=2              " Always show status line
set wildmenu                  " Visual autocomplete for command menu
set cursorline                " Highlight current line

" Colors
set background=dark
colorscheme default

" Indentation
set tabstop=4                 " Number of spaces per tab
set softtabstop=4             " Number of spaces per tab when editing
set shiftwidth=4              " Number of spaces for autoindent
set expandtab                 " Use spaces instead of tabs
set autoindent                " Auto-indent new lines
set smartindent               " Smart auto-indent

" Search
set incsearch                 " Search as you type
set hlsearch                  " Highlight search results
set ignorecase                " Case-insensitive search
set smartcase                 " Case-sensitive if uppercase present

" Performance
set lazyredraw                " Don't redraw during macros

" Backups
set nobackup                  " Don't create backup files
set noswapfile                " Don't create swap files
set nowritebackup             " Don't create backup before overwriting

" Split behavior
set splitbelow                " Open horizontal splits below
set splitright                " Open vertical splits to the right

" Mouse support
set mouse=a                   " Enable mouse in all modes

" Clipboard
set clipboard=unnamedplus     " Use system clipboard

" Key mappings
let mapleader = ","           " Set leader key to comma

" Clear search highlighting
nnoremap <leader><space> :nohlsearch<CR>

" Save with Ctrl+S
nnoremap <C-s> :w<CR>
inoremap <C-s> <Esc>:w<CR>a

" Quick quit
nnoremap <leader>q :q<CR>
nnoremap <leader>Q :qa!<CR>

" Navigate splits
nnoremap <C-h> <C-w>h
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l

" Resize splits
nnoremap <leader>+ :vertical resize +5<CR>
nnoremap <leader>- :vertical resize -5<CR>

" Move lines up/down
nnoremap <A-j> :m .+1<CR>==
nnoremap <A-k> :m .-2<CR>==
vnoremap <A-j> :m '>+1<CR>gv=gv
vnoremap <A-k> :m '<-2<CR>gv=gv

" Better indenting in visual mode
vnoremap < <gv
vnoremap > >gv

" Status line
set statusline=%F%m%r%h%w\ [%l/%L,\ %c]\ [%p%%]

" File type specific
autocmd FileType python setlocal tabstop=4 shiftwidth=4 expandtab
autocmd FileType javascript,typescript,json,yaml,html,css setlocal tabstop=2 shiftwidth=2 expandtab
autocmd FileType go setlocal tabstop=4 shiftwidth=4 noexpandtab
autocmd FileType markdown setlocal wrap linebreak

" Remove trailing whitespace on save
autocmd BufWritePre * :%s/\s\+$//e
