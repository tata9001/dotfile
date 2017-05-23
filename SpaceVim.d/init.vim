"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"                               Official Default                              "
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" let g:spacevim_simple_mode = 1
let g:spacevim_buffer_index_type = 1
" let g:spacevim_realtime_leader_guide = 1

" here are some basic customizations, please refer to the top of the vimrc file for all possible options
let g:spacevim_default_indent = 4
let g:spacevim_max_column     = 80

let g:spacevim_buffer_index_type = 3

" Change the default directory where all miscellaneous persistent files go.
" By default it is ~/.cache/vimfiles/.
let g:spacevim_plugin_bundle_dir = '~/.cache/vimfiles/'

" set SpaceVim colorscheme
let g:spacevim_colorscheme = 'spacemacs-theme'

" Set plugin manager, you want to use, default is dein.vim
let g:spacevim_plugin_manager = 'dein'  " neobundle or dein or vim-plug

" use space as `<Leader>`

let mapleader = "\<space>"

" Set windows shortcut leader [Window], default is `s`
let g:spacevim_windows_leader = 's'

" Set unite work flow shortcut leader [Unite], default is `f`
let g:spacevim_unite_leader = 'f'

" By default, language specific plugins are not loaded. This can be changed
" with the following, then the plugins for go development will be loaded.

" load layers
" call SpaceVim#layers#load('core#banner')
" call SpaceVim#layers#load('core#statusline')
" call SpaceVim#layers#load('core#tabline')
" call SpaceVim#layers#load('unit')
" call SpaceVim#layers#load('lang#python')
" call SpaceVim#layers#load('ui')
" call SpaceVim#layers#load('default')

" If there is a particular plugin you don't like, you can define this
" variable to disable them entirely:
"let g:spacevim_disabled_plugins=[
    "\ ['junegunn/fzf.vim'],
    "\ ]

" If you want to add some custom plugins, use these options:
let g:spacevim_custom_plugins = [
    \ ['plasticboy/vim-markdown', {'on_ft' : 'markdown'}],
    \ ['szw/vim-smartclose'],
    \ ['thinca/vim-quickrun'],
    \ ['colepeters/spacemacs-theme.vim'],
    \ ]

" set the guifont
let g:spacevim_guifont = 'DejaVu\ Sans\ Mono\ for\ Powerline\ 11'

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"                              Custom Keybindings                              "
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"" unmap keybinding
unmap q

"" useful keybinding
".bashrc or .zshrc add "stty -ixon"
nnoremap <C-s> :w<CR>
inoremap <C-s> <Esc>:w<CR>l
vnoremap <C-s> <Esc>:w<CR>

nnoremap <Leader>q  :q<CR>
nnoremap <Leader>Q  :qa!<CR>
inoremap jj <Esc>
vnoremap v <Esc>
nnoremap H ^
nnoremap L $
nnoremap Y y$

" Open shell in vim
map <Leader>' :shell<CR>
nnoremap <Leader>fs :update<CR>
" Search result highlight countermand
nnoremap <Leader>th :nohlsearch<CR>
" Toggle mode
noremap <silent><leader>tn :call ToggleNumber()<CR>
nnoremap <Leader>tp :setlocal paste!<CR>
"Reload .vimrc
nnoremap <Leader>fR :source %<CR>
"Startify
nnoremap <silent><Leader>bh :Startify<CR>
" vim-better-whitespace
nnoremap <Leader>xd :StripWhitespace<CR>


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"                                Custom                                       "
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set foldmethod=indent
set visualbell
set mouse=


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"                                Custom Plugins                               "
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"" easy-motion
map <Leader> <Plug>(easymotion-prefix)
map  <Leader>jj <Plug>(easymotion-bd-f)
map <Leader>jJ <Plug>(easymotion-overwin-f2)

"" nerdcommenter
map <Leader>;; <Plug>NERDCommenterToggle

"" smartclose
let g:smartclose_default_mapping_key = '<C-g>'
