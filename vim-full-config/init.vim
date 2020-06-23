"----------------------------------------"
"--------------- PLUGINS ----------------"
"----------------------------------------"
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
Plug 'SirVer/ultisnips' | Plug 'honza/vim-snippets'

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
" GraphQL
Plug 'jparise/vim-graphql'
" Nord
Plug 'arcticicestudio/nord-vim'
" CoC
Plug 'neoclide/coc.nvim', { 'branch': 'release' }
inoremap <expr> <Tab> pumvisible() ? "\<C-n>" : "\<Tab>"
inoremap <expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"
inoremap <silent><expr> <C-space> coc#refresh()

"GoTo code navigation
nmap <leader>g <C-o>
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gt <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)
nmap <leader>rn <Plug>(coc-rename)

"show all diagnostics.
nnoremap <silent> <space>d :<C-u>CocList diagnostics<cr>
"manage extensions.
nnoremap <silent> <space>e :<C-u>CocList extensions<cr>

" Initialize plugin system
call plug#end()

"------------------------------------------------"
"--------------- EDITOR SETTINGS ----------------"
"------------------------------------------------"

" general settings
syntax on
set number
syntax enable
filetype plugin indent on

" set laststatus=2
set hlsearch
set clipboard=unnamed
set cursorline
let python_highlight_all=1

" terminal mode
tnoremap <silent> <ESC> <C-\><C-n>
set sh=zsh

" tab settings
au BufNewFile,BufRead *.js, *.html, *.css, *.json
    \ set tabstop=2 |
    \ set softtabstop=2 |
    \ set shiftwidth=2 |
au BufNewFile,BufRead *.py
    \ set tabstop=8 |
    \ set shiftwidth=4 |
    \ set softtabstop=4 |
    \ set expandtab |
    \ set autoindent |
    \ set smartindent |

" encoding settings
set encoding=utf-8
set fileencodings=utf-8,iso-2022-jp,cp932,sjis,euc-jp

" colorscheme settings
set background=dark
"set term=xterm-256color
let g:solarized_termcolors=256
let g:solarized_visibility = "high"
let g:solarized_contrast = "high"

" for Nord set Vim-specific sequences for RGB colors
let g:nord_italic = 1
let g:nord_cursor_line_number_background = 0
let g:nord_uniform_status_lines = 1
let g:nord_italic_comments = 1

let &t_8f = "\<Esc>[38;2;%lu;%lu;%lum"
let &t_8b = "\<Esc>[48;2;%lu;%lu;%lum"
if (has("termguicolors"))
  set termguicolors
endif
colorscheme nord

" Fold setttings
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
let g:airline_theme='cool'
"let g:airline_theme='one'
let g:airline_powerline_fonts = 1
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

" CoC settings
highlight CocErrorSign ctermfg=15 ctermbg=196
highlight CocWarningSign ctermfg=0 ctermbg=172

" Custom function
function! WinMove(key)
    let t:curwin = winnr()
    exec "wincmd ".a:key
    if (t:curwin == winnr())
        if (match(a:key,'[jk]'))
            wincmd v
        else
            wincmd s
        endif
        exec "wincmd ".a:key
    endif
endfunction

nnoremap <silent> <C-h> :call WinMove('h')<CR>
nnoremap <silent> <C-j> :call WinMove('j')<CR>
nnoremap <silent> <C-k> :call WinMove('k')<CR>
nnoremap <silent> <C-l> :call WinMove('l')<CR>
