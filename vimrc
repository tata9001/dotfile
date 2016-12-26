"++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++#
"#
"#   @DESCRIPTION: vimrc
"#   @NAME: .vimrc
"#   @VERSION: 1.0
"#   @CREATE: 11/30/16 23:51:35
"#   @UPDATE: 2016-12-01 10:46
"#   @Author: Colin.Lee <geek.colin@gmail.com>
"#
"++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++#

set nocompatible

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"                                 OS System                                  "
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" get os system {
function! GetRunningOS()
  if has("win32")
    return "win"
  endif
  if has("unix")
    if system('uname')=~'Darwin'
        return "mac"
    else
        return "linux"
    endif
  endif
endfunction

let os = GetRunningOS()

if os=="win"
   set guioptions-=m
   set guioptions-=T
   language message zh_CN.utf-8
endif
" }

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"                                   Plugin                                   "
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Launch vim and run :PluginInstall
" To install from command line: vim +PluginInstall +qall

if os == "mac" || os == "linux"
   set rtp+=~/.vim/bundle/Vundle.vim
endif

if os == "win"
   set rtp+=~/dotfiles/bundle/Vundle.vim
endif

filetype off
" set plugin lists {
    call vundle#begin()

    " git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim
    Plugin 'VundleVim/Vundle.vim'
    Plugin 'flazz/vim-colorschemes'
    Plugin 'scrooloose/nerdtree'
    Plugin 'kien/ctrlp.vim'
    Plugin 'vim-airline/vim-airline'
    Plugin 'vim-airline/vim-airline-themes'
    Plugin 'scrooloose/nerdcommenter'
    " Plugin 'valloric/youcompleteme'
    " Plugin 'scrooloose/syntastic'
    Plugin 'shougo/neocomplete.vim'
    Plugin 'honza/vim-snippets'
    Plugin 'SirVer/ultisnips'
    Plugin 'jiangmiao/auto-pairs'
    Plugin 'ervandew/supertab'
    Plugin 'rking/ag.vim'
    Plugin 'yggdroot/indentline'
    Plugin 'easymotion/vim-easymotion'
    Plugin 'thinca/vim-quickrun'
    Plugin 'godlygeek/tabular'
    Plugin 'davidhalter/jedi-vim'
    Plugin 'ekalinin/dockerfile.vim'

    call vundle#end()
    filetype plugin indent on
" }

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"                                  General                                   "
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

set guifont=Sauce\ Code\ Powerline:h16
syntax enable
set t_Co=256
set laststatus=2
set relativenumber
"set shortmess=atI
set number
set showcmd
set lz
set incsearch
set hlsearch
set showmatch
set nowb
set autoindent
set smartindent
set cindent
set wildmenu
set nofen
set softtabstop=4 shiftwidth=4 expandtab smarttab
set foldmethod=indent
set foldlevel=3
set history=400
set autoread
set cursorline
set cursorcolumn
set ruler
set nobackup
set backupcopy=yes
set autochdir
set ignorecase smartcase
set guioptions-=L " hide lift rollbar
set guioptions-=r " hide right rollbar
set mouse=v
set mousehide               " Hide the mouse cursor while typing
set nowrap                      " Do not wrap long lines
set wrap
set autoindent                  " Indent at the same level of the previous line
set nojoinspaces                " Prevents inserting two spaces after punctuation on a join (J)
set splitright                  " Puts new vsplit windows to the right of the current
set splitbelow                  " Puts new split windows to the bottom of the current
set pastetoggle=<F12>       " pastetoggle (sane indentation on pastes)
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"                                 Keybinding                                 "
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let mapleader = "\<space>"
map Y y$
inoremap jj <Esc>

"" C-s save to file
"" .bashrc or .zshrc add "stty -ixon"
nnoremap <C-s> :w<CR>
inoremap <C-s> <Esc>:w<CR>l
vnoremap <C-s> <Esc>:w<CR>

""" windows
nnoremap <c-h> <c-w>h
nnoremap <c-j> <c-w>j
nnoremap <c-k> <c-w>k
nnoremap <c-l> <c-w>l

""" buff
map <Leader>1 :b 1<CR>
map <Leader>2 :b 2<CR>
map <Leader>3 :b 3<CR>
map <Leader>4 :b 4<CR>
map <Leader>5 :b 5<CR>
map <Leader>6 :b 6<CR>
map <Leader>7 :b 7<CR>
map <Leader>8 :b 8<CR>
map <Leader>9 :b 9<CR>
nnoremap [b :bp<CR>
nnoremap ]b :bn<CR>


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"                            Plugin Configuration                            "
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" tmux  {
  if exists('$TMUX')
     set term=screen-256color
  endif
  if exists('$ITERM_PROFILE')
     if exists('$TMUX')
        let&t_SI ="\<Esc>[3 q"
        let&t_EI ="\<Esc>[0 q"
     else
        let&t_SI ="\<Esc>]50;CursorShape=1\x7"
        let&t_EI ="\<Esc>]50;CursorShape=0\x7"
    endif
  endif
" }
" theme plugin {
    colorscheme molokai
    let g:rehash256 = 1
    if has('gui_running')
        set background=dark
    else
        set background=dark
    endif
