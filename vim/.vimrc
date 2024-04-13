set exrc
set rtp+=$HOME/checkout/fzf
syntax enable

set backspace=indent,eol,start

autocmd FileType gitcommit setlocal spell

setlocal tabstop=8
setlocal shiftwidth=8
setlocal softtabstop=8
setlocal textwidth=100
setlocal noexpandtab

" set list
autocmd BufEnter ?akefile* set noet ts=8 sw=8 nocindent
set titlestring=%f title        "

let mapleader=","       " leader is comma

nmap <leader>f :Files<CR>
nmap <leader>b :Buffers<CR>
nmap <leader>m :Marks<CR>

nmap <leader>c :YcmCompleter GoToCallers<CR>
nmap <leader>g :YcmCompleter GoTo<CR>
nmap <leader>t <C-o>
nmap <leader>h :YcmCompleter GoToAlternateFile<CR>

map <leader>r :YcmCompleter RefactorRename 
nmap <leader>q <plug>(YCMHover)

xnoremap <leader>= :ClangFormat<CR>

nmap <C-j> <PageDown>
nmap <C-k> <PageUp>

nmap j gj
nmap k gk
nmap \w :setlocal wrap!<CR>:setlocal wrap?<CR>

set cursorline          " highlight current line
set laststatus=2
set splitright

set mouse=a
set ttymouse=sgr
set balloonevalterm
" Styled and colored underline support
let &t_AU = "\e[58:5:%dm"
let &t_8u = "\e[58:2:%lu:%lu:%lum"
let &t_Us = "\e[4:2m"
let &t_Cs = "\e[4:3m"
let &t_ds = "\e[4:4m"
let &t_Ds = "\e[4:5m"
let &t_Ce = "\e[4:0m"
" Strikethrough
let &t_Ts = "\e[9m"
let &t_Te = "\e[29m"
" Truecolor support
let &t_8f = "\e[38:2:%lu:%lu:%lum"
let &t_8b = "\e[48:2:%lu:%lu:%lum"
let &t_RF = "\e]10;?\e\\"
let &t_RB = "\e]11;?\e\\"
" Bracketed paste
let &t_BE = "\e[?2004h"
let &t_BD = "\e[?2004l"
let &t_PS = "\e[200~"
let &t_PE = "\e[201~"
" Cursor control
let &t_RC = "\e[?12$p"
let &t_SH = "\e[%d q"
let &t_RS = "\eP$q q\e\\"
let &t_SI = "\e[5 q"
let &t_SR = "\e[3 q"
let &t_EI = "\e[1 q"
let &t_VS = "\e[?12l"
" Focus tracking
let &t_fe = "\e[?1004h"
let &t_fd = "\e[?1004l"
execute "set <FocusGained>=\<Esc>[I"
execute "set <FocusLost>=\<Esc>[O"
" Window title
let &t_ST = "\e[22;2t"
let &t_RT = "\e[23;2t"

" vim hardcodes background color erase even if the terminfo file does
" not contain bce. This causes incorrect background rendering when
" using a color theme with a background color in terminals such as
" kitty that do not support background color erase.
let &t_ut=''

"set t_Co=256
"colorscheme solarized
set termguicolors
set background=dark
colorscheme gruvbox

highlight ExtraWhitespace ctermbg=red guibg=red
match ExtraWhitespace /\s\+$/

set grepprg=ag\ --nogroup\ --nocolor

"set colorcolumn=101

"set tags=tags;/

hi clear SpellBad
hi SpellBad cterm=underline

" Let clangd fully control code completion
let g:ycm_clangd_uses_ycmd_caching = 0
" Use installed clangd, not YCM-bundled clangd which doesn't get updates.
let g:ycm_clangd_binary_path = exepath("clangd")
let g:ycm_autoclose_preview_window_after_insertion = 1

let g:highlightedyank_highlight_duration = 150
let g:highlightedyank_highlight_in_visual = 0

set secure
