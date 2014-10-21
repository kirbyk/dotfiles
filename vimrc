set nocompatible
set number                      " show current line number even in relative mode
filetype off
syntax enable

set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

Plugin 'gmarik/Vundle.vim'

" let Vundle manage Vundle
Plugin 'christoomey/vim-tmux-navigator'
Plugin 'digitaltoad/vim-jade'
Plugin 'jeffkreeftmeijer/vim-numbertoggle'
Plugin 'kchmck/vim-coffee-script'
Plugin 'mustache/vim-mustache-handlebars'
Plugin 'nanotech/jellybeans.vim'
Plugin 'nathanaelkane/vim-indent-guides'
Plugin 'raimondi/delimitmate'
Plugin 'roman/golden-ratio'
Plugin 'scrooloose/syntastic'
Plugin 'terryma/vim-multiple-cursors'
Plugin 'tomtom/tcomment_vim'
Plugin 'tpope/vim-endwise'
Plugin 'tpope/vim-ragtag'
Plugin 'tpope/vim-surround'
Plugin 'wincent/Command-T'

call vundle#end()
filetype plugin indent on       " fix html and js indenting

set autoindent
set backspace=2                 " fix broken backspace in some setups
set clipboard=unnamed           " yank and paste with the system clipboard
set directory-=.                " don't store swapfiles in the current directory
set expandtab                   " expand tabs to spaces
set ignorecase                  " case-insensitive search
set incsearch                   " search as you type
set laststatus=2                " always show statusline
set ruler                       " show where you are
set scrolloff=3                 " show context above/below cursorline
set shiftwidth=2                " normal mode indentation commands use 2 spaces
set smartcase                   " case-sensitive search if any caps
set smartindent
set softtabstop=2               " insert mode tab and backspace use 2 spaces
set splitbelow
set splitright
set tabstop=8                   " actual tabs occupy 8 characters
set wildmode=longest:full
set wildchar=<Tab>
set wildmenu

" sets a colored column at 80 chars at a visual reference
set colorcolumn=80

" Add jellybean colorscheme
set t_Co=256
colorscheme jellybeans

" Fix Cursor in TMUX
if exists('$TMUX')
  let &t_SI = "\<Esc>Ptmux;\<Esc>\<Esc>]50;CursorShape=1\x7\<Esc>\\"
  let &t_EI = "\<Esc>Ptmux;\<Esc>\<Esc>]50;CursorShape=0\x7\<Esc>\\"
else
  let &t_SI = "\<Esc>]50;CursorShape=1\x7"
  let &t_EI = "\<Esc>]50;CursorShape=0\x7"
endif

" Enable basic mouse behavior such as resizing buffers.
set mouse=a
if exists('$TMUX')  " Support resizing in tmux
  set ttymouse=xterm2
endif

" ############################ keyboard shortcuts ############################

" vim hard mode, forget those arrow keys!!
noremap <up> <nop>
noremap <down> <nop>
noremap <left> <nop>
noremap <right> <nop>
inoremap <up> <nop>
inoremap <down> <nop>
inoremap <left> <nop>
inoremap <right> <nop>

"  vim splits
" easier mappings for switching panes
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>

" correct :W to :w, :Q to :q, & :Wq to :wq
cnoreabbrev <expr> W ((getcmdtype() is# ':' && getcmdline() is# 'W')?('w'):('W'))
cnoreabbrev <expr> Q ((getcmdtype() is# ':' && getcmdline() is# 'Q')?('q'):('Q'))
cnoreabbrev <expr> Wq ((getcmdtype() is# ':' && getcmdline() is# 'Wq')?('wq'):('Wq'))

let mapleader = ','

nnoremap <leader>W :%s/\s\+$//<cr>:let @/=''<CR>

" fix my syntax highlightings
au BufNewFile,BufRead *.json.jbuilder set ft=ruby"
au BufNewFile,BufRead *.ejs set ft=html
au BufNewFile,BufRead *.xm set filetype=objc

