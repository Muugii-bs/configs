"========================================"
"=============== PLUGINS ================"
"========================================"

" - For Neovim: ~/.local/share/nvim/plugged
call plug#begin('~/.local/share/nvim/plugged')

" Shorthand notation; fetches https://github.com/junegunn/vim-easy-align
Plug 'junegunn/vim-easy-align'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'vim-scripts/AutoComplPop'
Plug 'pangloss/vim-javascript'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-sensible'
Plug 'noahfrederick/vim-hemisu'
Plug 'mattn/emmet-vim'
Plug 'vim-syntastic/syntastic'
Plug 'https://github.com/junegunn/vim-github-dashboard.git'
Plug 'rakr/vim-one'
Plug 'tpope/vim-repeat'
Plug 'tpope/vim-surround'
Plug 'SirVer/ultisnips'
Plug 'honza/vim-snippets'
Plug 'Shougo/deoplete.nvim'
Plug 'zchee/deoplete-jedi'
" Plug 'vim-scripts/pythoncomplete'
" Plug 'davidhalter/jedi-vim'

" On-demand loading
Plug 'scrooloose/nerdtree', { 'on':  'NERDTreeToggle' }
Plug 'tpope/vim-fireplace', { 'for': 'clojure' }
Plug 'Valloric/YouCompleteMe', { 'do': 'python3 install.py' }

" Using a non-master branch
Plug 'rdnetto/YCM-Generator', { 'branch': 'stable' }

" Using a tagged release; wildcard allowed (requires git 1.9.2 or above)
Plug 'fatih/vim-go', { 'tag': '*' }

" Plugin options
Plug 'nsf/gocode', { 'tag': 'v.20150303', 'rtp': 'vim' }

" Plugin outside ~/.vim/plugged with post-update hook
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }

" Unmanaged plugin (manually installed and updated)
" Plug '~/my-prototype-plugin'

" Initialize plugin system
call plug#end()


"================================================"
"=============== EDITOR SETTINGS ================"
"================================================"


" general settings
syntax on
set number
syntax enable
filetype plugin indent on
set laststatus=2
set hlsearch
set clipboard=unnamed
set cursorline
let python_highlight_all=1

" tab settings
au BufNewFile,BufRead *.py
    \ set tabstop=8 |
    \ set shiftwidth=4 |
    \ set softtabstop=4 |
    \ set expandtab |
    \ set autoindent |
    \ set smartindent |
au BufNewFile,BufRead *.js, *.html, *.css
    \ set tabstop=2 |
    \ set softtabstop=2 |
    \ set shiftwidth=2 |

" encoding settings
set encoding=utf-8
set fileencodings=iso-2022-jp,cp932,sjis,euc-jp,utf-8

" colorscheme settings
set background=dark
" set term=xterm-256color
let g:solarized_termcolors=256
let g:solarized_visibility = "high"
let g:solarized_contrast = "high"
colorscheme hybrid

set foldmethod=marker

" spell check settings
au BufNewFile,BufRead *.tex
    \ setlocal spell |
    \ setlocal spell spelllang=en_us |
au BufNewFile,BufRead *.txt
    \ setlocal spell |
    \ setlocal spell spelllang=en_us |
hi clear SpellBad
hi SpellBad cterm=underline,bold ctermfg=red

" airline settings
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#left_sep = ' '
let g:airline#extensions#tabline#left_alt_sep = '|'
"let g:airline_theme='cool'
let g:airline_theme='one'
let g:airline_powerline_fonts = 0
let NERDTreeIgnore=['\.pyc$', '\~$', '\.aux$', '\.bbl$', '\.blg$', '\.dvi$', '\.lof$', '\.log$', '\.pdf$', '\.toc$', '\.lot$'] "ignore files in NERDTree

" make backspaces more powerfull
set backspace=indent,eol,start

" js stuff
autocmd FileType javascript setlocal shiftwidth=2 tabstop=2

" python stuff
autocmd FileType python set omnifunc=pythoncomplete#Complete

" syntastic settings
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*
let g:syntastic_always_populate_loc_list = 0
let g:syntastic_auto_loc_list = 0
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0

let g:jedi#force_py_version = 3
