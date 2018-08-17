set nobackup
set noswapfile

set term=xterm-256color
set background=dark
colorscheme  desert
syntax on


"status line
set laststatus=2
set statusline=
set statusline+=%1*\ %<\ %F
set statusline+=%1*\ %m%r 
set statusline+=%=                                "separator between left and right
set statusline+=%1*\ %-20((%P)%L\ \ %5l,%-3c%)

set clipboard=unnamed

"line number
set number
"set relativenumber
set ruler

"set visual to orange
hi Visual ctermbg=166

set mouse=a

"status line and vertical border
set fillchars+=vert:\  "there must be a trailling blank at the end
hi User1 ctermfg=102 ctermbg=235
hi VertSplit ctermfg=235
hi StatusLine ctermfg=235
hi StatusLine ctermbg=235
hi StatusLineNC ctermfg=235
hi StatusLineNC ctermbg=235

"wrap
set wrap
set wrapmargin=0
set linebreak
set nolist
set textwidth=0


"encoding
set encoding=utf-8
set fileencoding=utf-8
set fileencodings=ucs-bom,utf-8
set scrolloff=3


"indent
set smartindent
set autoindent
set backspace=indent,eol,start
set showcmd
set showmode
set showmatch

"search
set incsearch
set hlsearch
nnoremap <space>h :nohlsearch<cr>
set ignorecase
set smartcase
set isk+=-

"tab line
hi TabLineFill ctermfg=235
hi TabLine cterm=bold ctermbg=235 ctermfg=30
hi TabLineSel ctermfg=28


"pop-up menu
""hi Pmenu ctermbg=235 ctermfg=173
"hi Pmenu ctermbg=235 ctermfg=37
hi Pmenu ctermbg=235 ctermfg=173
hi PmenuSel ctermbg=237 ctermfg=173
hi PmenuSbar ctermbg=235
hi PmenuThumb ctermbg=237

"change bindings for moving between windows
"nnoremap J  <C-w>j
"nnoremap K  <C-w>k
nnoremap <c-h>  <C-w>h
nnoremap <c-l>  <C-w>l
nnoremap <space><space> :
nnoremap <space>z ZZ
nnoremap <space>w :wqa<cr>
nnoremap <space>q :qa!<cr> 
nnoremap <space>s :w<cr>
"nnoremap dw dwi
"nnoremap db dbi


"cross display
au BufEnter * setlocal cursorline
au BufLeave * setlocal nocursorline
hi Cursorline cterm=NONE ctermbg=235
au BufEnter * setlocal cursorcolumn
au BufLeave * setlocal nocursorcolumn
hi Cursorcolumn cterm=NONE ctermbg=235

" set mapleader
let mapleader = "`"

"tab
set smarttab
set expandtab
set tabstop=2
set softtabstop=2
set shiftwidth=2

filetype off                  " required
" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" let Vundle manage Vundle, required
Plugin 'scrooloose/nerdtree'
Plugin 'jistr/vim-nerdtree-tabs'
"Plugin 'gmarik/Vundle.vim'
Plugin 'fatih/vim-go'
Plugin 'Valloric/YouCompleteMe'
Plugin 'majutsushi/tagbar'
"Plugin 'ervandew/supertab'
Plugin 'ctrlpvim/ctrlp.vim'
Plugin 'scrooloose/nerdcommenter'
"Plugin 'SirVer/ultisnips'
" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype on                  " required
filetype plugin on


let g:ycm_collect_identifiers_from_comments_and_strings=1
""set NERDTree to the right side
let NERDTreeWinPos=1
"automatically open NERDTree
"autocmd vimenter * NERDTree
"nerdtree-tabs
map <space>n <plug>NERDTreeTabsToggle<cr>

augroup go
  autocmd!
  au FileType go nmap <space>r :w !go run %<cr>

  au FileType go nmap <leader>gb :w !go build %<cr>
  au FileType go nmap <space>gt <Plug>(go-test)
  au FileType go nmap <space>ge <Plug>(go-rename)
  au FileType go nmap <space>gf <Plug>(go-def-tab)
  au FileType go nmap <space>gd <Plug>(go-doc)
  au FileType go set expandtab
augroup END

let g:tagbar_left=1
let g:tagbar_width=50
au FileType go nested :TagbarOpen
