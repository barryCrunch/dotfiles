call plug#begin('~/.config/nvim/plugged')

Plug 'SirVer/ultisnips'
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
Plug 'preservim/nerdtree'
Plug 'preservim/nerdcommenter'
Plug 'vim-airline/vim-airline'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-fugitive'
Plug 'jiangmiao/auto-pairs'
Plug 'dracula/vim', { 'as': 'dracula' }
Plug 'thinca/vim-quickrun'
Plug 'ryanoasis/vim-devicons'
Plug 'junegunn/goyo.vim'
Plug 'pangloss/vim-javascript'
Plug 'pangloss/vim-javascript'
Plug 'mhinz/vim-startify'
Plug 'easymotion/vim-easymotion'
Plug 'arcticicestudio/nord-vim'
Plug 'ekalinin/Dockerfile.vim'

call plug#end()

"source $HOME/.config/nvim/plug-config/coc.vim

let g:airline_theme='nord'
let g:airline_powerline_fonts = 1
let g:airline#extensions#tabline#enabled = 1

let mapleader = " "
set ignorecase
set smartcase
set mouse=a
set number
set relativenumber
set scrolloff=5
highlight VertSplit cterm=None gui=None
highlight SignColumn cterm=None gui=None
highlight FoldColumn cterm=None gui=None
highlight clear SignColumn
set signcolumn=yes
colorscheme nord


set expandtab tabstop=4 shiftwidth=4
set clipboard=unnamedplus

""""""""""""""""""""""
" Normal Mode Mappings
" """"""""""""""""""""
:nnoremap <leader>d dd
:nnoremap <leader>c ddO

:nnoremap <leader>ev :vsplit $MYVIMRC<cr>
:nnoremap <leader>sv :source $MYVIMRC<cr>

:nnoremap <leader>w :w<cr>
:nnoremap ZZ :wq<cr>
:nnoremap <leader>q :q<cr>

:nnoremap vw viw
:nnoremap vW viW

:nnoremap H 0
:nnoremap L $

nnoremap <leader><leader>n :set nu! rnu!<cr>

nnoremap <leader><leader>f :Files /<cr>

""""""""""""""""""""""
" Insert Mode Mappings
" """"""""""""""""""""
:inoremap <c-u> <esc>viwUi

:inoremap jk <esc>

:inoremap <esc> <nop>

""""""""""""""""""""""
" Visual Mode Mappings
" """"""""""""""""""""

""""""""""""""""""""""
" AutoCommands
" """"""""""""""""""""
:autocmd BufnewFile * :write
:autocmd BufWritePre,BufRead *.html,*.yml normal gg=G

:autocmd FileType javascript nnoremap <buffer> <localleader>c I//<esc>
:autocmd FileType python nnoremap <buffer> <localleader>c I#<esc>


""""""""""""""""""""""""
" Coc.nvim configuration
""""""""""""""""""""""""

set nobackup
set nowritebackup
set cmdheight=2
set colorcolumn=0

" Use Tab for trigger complettion with characters ahead and navigate
inoremap <silent><expr> <TAB>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

function! s:check_back_space() abort
        let col = col('.') - 1
        return !col || getline('.')[col - 1]  =~# '\s'
endfunction

if has('nvim')
  inoremap <silent><expr> <c-space> coc#refresh()
else
  inoremap <silent><expr> <c-@> coc#refresh()
endif

inoremap <silent><expr> <cr> pumvisible() ? coc#_select_confirm()
                              \: "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"

nmap <silent> [g <Plug>(coc-diagnostic-prev)
nmap <silent> ]g <Plug>(coc-diagnostic-next)

nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

"""""""""""""""""""""""""
" Coc.snippets Configuration
"""""""""""""""""""""""""
"inoremap <silent><expr> <TAB>
      "\ pumvisible() ? coc#_select_confirm() :
      "\ coc#expandableOrJumpable() ? "\<C-r>=coc#rpc#request('doKeymap', ['snippets-expand-jump',''])\<CR>" :
      "\ <SID>check_back_space() ? "\<TAB>" :
      "\ coc#refresh()

"function! s:check_back_space() abort
      "let col = col('.') - 1
        "returDCreateDefaultMappings = 1 - 1]  =~# '\s'
"endfunction

"let g:coc_snippet_next = '<tab>'
xmap <leader>x <Plug>(coc-convert-snippet)

"""""""""""""""""""""""""
" Apperance Configuration
"""""""""""""""""""""""""
set fillchars+=vert:│
hi VertSplit ctermbg=NONE guibg=NONE


let g:UltiSnipsEditSplit="vertical"


"""""""""""""""""""""""""
" NERD Commenter Configuraton
""""""""""""""""""""""""""

let g:NERDCreateDefaultMappings = 1



"""""""""""""""""""""""""
" Terminal Configuration
"""""""""""""""""""""""""
" open new split panes to right and below
set splitright
set splitbelow
" turn terminal to normal mode with escape
tnoremap <Esc> <C-\><C-n>
" start terminal in insert mode
au BufEnter * if &buftype == 'terminal' | :startinsert | endif
" open terminal on ctrl+n
function! OpenTerminal()
  split term://bash
  set nonu
  set nornu
  resize 10
endfunction
nnoremap <c-n> :call OpenTerminal()<CR>
:tnoremap <A-h> <C-\><C-N><C-w>h
:tnoremap <A-j> <C-\><C-N><C-w>j
:tnoremap <A-k> <C-\><C-N><C-w>k
:tnoremap <A-l> <C-\><C-N><C-w>l
:inoremap <A-h> <C-\><C-N><C-w>h
:inoremap <A-j> <C-\><C-N><C-w>j
:inoremap <A-k> <C-\><C-N><C-w>k
:inoremap <A-l> <C-\><C-N><C-w>l
:nnoremap <A-h> <C-w>h
:nnoremap <A-j> <C-w>j
:nnoremap <A-k> <C-w>k
:nnoremap <A-l> <C-w>l
:tnoremap <Esc> <C-\><C-n>

"""""""""""""""""""""""""
" Navigation Configuration
"""""""""""""""""""""""""
" use alt+hjkl to move between split/vsplit panels
tnoremap <C-H> <C-\><C-n><C-w>h
tnoremap <C-J> <C-\><C-n><C-w>j
tnoremap <C-K> <C-\><C-n><C-w>k
tnoremap <C-L> <C-\><C-n><C-w>l
nnoremap <C-H> <C-w>h
nnoremap <C-J> <C-w>j
nnoremap <C-K> <C-w>k
nnoremap <C-L> <C-w>l

"""""""""""""""""""""""""
" FZF Configuration
"""""""""""""""""""""""""
nnoremap <C-p> :FZF<CR>
let g:fzf_action = {
  \ 'ctrl-t': 'tab split',
  \ 'ctrl-s': 'split',
  \ 'ctrl-v': 'vsplit'
  \}

"""""""""""""""""""""""""
" Notes Configuration
"""""""""""""""""""""""""

nnoremap <leader>ni :e $NOTES_DIR/index.md<CR> :cd $NOTES_DIR<CR>
