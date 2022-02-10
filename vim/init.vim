"
"mmarcode
"configuration
"20220206
"
" muesta el numero de linea
set number
set mouse=a
set numberwidth=1
set clipboard=unnamed
syntax enable
set showcmd
"set ruler
set encoding=utf-8
set showmatch
set sw=2
set relativenumber
set laststatus=2
set noshowmode
set backspace=2
set guioptions-=T
set guioptions-=L
" numero de espacios por tab
set tabstop=4
" numero de espacios de tab al editar
set softtabstop=4
" numero de espacios para auto identación
set shiftwidth=4
set list
set listchars=tab:¬¬
" Instala plugins
call plug#begin('~/AppData/Local/nvim-data/plugged')
" Temas
Plug 'arcticicestudio/nord-vim'
" IDE
Plug 'easymotion/vim-easymotion'
Plug 'christoomey/vim-tmux-navigator'
" NerdTree
" Plug 'scrooloose/nerdtree'
Plug 'preservim/nerdtree'
Plug 'ryanoasis/vim-devicons'
" Airline
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
" Version estable coc
Plug 'neoclide/coc.nvim', {'branch': 'release'}
" Cerrar los pares () [] {} '' 
Plug 'jiangmiao/auto-pairs'
Plug 'alvan/vim-closetag'
" FZF
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
" Salir de modo insertar
Plug 'junegunn/fzf.vim',
" colorizer plugin for #fe4918
Plug 'norcalli/nvim-colorizer.lua'
" Multiple cursor like in vscode
Plug 'terryma/vim-multiple-cursors'
" Have the indent lines 
Plug 'yggdroot/indentline'
" Git Integration
Plug 'mhinz/vim-signify'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-rhubarb'
Plug 'junegunn/gv.vim'
" Smooth Scrolling
Plug 'psliwka/vim-smoothie'
call plug#end()

imap jk <Esc>
colorscheme nord
let mapleader=" "
nmap <Leader>s <Plug>(easymotion-s2)
nmap <Leader>nt :NERDTreeFind<CR>
" Cerra NT cuando se habra el archivo
" let NERDTreeQuitOnOpen=1
" guardar
nmap <Leader>w :w<CR>
" salir
nmap <Leader>q :q<CR>
" guardar y salir
nmap <Leader>wq :wq<CR>
nmap <Leader>so :so%<CR>
" comandos de busqueda
nmap <Leader>gs :CocSearch
nmap <Leader>fs :FZF<CR>
imap <C-c> <Esc>l
nmap <Leader>rg :Rg<CR>
" TAB en modo normal se moverá al siguiente buffer
nnoremap <silent> <TAB> :bnext<CR>
" SHIFT-TAB modo normal se moverá al anterior buffer
nnoremap <silent> <S-TAB> :bprevious<CR>
" cerrar buffer
nmap <Leader>bd :bdelete<CR>
" mueve bloques de codigo en modo visual o V-Line 
xnoremap K :move '<-2<CR>gv-gv
xnoremap J :move '>+1<CR>gv-gv 
" indentación
vnoremap < <gv
vnoremap > >gv
" configuracion de tabs
let g:indentLine_enabled = 1
let g:indentLine_char = '▏'
let g:indentLine_faster = 1
let g:indentLine_fileTypeExclude=["nerdtree"]

set cmdheight=1
" Cerrar tags automaticamente
let g:closetag_filenames = '*.html,*.xhtml,*.phtml, *.jsx, *.js'
" habilita tabline
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#left_sep = ''
let g:airline#extensions#tabline#left_alt_sep = ''
let g:airline#extensions#tabline#right_sep = ''
let g:airline#extensions#tabline#right_alt_sep = ''
let g:ariline_powerline_fonts = 1

if !exists('g:airline_symbols')
  let g:airline_symbols = {}
endif
" airline simbolos
let g:airline_left_sep = ''
let g:airline_left_alt_sep = ''
let g:airline_right_sep = ''
let g:airline_right_alt_sep = ''
let g:airline_symbols.branch = ''
let g:airline_symbols.readonly = ''
let g:airline_symbols.linenr = ''
" cambia el tema actual
let g:airline_theme = 'nord'
" muestra tabs
set showtabline=2
" configuración de integración con git
let g:signify_sign_add               = '+'
let g:signify_sign_delete            = '_'
let g:signify_sign_delete_first_line = '‾'
let g:signify_sign_change            = '~' 
