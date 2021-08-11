
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
Plugin 'scrooloose/syntastic'
Plugin 'bling/vim-airline'
Plugin 'bling/vim-bufferline'
Plugin 'tpope/vim-fugitive'
Plugin 'tpope/vim-surround'
Plugin 'tpope/vim-repeat'
Plugin 'tpope/vim-markdown'
Plugin 'tpope/vim-commentary'
Plugin 'jonathanfilip/vim-lucius'
Plugin 'Valloric/YouCompleteMe'
Plugin 'digitaltoad/vim-jade'
Plugin 'kien/ctrlp.vim'
Plugin 'unblevable/quick-scope'
Plugin 'dart-lang/dart-vim-plugin'
Plugin 'evidens/vim-twig'
Plugin 'christoomey/vim-sort-motion'
Plugin 'kana/vim-textobj-user'
Plugin 'kana/vim-textobj-indent'
Plugin 'kana/vim-textobj-entire'
Plugin 'kana/vim-textobj-line'
Plugin 'vim-scripts/camelcasemotion'
Plugin 'tpope/vim-abolish'
Plugin 'hashivim/vim-terraform'
Plugin 'cespare/vim-toml'
"All of Plugins must be added before the following line.
call vundle#end()

syntax on
filetype on
filetype plugin indent on

augroup qs_colors
  autocmd!
  autocmd ColorScheme * highlight QuickScopePrimary guifg='#afff5f' gui=underline ctermfg=155 cterm=underline
  autocmd ColorScheme * highlight QuickScopeSecondary guifg='#5fffff' gui=underline ctermfg=81 cterm=underline
augroup END

"Color scheme.
if has("gui-running")
    set background=light
else
    set background=dark
endif
silent! colorscheme lucius

"Config.
set hidden
set number
set relativenumber
set nowrap
set autoindent
set smartindent
" set expandtab
set tabstop=4
set softtabstop=4
set shiftwidth=4
set shiftround
if exists('+colorcolumn')
    set colorcolumn=80,120
endif
set showcmd
set scrolloff=10
set sidescrolloff=20
set cursorline
set noshowmatch
highlight MatchParen cterm=none ctermbg=white ctermfg=black
set incsearch
set hlsearch
set smartcase
set novisualbell
set noerrorbells
set backspace=indent,eol,start
set listchars=eol:¬,tab:\|-,trail:-
" set nolist
set history=1000
set undolevels=1000
set wildignore=*.swp,*.bak,*.class,*.~
set lazyredraw
set ttyfast
set splitbelow
set splitright
set title
set backupcopy=yes
"set foldmethod=syntax
"set foldcolumn=4
"set foldlevelstart=0

"Status line config.
set statusline="\ \ "
set statusline+=%f
set statusline+=\ %m
set statusline+=%=
set statusline+="%l\/%L\ "
set statusline+="\ \ "
set laststatus=2

"Mappings.
let mapleader = " "
let maplocalleader = ","
nnoremap <silent> <Leader>/ :nohlsearch<CR>
nnoremap <silent> <Leader><BS> :w<Bar>bp<Bar>sp<Bar>bn<Bar>bd<CR>
nnoremap <Leader>o o<Esc>
nnoremap <Leader>O O<Esc>
nnoremap <Leader>ev :split $MYVIMRC<CR>
nnoremap <Leader>sv :source $MYVIMRC<CR>
nnoremap <Leader>x :wqa<CR>
nnoremap <Leader>w :wa<CR>
nnoremap <Leader>c :wq<CR>
nnoremap <Leader>j <C-W>j
nnoremap <Leader>k <C-W>k
nnoremap <Leader>h <C-W>h
nnoremap <Leader>l <C-W>l
nnoremap <silent> <Leader>p :set paste!<CR>
nnoremap <Leader>R *:%s///gc<Left><Left><Left>
nnoremap <Leader>d <C-d>
nnoremap <Leader>u <C-u>
nnoremap <Leader>0 zO
nnoremap <Leader>9 zC
nnoremap <Leader>z zA
nnoremap <silent> <Leader><Tab> :b#<CR>
nnoremap <Leader>= <C-W>=
nnoremap <Leader>gs :Gstatus<CR>
nnoremap <Leader>gc :Gcommit<CR>

nnoremap ; :
nnoremap : ;
nnoremap <silent> <S-H> :bN<CR>
nnoremap <silent> <S-L> :bn<CR>
nnoremap <Tab> %
nnoremap _ ddp
nnoremap - ddkP
nnoremap <Backspace> <Nop>
nnoremap <Leader>bb :buffers<CR>:buffer<Space>

vnoremap <Tab> %
vnoremap ; :
vnoremap : ;
vnoremap <Leader>c "+y
vnoremap y myy`y
vnoremap Y myY`y
vnoremap <Leader>0 zO
vnoremap <Leader>9 zC
vnoremap <Leader>z zA

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
        \     execute "normal! g'\"zvzz" |
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
