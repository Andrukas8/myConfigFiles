:set nu "same as set number
":set rnu "same as set relativenumber (set nornu - return to number)

:set autoindent
:set tabstop=4
:set shiftwidth=4
:set smarttab
:set softtabstop=4
:set mouse=a


call plug#begin()

Plug 'http://github.com/tpope/vim-surround' " Surrounding ysw)
Plug 'https://github.com/preservim/nerdtree' " NerdTree
Plug 'https://github.com/tpope/vim-commentary' " For Commenting gcc & gc
Plug 'https://github.com/vim-airline/vim-airline' " Status bar
Plug 'https://github.com/lifepillar/pgsql.vim' " PSQL Pluging needs :SQLSetType pgsql.vim
Plug 'https://github.com/ap/vim-css-color' " CSS Color Preview
Plug 'https://github.com/rafi/awesome-vim-colorschemes' " Retro Scheme
Plug 'https://github.com/ryanoasis/vim-devicons' " Developer Icons
Plug 'https://github.com/preservim/tagbar' " Tagbar for code navigation
Plug 'https://github.com/terryma/vim-multiple-cursors' " CTRL + N for multiple cursors
Plug 'https://github.com/neoclide/coc.nvim'  " Auto Completion
Plug 'https://github.com/catppuccin/nvim', { 'as': 'catppuccin' }
Plug 'https://github.com/vim-autoformat/vim-autoformat' " Autoformat

let g:python3_host_prog = $HOME . '/.local/venv/nvim/Scripts/python'

Plug 'averms/black-nvim', {'do': ':UpdateRemotePlugins'} " Autoformat

" C#
Plug 'OmniSharp/omnisharp-vim'

set encoding=UTF-8

call plug#end()

nnoremap <C-f> :NERDTreeFocus<CR>
nnoremap <C-n> :NERDTree<CR>
nnoremap <C-t> :NERDTreeToggle<CR>
nnoremap <C-l> :call CocActionAsync('jumpDefinition')<CR>

" Autoformat
noremap <F3> :Autoformat<CR>

" Run Python Files in nvim
nnoremap <C-`> :w !python<CR>

" Run C# File in nvim
nnoremap <A-`> :w !dotnet run<CR>

nmap <F8> :TagbarToggle<CR>

:set completeopt-=preview " For No Previews

:colorscheme catppuccin "jellybeans


let g:NERDTreeDirArrowExpandable="+"
let g:NERDTreeDirArrowCollapsible="~"
let g:coc_global_extensions=[ 'coc-omnisharp' ]


" --- Just Some Notes ---
" :PlugClean :PlugInstall :UpdateRemotePlugins
"
" :CocInstall coc-python
" :CocInstall coc-clangd
" :CocInstall omni-sharp
" :CocInstall coc-snippets
" :CocCommand snippets.edit... FOR EACH FILE TYPE

" air-line
let g:airline_powerline_fonts = 1

if !exists('g:airline_symbols')
    let g:airline_symbols = {}
endif

" airline symbols
let g:airline_left_sep = ''
let g:airline_left_alt_sep = ''
let g:airline_right_sep = ''
let g:airline_right_alt_sep = ''
let g:airline_symbols.branch = ''
let g:airline_symbols.readonly = ''
let g:airline_symbols.linenr = ''

"inoremap <expr> <Tab> pumvisible() ? coc#_select_confirm() : "<Tab>"
inoremap <expr> <Enter> pumvisible() ? coc#_select_confirm() : "<Enter>"


" function to toggle number mode
function! g:ToggleNuMode()
    if(&rnu == 1)
	set nornu
        set nu
    else
	set nonu
        set rnu
    endif
endfunc

" map the above function to F5
nnoremap <f5> :call g:ToggleNuMode()<cr>


