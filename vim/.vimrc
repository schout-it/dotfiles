autocmd! bufwritepost .vimrc source %

set pastetoggle=<F2>
set clipboard=unnamed

set mouse=a
set bs=2

let mapleader = ","

noremap <C-n> :nohl<CR>
vnoremap <C-n> <C-C>:nohl<CR>
inoremap <C-n> <C-O>:nohl<CR>

map <c-s> :w<CR>
vmap <c-s> <esc><c-s>gv
imap <c-s> <esc><c-s>a

noremap <Leader>e :quit<CR>
noremap <leader>E :qa!<CR>

map <c-j> <c-w>j
map <c-k> <c-w>k
map <c-l> <c-w>l
map <c-h> <c-w>h
map <c-Left> <c-w>10<
map <c-Right> <c-w>10>

map <Leader>n <esc>:bn<CR>
map <leader>m <esc>:bp<CR>

vnoremap <Leader>s :sort<CR>
vnoremap < <gv
vnoremap > >gv

autocmd ColorScheme * highlight ExtraWhitespace ctermbg=7 guibg=#727272
au InsertLeave * match ExtraWhitespace /\s\+$/

set t_Co=256
color wombat256mod

set nocompatible
filetype off


vmap Q gq
nmap Q gqap

set history=700
set undolevels=700

set tabstop=4
set softtabstop=4
set shiftwidth=4
set shiftround
set expandtab

set hlsearch
set incsearch
set ignorecase
set smartcase

set nobackup
set nowritebackup
set noswapfile

set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

Bundle 'VundleVim/Vundle.vim'

Bundle 'Lokaltog/powerline', {'rtp': 'powerline/bindings/vim/'}
Bundle 'kien/ctrlp.vim'
Bundle 'davidhalter/jedi-vim'
Bundle 'scrooloose/nerdtree'
Bundle 'tpope/vim-fugitive'
Bundle 'tpope/vim-haml'
Bundle 'tpope/vim-markdown'
Bundle 'tpope/vim-surround'
Bundle 'chase/vim-ansible-yaml'
Bundle 'presenting.vim'
Plugin 'SirVer/ultisnips'
Plugin 'hynek/vim-python-pep8-indent'
Plugin 'tmhedberg/SimpylFold'
Plugin 'christoomey/vim-tmux-navigator'
Plugin 'mileszs/ack.vim'
Plugin 'nvie/vim-flake8'
Plugin 'joonty/vdebug'

call vundle#end()

filetype plugin indent on

autocmd FileType html setlocal shiftwidth=2 tabstop=2 softtabstop=2
autocmd FileType xml setlocal shiftwidth=2 tabstop=2 softtabstop=2
autocmd FileType yml setlocal shiftwidth=2 tabstop=2 softtabstop=2
autocmd FileType yaml setlocal shiftwidth=2 tabstop=2 softtabstop=2

set number
set tw=119
set nowrap
set fo-=t
set colorcolumn=120
highlight ColorColumn ctermbg=9

syntax on
set guifont=Ubuntu\ Mono\ derivative\ Powerline\ 12
set laststatus=2

let g:ctrlp_max_height = 30

let g:jedi#usages_command = "<leader>z"
let g:jedi#popup_on_dot = 0
let g:jedi#popup_select_first = 0
map <Leader>b Oimport pdb; pdb.set_trace() # BREAKPOINT<C-c>
map <Leader>. :CtrlPTag<CR>

set completeopt=longest,menuone
function! OmniPopup(action)
    if pumvisible()
        if a:action == 'j'
            return "\<C-N>"
        elseif a:action == 'k'
            return "\<C-P>"
        endif
    endif
    return a:action
endfunction

inoremap <silent><C-j> <C-R>=OmniPopup('j')<CR>
inoremap <silent><C-k> <C-R>=OmniPopup('k')<CR>
let g:SimpylFold_docstring_preview=1
" Enable folding with the spacebar
nnoremap <space> za

set foldmethod=indent
set nofoldenable

map <F3> :NERDTreeToggle<CR>
:nnoremap <silent> <F5> :let _s=@/<Bar>:%s/\s\+$//e<Bar>:let @/=_s<Bar>:nohl<CR>
map [q :cprev<CR>
map ]q :cprev<CR>

if executable('ag')
    let g:ackprg = 'ag --nogroup --nocolor --column'
    " Use ag in CtrlP for listing files. Lightning fast and respects .gitignore
    let g:ctrlp_user_command = 'ag %s -l --nocolor -g ""'
    " ag is fast enough that CtrlP doesn't need to cache
    let g:ctrlp_use_caching = 0
endif
