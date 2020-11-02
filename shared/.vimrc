" All system-wide defaults are set in $VIMRUNTIME/archlinux.vim (usually just
" /usr/share/vim/vimfiles/archlinux.vim) and sourced by the call to :runtime
" you can find below.  If you wish to change any of those settings, you should
" do it in this file (/etc/vimrc), since archlinux.vim will be overwritten
" everytime an upgrade of the vim packages is performed.  It is recommended to
" make changes after sourcing archlinux.vim since it alters the value of the
" 'compatible' option.
 
" This line should not be removed as it ensures that various options are
" properly set to work with the Vim-related packages.
runtime! archlinux.vim

" If you prefer the old-style vim functionalty, add 'runtime! vimrc_example.vim'
" Or better yet, read /usr/share/vim/vim80/vimrc_example.vim or the vim manual
" and configure vim to your own liking!

" do not load defaults if ~/.vimrc is missing
"let skip_defaults_vim=1
set number
set mouse=a
set numberwidth=1
set clipboard=unnamed
syntax enable
set showcmd
set ruler
set cursorline
set encoding=utf-8
set showmatch
set sw=2
set relativenumber
set noshowmode
set laststatus=2

call plug#begin('~/.vim/plugged')

" ======= THEMES =======

Plug 'morhetz/gruvbox'
Plug 'dracula/vim'
Plug 'tomasr/molokai'
Plug 'nanotech/jellybeans.vim'
Plug 'gosukiwi/vim-atom-dark'
Plug 'kyoz/purify', { 'rtp': 'vim'}

" ======= IDE =======

Plug 'neoclide/coc.nvim', { 'branch': 'release' }
Plug 'easymotion/vim-easymotion'
Plug 'scrooloose/nerdtree'
Plug 'Xuyuanp/nerdtree-git-plugin'
Plug 'christoomey/vim-tmux-navigator'
Plug 'ryanoasis/vim-devicons'
Plug 'bling/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'leafgarland/typescript-vim'
Plug 'peitalin/vim-jsx-typescript'
Plug 'tpope/vim-fugitive'
Plug 'ctrlpvim/ctrlp.vim'
Plug 'SirVer/ultisnips'
Plug 'honza/vim-snippets'
Plug 'haya14busa/incsearch.vim'
Plug 'haya14busa/incsearch-easymotion.vim'
Plug 'vim-scripts/taglist.vim'
Plug 'preservim/nerdcommenter'
Plug 'rstacruz/sparkup'
Plug 'jiangmiao/auto-pairs'
Plug 'mg979/vim-visual-multi'
Plug 'dense-analysis/ale'
Plug 'turbio/bracey.vim', {'do': 'npm install --prefix server'} 
Plug 'ap/vim-templates'
Plug 'enricobacis/vim-airline-clock'

let g:coc_global_extensions = ['coc-emmet', 'coc-css', 'coc-html', 'coc-json', 'coc-prettier', 'coc-tsserver', 'coc-snippets']

call plug#end()

" ======= CONFIG =======

let g:ale_disable_lsp = 1
" === Color schemes ===
let g:gruvbox_contrast_dark = "hard"
let g:gruvbox_italic = 1
"let g:gruvbox_improved_strings = 1
let g:gruvbox_improved_warnings = 1
let g:gruvbox_invert_tabline = 1

"colorscheme gruvbox 

"colorscheme molokai 
"let g:rehash256 = 1
"let g:molokai_original = 1

"colorscheme atom-dark

"let g:jellybeans_use_term_italics = 1
"let g:jellybeans_overrides = {
"\    'background': { 'ctermbg': 'none', '256ctermbg': 'none' },
"\}
"if has('termguicolors') && &termguicolors
    "let g:jellybeans_overrides['background']['guibg'] = 'none'
"endif
colorscheme jellybeans

"syntax on
"colorscheme purify

let NERDTreeQuitOnOpen = 1
let NERDTreeStatusLine = 1
"let g:NERDTreeMinimalUI = 1
let g:airline#extensions#nerdtree_statusline = 1
let g:airline_detect_modified = 1
let g:airline_detect_spell = 1
let g:airline_detect_spelllang = 1
let g:airline_powerline_fonts = 1

" === taglist(attributes&functions list) ===
let g:Tlist_Use_Right_Window = 1
let g:Tlist_WinWidth = 50

" === bracery(live server) ===
let g:bracey_refresh_on_save = 1

" === ALE(Linting) ===
let g:ale_sign_error = 'X '
let g:ale_sign_warning = '! '

" ======= KEYMAPPINGS =======

let mapleader=" "
"let g:tmux_navigator_no_mappings = 1


" use alt+hjkl to move between split/vsplit panels
tnoremap <A-h> <C-\><C-n><C-w>h
tnoremap <A-j> <C-\><C-n><C-w>j
tnoremap <A-k> <C-\><C-n><C-w>k
tnoremap <A-l> <C-\><C-n><C-w>l
nnoremap <A-h> <C-w>h
nnoremap <A-j> <C-w>j
nnoremap <A-k> <C-w>k
nnoremap <A-l> <C-w>l

" === easymotion ===
nmap <Leader>s <Plug>(easymotion-s2)
nmap <Leader>/ <Plug>(incsearch-easymotion-/)
nmap <Leader>? <Plug>(incsearch-easymotion-?)
nmap <Leader>g/ <Plug>(incsearch-easymotion-stay)
"let g:call incsearch#call(incsearch#config#easymotion#make())

" === nerdtree ===
nmap <Leader>nt :NERDTreeFind<CR>

" === fuzzyfinder ===
nmap <silent> <Leader>dd <Plug>(coc-definition)
nmap <silent> <Leader>dr <Plug>(coc-references)
nmap <silent> <Leader>di <Plug>(coc-implementation)

" === taglist ===
nnoremap <silent> <F8> :TlistToggle<CR>

"noremap <silent><expr> <Space>/ incsearch#go(<SID>config_easyfuzzymotion())

" ======= SNIPPETS =======

" Make <tab> used for trigger completion, completion confirm, snippet expand and jump like VSCode.
inoremap <silent><expr> <TAB>
      \ pumvisible() ? coc#_select_confirm() :
      \ coc#expandableOrJumpable() ? "\<C-r>=coc#rpc#request('doKeymap', ['snippets-expand-jump',''])\<CR>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()

function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

let g:coc_snippet_next = '<tab>'



" ======= INTEGRATED TERMINAL =======
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
  resize 10
endfunction
nnoremap <Leader><c-n> :call OpenTerminal()<CR>




