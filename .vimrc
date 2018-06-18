call plug#begin('~/.vim/plugged')

Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'

call plug#end()

set exrc
execute pathogen#infect()
filetype plugin indent on
syntax enable

set backspace=indent,eol,start
set mouse=a

autocmd FileType gitcommit setlocal spell

setlocal tabstop=8
setlocal shiftwidth=8
setlocal softtabstop=8
setlocal textwidth=80
setlocal noexpandtab
setlocal cindent
setlocal cinoptions=:0,l1,t0,g0,(0

" set list
autocmd BufEnter ?akefile* set noet ts=8 sw=8 nocindent
set titlestring=%f title        "

let mapleader=","       " leader is comma

map <Left> <Nop>
map <Right> <Nop>
map <Up> <Nop>
map <Down> <Nop>

function! s:find_git_root()
  return system('git rev-parse --show-toplevel 2> /dev/null')[:-2]
endfunction

map ,n :NERDTreeToggle<CR>
map ,b :Buffers<CR>
map ,m :Marks<CR>
map ,p :Files<CR>
map ,gb :Gblame<CR>

nmap <F6> :TagbarToggle<CR>

nmap j gj
nmap k gk
nmap \w :setlocal wrap!<CR>:setlocal wrap?<CR>

set cursorline          " highlight current line
set laststatus=2
set splitright

set t_Co=256
colorscheme solarized
set background=dark

highlight ExtraWhitespace ctermbg=red guibg=red
match ExtraWhitespace /\s\+$/

set grepprg=ag\ --nogroup\ --nocolor

:set colorcolumn=81

" toggle gundo
nnoremap <leader>u :GundoToggle<CR>

set tags=tags;/

set gfn=Source\ Code\ Pro\ for\ Powerline\ Medium\ 11

hi clear SpellBad
hi SpellBad cterm=underline

set secure
