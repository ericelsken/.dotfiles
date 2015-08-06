
set nocompatible

"Initialize and setup Vundle.
filetype off
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
"Let Vundle manage Vundle, required! Do not add comment at end of Plugin lines.
Plugin 'gmarik/Vundle.vim'
"List Plugins here.
Plugin 'fatih/vim-go'
Plugin 'scrooloose/nerdtree'
Plugin 'bling/vim-airline'
Plugin 'bling/vim-bufferline'
Plugin 'tpope/vim-fugitive'
Plugin 'tpope/vim-surround'
Plugin 'tpope/vim-repeat'
Plugin 'jonathanfilip/vim-lucius'
Plugin 'Valloric/YouCompleteMe'
Plugin 'digitaltoad/vim-jade'
Plugin 'kien/ctrlp.vim'
Plugin 'unblevable/quick-scope'
"All of Plugins must be added before the following line.
call vundle#end()

syntax on
filetype on
filetype plugin indent on

"Config.
set hidden
set number
set relativenumber
set nowrap
set autoindent
set smartindent
set expandtab
set tabstop=4
set softtabstop=4
set shiftwidth=4
set shiftround
if exists('+colorcolumn')
    set colorcolumn=80,120
endif
set showcmd
set scrolloff=10
set sidescrolloff=10
set cursorline
set noshowmatch
set incsearch
set hlsearch
set gdefault
set smartcase
set novisualbell
set noerrorbells
set backspace=indent,eol,start
set listchars=eol:$,tab:+-
set nolist
set history=1000
set undolevels=1000
set wildignore=*.swp,*.bak,*.class,*.~
set lazyredraw
set ttyfast
set splitbelow
set splitright

"Status line config.
set statusline=\ \ 
set statusline+=%f
set statusline+=\ %m
set statusline+=%=
set statusline+=%l\/%L\ 
set statusline+=\ \ 
set laststatus=2

"Mappings.
let mapleader = " "
let maplocalleader = ","
nnoremap <silent> <Leader>/ :nohlsearch<CR> :let @/=""<CR><Left>
nnoremap <Leader>C :w<Bar>bp<Bar>sp<Bar>bn<Bar>bd<CR>
nnoremap <Leader>o o<Esc>
nnoremap <Leader>O O<Esc>
nnoremap <Leader>ev :split $MYVIMRC<CR>
nnoremap <Leader>sv :source $MYVIMRC<CR>
nnoremap <Leader>mks :mksession!<CR>
nnoremap <Leader>x :wqa<CR>
nnoremap <Leader>w :wa<CR>
nnoremap <Leader>j <C-W>j
nnoremap <Leader>k <C-W>k
nnoremap <Leader>h <C-W>h
nnoremap <Leader>l <C-W>l
nnoremap <Leader>p :set paste!<CR>:set paste?<CR>
nnoremap <Leader>R *:%s///c<Left><Left>
nnoremap <Leader>c "+yy
nnoremap <silent> <Leader><Tab> :b#<CR>
nnoremap <silent> <Leader>1 :buffer 1<CR>
nnoremap <silent> <Leader>2 :buffer 2<CR>
nnoremap <silent> <Leader>3 :buffer 3<CR>
nnoremap <silent> <Leader>4 :buffer 4<CR>
nnoremap <silent> <Leader>5 :buffer 5<CR>
nnoremap <silent> <Leader>6 :buffer 6<CR>
nnoremap <silent> <Leader>7 :buffer 7<CR>
nnoremap <silent> <Leader>8 :buffer 8<CR>
nnoremap <Leader>= <C-W>=
nnoremap ; :
nnoremap : ;
nnoremap <silent> <S-H> :bN<CR>
nnoremap <silent> <S-L> :bn<CR>
nnoremap <Tab> %
nnoremap _ ddp
nnoremap - ddkP
nnoremap <Backspace> <Nop>

vnoremap <Tab> %
vnoremap <Leader>c "+y

inoremap kj <Esc>

cnoremap kj <C-C>

map <Up> <Nop>
map <Down> <Nop>
map <Left> <Nop>
map <Right> <Nop>

augroup EnterFileLineReturn
    autocmd!
    autocmd BufReadPost *
        \ if line("'\"") > 0 && line("'\"") <= line("$") |
        \     execute 'normal! g`"zvzz' |
        \ endif
augroup END

"Backups.
function! s:EnsureDirectoryExists(path)
    if empty(glob(a:path))
        if !mkdir(a:path, "p")
            echoerr "Could not create directory \"" . a:path . "\""
        else
            return 1
        endif
    endif
    return 1
endfunction

let s:backupDirPath = $HOME . "/.vim/tmp/back/"
if s:EnsureDirectoryExists(s:backupDirPath)
    let &backupdir = s:backupDirPath
endif

let s:swapDirectoryPath = $HOME . "/.vim/tmp/swp/"
if s:EnsureDirectoryExists(s:swapDirectoryPath)
    let &directory = s:swapDirectoryPath . "/"
endif

if exists('+undodir')
    let s:undoDirPath = $HOME . "/.vim/tmp/undo/"
    if s:EnsureDirectoryExists(s:undoDirPath)
        let &undodir = s:undoDirPath
    endif
endif
if exists('+undofile')
    set undofile
endif

"Util functions.
function! EEBufferCount()
    return len(filter(range(1, bufnr("$")), 'buflisted(v:val)'))
endfunction

"Color scheme.
if has("gui-running")
	set background=light
else
	set background=dark
endif
silent! colorscheme lucius