" }

" nerdtree plugin {
    map <Leader>t :NERDTreeToggle<CR>
    autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif
    let g:NERDTreeDirArrowExpandable = '▸'
    let g:NERDTreeDirArrowCollapsible = '▾'

" }

" ctrlP plugin {
    let g:trlp_cmd = 'CtrlP'
    let g:ctrlp_map = '<C-p>'
    let g:ctrlp_working_path_mode = 'ra'
    let g:ctrlp_user_command = 'find %s -type f'
    " let g:ctrlp_user_command = 'dir %s /-n /b /s /a-d'  "windows
    let g:ctrlp_custom_ignore = {
    \ 'dir':  '\v[\/]\.(git|hg|svn|rvm)$',
    \ 'file': '\v\.(exe|so|dll|zip|tar|tar.gz|pyc)$',
    \ }
" }

" vim-airline plugin {
    let g:airline_theme="wombat"
    let g:airline_powerline_fonts = 1
    let g:airline#extensions#tabline#enabled = 1
    " let g:airline_solarized_dark_inactive_border = 1
    " let g:airline#extensions#tabline#left_sep = ' '
    " let g:airline#extensions#tabline#left_alt_sep = '|'
    let g:airline#extensions#tabline#buffer_nr_show = 1
" }

" nerdcommenter plugin {
    " [count]<leader>cc |NERDComComment|
    " [count]<leader>cn |NERDComNestedComment|
    " [count]<leader>c<space> |NERDComToggleComment|
    let g:NERDSpaceDelims = 1
    let g:NERDTrimTrailingWhitespace = 1
    let g:NERDCommentEmptyLines = 1
    let g:NERDDefaultAlign = 'left'
    let g:NERDCustomDelimiters = { 'c': { 'left': '/**','right': '*/' } }
" }

""" ag plugin {
    let g:ag_prg="ag --column --nogroup --noheading"
    let g:ag_lhandler="botright lopen"
    let g:ag_working_path_mode="r"
    let g:ag_highlight=1
" }

" neocomplete plugin{
    " vim --with-lua
    let g:acp_enableAtStartup = 0
    let g:neocomplete#enable_at_startup = 1
    let g:neocomplete#enable_smart_case = 1
    let g:neocomplete#sources#syntax#min_keyword_length = 2

    " Plugin key-mappings.
    inoremap <expr><C-g>     neocomplete#undo_completion()
    inoremap <expr><C-l>     neocomplete#complete_common_string()
    inoremap <expr><BS> neocomplete#smart_close_popup()."\<C-h>"
    inoremap <expr><C-y>  neocomplete#close_popup()
    inoremap <expr><C-e>  neocomplete#cancel_popup()
    inoremap <expr><Space> pumvisible() ? "\<C-y>" : "\<Space>"
    " inoremap <expr><TAB>  pumvisible() ? "\<Down>" : "\<C-x>\<C-u>"
    let g:neosnippet#disable_runtime_snippets = 1
" }

" ultisnips plugin {
    let g:UltiSnipsExpandTrigger="<C-i>"
    let g:UltiSnipsJumpForwardTrigger = "<Tab>"
    let g:UltiSnipsJumpBackwardTrigger = "<S-Tab>"
" }


"  jedi-vim plugin {
    let g:jedi#completions_enabled = 1
    let g:jedi#auto_initialization = 1
    let g:jedi#auto_vim_configuration = 1
    let g:jedi#use_tabs_not_buffers = 1
    let g:jedi#use_splits_not_buffers = "left"

    " default Keybinding
    let g:jedi#goto_assignments_command = "<leader>ga"
    let g:jedi#goto_definitions_command = "<leader>gf"
    let g:jedi#documentation_command = "<Leander>gd"
    let g:jedi#usages_command = "<leader>gu"
    let g:jedi#completions_command = "<C-Space>"
"  }

" supertab plugin {
    let g:SuperTabDefaultCompletionType = "<c-x><c-u>"
" }
" indentline plugin {
    let g:indentLine_enabled = 1
    let g:indentLine_concealcursor = 'inc'
    let g:indentLine_conceallevel = 2
    let g:indentLine_setColors = 1
    let g:indentLine_color_term = 239
    let g:indentLine_color_gui = '#A4E57E'
    " none X terminal
    let g:indentLine_color_tty_light = 7
    let g:indentLine_color_dark = 1
    let g:indentLine_char = '┆'
" }

" easymotion plugin {
    nmap <Leader> <Plug>(easymotion-prefix)
    " <Leader>f{char} to move to {char}
    nmap <Leader>jj <Plug>(easymotion-overwin-f)
    " <Leader>s{char}{char} to move to {char}{char}
    nmap <Leader>jJ <Plug>(easymotion-overwin-f2)

" }

" vim-quickrun plugin {
    nmap<Leader>r <Plug>(quickrun)
" }

" tabular plugin {
    nmap <Leader>a= :Tabularize /=<CR>
    vmap <Leader>a= :Tabularize /=<CR>
    nmap <Leader>a: :Tabularize /:<CR>
    vmap <Leader>a: :Tabularize /:<CR>
" }


