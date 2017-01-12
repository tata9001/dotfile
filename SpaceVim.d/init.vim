let mapleader="\<Space>"

"" .bashrc or .zshrc add "stty -ixon"
nnoremap <C-s> :w<CR>
inoremap <C-s> <Esc>:w<CR>l
vnoremap <C-s> <Esc>:w<CR>

noremap <silent><leader>tn :call ToggleNumber()<CR>
" Quit normal mode
nnoremap <Leader>q  :q<CR>
nnoremap <Leader>Q  :qa!<CR>

" jk | escaping
inoremap jj <Esc>

" Quit visual mode
vnoremap v <Esc>
" Move to the start of line
nnoremap H ^
" Move to the end of line
nnoremap L $
" Redo
nnoremap U <C-r>
" Yank to the end of line
nnoremap Y y$
" Open shell in vim
map <Leader>' :shell<CR>
" Search result highlight countermand
nnoremap <Leader>ns :nohlsearch<CR>
" Toggle pastemode
nnoremap <Leader>tp :setlocal paste!<CR>
" File save
nnoremap <Leader>fs :update<CR>

" easy-motion
" <Leader>f{char} to move to {char}
map <Leader> <Plug>(easymotion-prefix)

map  <Leader>jj <Plug>(easymotion-bd-f)
nmap <Leader>jj <Plug>(easymotion-overwin-f)

" nerdcommenter
map <Leader>;; <Plug>NERDCommenterToggle
let g:NERDSpaceDelims = 1
let g:NERDTrimTrailingWhitespace = 1
let g:NERDCommentEmptyLines = 1
let g:NERDDefaultAlign = 'left'

" neosnippet
let g:neosnippet#enable_snipmate_compatibility = 1
let g:neosnippet#snippets_directory=[
\ "~/.cache/vimfiles/repos/github.com/honza/vim-snippets/UltiSnips",
\ "~/.cache/vimfiles/repos/github.com/honza/vim-snippets/snippets",
\ ]

" Reload .vimrc
nnoremap <Leader>fR :source ~/.SpaceVim.d/init.vim<CR>

" Startify
nnoremap <silent><Leader>bh :Startify<CR>

" vim-better-whitespace
nnoremap <Leader>xd :StripWhitespace<CR>

" here are some basic customizations, please refer to the top of the vimrc file for all possible options
let g:spacevim_default_indent = 4
let g:spacevim_max_column     = 80
let g:spacevim_colorscheme    = 'molokai'
let g:spacevim_plugin_manager = 'dein'
set guifont=Wingdings:h10

"let g:spacevim_cache_dir = "/some/place/else"

let g:spacevim_plugin_groups_exclude = []
let g:spacevim_plugin_groups_include = ["easymotion/vim-easymotion"]
"let g:spacevim_plugin_groups = ["core"]

"let g:spacevim_disabled_plugins=[]
"let g:spacevim_custom_plugins = []

let g:spacevim_autocomplete_method = "neocomplete"

let g:spacevim_enable_cursorcolumn = 1

let g:jedi#completions_enabled = 1
let g:jedi#auto_initialization = 1
let g:jedi#auto_vim_configuration = 1
let g:jedi#use_tabs_not_buffers = 1
let g:jedi#use_splits_not_buffers = "left"
