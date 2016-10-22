set exrc
execute pathogen#infect()
filetype plugin indent on
syntax enable
set backspace=indent,eol,start
set mouse=a
set tabstop=8 shiftwidth=8 softtabstop=8
set cindent cinoptions=>4,n-2,{2,^-2,\:0,=2,g0,h2,t0,+2,(0,u0,w1,m1
" set list
autocmd BufEnter ?akefile* set noet ts=8 sw=8 nocindent
set titlestring=%f title        "
let mapleader=","       " leader is comma
map <Left> <Nop>
map <Right> <Nop>
map <Up> <Nop>
map <Down> <Nop>
set autochdir
:let w:m1=matchadd('ErrorMsg', '\%>80v.\+', -1)
" jk is escape
" inoremap jk <esc>
map ,n :NERDTreeToggle<CR>
map ,p :CtrlP<CR>
map ,b ::CtrlPBuffer<CR>
:set cursorline          " highlight current line
:nmap j gj
:nmap k gk
:nmap \w :setlocal wrap!<CR>:setlocal wrap?<CR>
" Always show statusline
set laststatus=2
" Use 256 colours (Use this setting only if your terminal supports 256 colours)
set t_Co=256
colorscheme solarized
" colorscheme pencil
set background=dark

" CtrlP settings
let g:ctrlp_match_window = 'bottom,order:ttb'
let g:ctrlp_switch_buffer = 0
let g:ctrlp_working_path_mode = 0
let g:ctrlp_user_command = 'ag %s -l --nocolor --hidden -g ""'

" toggle gundo
nnoremap <leader>u :GundoToggle<CR>

autocmd FileType gitcommit setlocal spell

let g:syntastic_c_check_header = 1
let g:syntastic_c_compiler = 'clang'
set splitright
set tags=tags;/
nmap <F8> :make<CR>
nmap <F7> :cn<CR>
nmap <F6> :cp<CR>
nmap <F5> :TagbarToggle<CR>
" :hi CursorLine   cterm=NONE ctermbg=darkred ctermfg=white
set gfn=Source\ Code\ Pro\ for\ Powerline\ Medium\ 11
set guifont=Source\ Code\ Pro\ for\ Powerline\ Medium\ 10
:set guioptions-=m  "remove menu bar
:set guioptions-=T  "remove toolbar
:set guioptions-=r  "remove right-hand scroll bar
:set guioptions-=L  "remove left-hand scroll bar
set secure
