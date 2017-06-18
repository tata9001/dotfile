"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"                           Load Plugins and Layers                           "
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"let g:spacevim_simple_mode = 1
call SpaceVim#layers#load('lang#go')
call SpaceVim#layers#load('lang#javascript')
call SpaceVim#layers#load('lang#vim')
call SpaceVim#layers#load('lang#python')
call SpaceVim#layers#load('shell')
" If you want to add some custom plugins, use these options:
let g:spacevim_custom_plugins = [
    \ ['plasticboy/vim-markdown', {'on_ft' : 'markdown'}],
    \ ['szw/vim-smartclose'],
    \ ['thinca/vim-quickrun'],
    \ ['colepeters/spacemacs-theme.vim'],
    \ ]

"let g:spacevim_disabled_plugins=[
"\ ['junegunn/fzf.vim'],
"\ ]

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"                                Custom                                       "
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set foldmethod=indent
set visualbell
set mouse=

let g:spacevim_enable_debug = 0
let g:spacevim_realtime_leader_guide = 1
let g:spacevim_enable_vimfiler_welcome = 1
let g:deoplete#auto_complete_delay = 150
let g:spacevim_enable_tabline_filetype_icon = 1
let g:spacevim_enable_os_fileformat_icon = 1
let g:spacevim_buffer_index_type = 1
let g:neomake_vim_enabled_makers = ['vimlint', 'vint']
if has('python3')
    let g:ctrlp_map = ''
    nnoremap <silent> <C-p> :Denite file_rec<CR>
endif

let g:spacevim_default_indent = 4
let g:spacevim_max_column     = 80
let g:spacevim_colorscheme = 'spacemacs-theme'

"let mapleader = "<space>"
let g:spacevim_windows_leader = 's'
let g:spacevim_unite_leader = 'f'

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

" call SpaceVim#custom#SPC('nnoremap', ['t', 'f'], 'echom "hello world"', 'test custom SPC', 1)

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"                                Custom Plugins                               "
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"" nerdcommenter
map <Leader>;; <Plug>NERDCommenterToggle

"" smartclose
let g:smartclose_default_mapping_key = '<C-g>'
