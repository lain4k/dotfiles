set number
set tabstop=3
set shiftwidth=3
set softtabstop=3
set relativenumber
set termguicolors

inoremap { {}<Esc>ha
inoremap ( ()<Esc>ha
inoremap [ []<Esc>ha
inoremap " ""<Esc>ha
inoremap ' ''<Esc>ha
inoremap ` ``<Esc>ha
nmap <esc><esc> :silent! noh<cr>

hi MatchParen ctermbg=none ctermfg=cyan

call plug#begin()
Plug 'norcalli/nvim-colorizer.lua'
call plug#end()

lua require'colorizer'.setup()

let g:everforest_background = 'hard'  " Options: 'hard', 'medium', 'soft'
colorscheme everforest
