let mapleader="\<Space>"

"" .bashrc or .zshrc add "stty -ixon"
nnoremap <C-s> :w<CR>
inoremap <C-s> <Esc>:w<CR>l
vnoremap <C-s> <Esc>:w<CR>

" here are some basic customizations, please refer to the top of the vimrc file for all possible options
let g:spacevim_default_indent = 4
let g:spacevim_max_column     = 80
let g:spacevim_colorscheme    = 'molokai'
let g:spacevim_plugin_manager = 'dein'
set guifont=Wingdings:h10

"let g:spacevim_cache_dir = "/some/place/else"

"let g:spacevim_plugin_groups_exclude = ['ruby', 'python']
"let g:spacevim_plugin_groups_include = ['go']
"let g:spacevim_plugin_groups = ['core', 'web']
"let g:spacevim_disabled_plugins=['vim-foo', 'vim-bar']
"let g:spacevim_custom_plugins = []
let g:spacevim_autocomplete_method = "neocomplete"

let g:spacevim_enable_cursorcolumn = 1

let g:jedi#completions_enabled = 1
let g:jedi#auto_initialization = 1
let g:jedi#auto_vim_configuration = 1
let g:jedi#use_tabs_not_buffers = 1
let g:jedi#use_splits_not_buffers = "left"
