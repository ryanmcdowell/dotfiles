""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"                       .vimrc
"                 Settings for vim's
"                layout and interface
"
"         Version 1.5   2014 Feb 20   Ryan McDowell
"
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""



""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"                       VUNDLE
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

set nocompatible      " Be iMproved
set laststatus=2      " Always show the statusline
set encoding=utf-8

" Basic setup
filetype off
set rtp+=~/.vim/bundle/vundle
call vundle#begin()

"""""""""""""""
"   VUNDLES   "
"""""""""""""""

" Git-hub repos
Plugin 'gmarik/vundle'
Plugin 'scrooloose/nerdtree'
Plugin 'scrooloose/syntastic'
Plugin 'majutsushi/tagbar'
Plugin 'tomtom/tlib_vim'
Plugin 'sukima/xmledit'
Plugin 'Townk/vim-autoclose'
Plugin 'tomtom/tcomment_vim'
Plugin 'ervandew/supertab'
Plugin 'vim-scripts/L9'
Plugin 'vim-scripts/FuzzyFinder'
Plugin 'tomasr/molokai'
Plugin 'airblade/vim-gitgutter'
Plugin 'tpope/vim-fugitive'
Plugin 'bling/vim-airline'
Plugin 'vim-airline/vim-airline-themes'
Plugin 'kien/ctrlp.vim'
Plugin 'Rip-Rip/clang_complete'
Plugin 'basepi/vim-conque'
Plugin 'lilydjwg/colorizer'
Plugin 'terryma/vim-multiple-cursors'

call vundle#end()

" Brief help
" :PluginList          - list configured plugins
" :PluginInstall(!)    - install(update) plugins
" :PluginSearch(!) foo - search(or refresh cache first) for foo
" :PluginClean(!)      - confirm(or auto-approve) removal of unused plugins



""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"                     GENERAL
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

set ai                      " Sets auto indenting
set autoindent              " Always set autoindent on
set cindent                 " Auto indent braces
set copyindent              " Copy the previous line indent on autoindent
set cursorline!             " Visible cursorline
set equalalways             " Make splits always equal
set expandtab               " Insert space characters whenever the tab key is pressed
set hidden                  " Allows unsaved buffers to go into the bg
set history=1000            " Set how many lines of history VIM has to remember
set hlsearch                " Hightlight the last searched term
set ignorecase              " Search will ignore cases in search patterns
set incsearch               " Search for text as you enter it
set noswapfile              " Don't create a swap file
set number                  " Show line numbers
set previewheight=10        " Set constant preview height
set ruler                   " Show the cursor position in statusline
set scrolloff=999           " Don't allow the cursor to go below the middle of the page
set shell=zsh               " Use zsh as the default shell :sh"
set shiftwidth=4            " Set indents at * chars
set showmode                " Show the current mode
set smartcase               " Use upper-case characters in search pattern to case-sensitive search
set smartindent             " Smart indenting
set tabstop=4               " Set tabs at * chars
syntax on                   " Enables syntax highlighting
filetype on                 " Turn filetype detection back on
filetype plugin indent on   " Use the filetype plugins

" Folding settings
set foldmethod=indent       " Fold based on indent
set foldnestmax=10          " Deepest fold is 10 levels
set nofoldenable            " Don't fold by default
set foldlevel=2             " Set the fold level

" Fix for vi crontab error (temp file must be edited in place)
if $VIM_CRONTAB == "true"
    set nobackup
    set nowritebackup
endif

" Prevent error messages during installation by ignoring
" the colorscheme when the init parameter is passed.
if !exists('init')
    " Set the color scheme
    set t_Co=256
    let g:molokai_original = 1
    colorscheme molokai
    let g:molokai_original = 1
endif

" Set a paste toggle
set pt=<F8>

" Make backspace perform properly
set backspace=indent,eol,start

" Airline Configuration
let g:airline_theme = 'powerlineish'                    " Use the powerline theme
let g:airline_powerline_fonts = 1                       " Enable powerline fonts for special graphics
let g:airline_enable_branch = 1                         " Show the current branch in the statusline
let g:airline_enable_syntastic = 1                      " Enable syntastic support
let g:airline#extensions#tabline#enabled = 1            " Show the tabline
let g:airline#extensions#tabline#buffer_nr_show = 1     " Show buffer numbers in the tablinee


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"                       SHORTCUTS
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" Change leader mapping
let mapleader=","

" Smart way to move btw. windows
map <C-j> <C-W>j
map <C-k> <C-W>k
map <C-h> <C-W>h
map <C-l> <C-W>l

" Clear search highlights
noremap <silent><Leader>/ :nohls<CR>

" cd into dir that the file is in
" autocmd BufEnter * execute "chdir ".escape(expand("%:p:h"), ' ')

" Buffer mappings
map <Esc>1 :b1<CR>
map <Esc>2 :b2<CR>
map <Esc>3 :b3<CR>
map <Esc>4 :b4<CR>
map <Esc>5 :b5<CR>
map <Esc>6 :b6<CR>
map <Esc>7 :b7<CR>
map <Esc>8 :b8<CR>
map <Esc>9 :b9<CR>
map <Esc>q :bd<CR>



""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"                     AUTO COMPLETE
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" Set autocomplete for the filetype
autocmd FileType javascript set omnifunc=javascriptcomplete#CompleteJS
autocmd FileType html set omnifunc=htmlcomplete#CompleteTags
autocmd FileType css set omnifunc=csscomplete#CompleteCSS
autocmd FileType ruby,eruby set omnifunc=rubycomplete#Complete
autocmd FileType python set omnifunc=pythoncomplete#Complete

let g:clang_snippets = 1
let g:clang_snippets_engine = 'clang_complete'

" Autocomplete options
set wildmenu
set completeopt=menuone,longest

" Auto close the preview window
" autocmd CursorMovedI * if pumvisible() == 0|pclose|endif
" autocmd InsertLeave * if pumvisible() == 0|pclose|endif

" Make preview window appear below buffer
" autocmd BufWinEnter * call RotatePreview()
" func RotatePreview()
"   if expand('%:p') ==
"     exec 'wincmd r'
"   endif
" endfunc



""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"                      PLUGIN OPTIONS
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

""""""""""""""""""
"  FUZZYFINDER   "
""""""""""""""""""

" Map shortcuts
map <leader>ff :FufFile<cr>
map <leader>b  :FufBuffer<cr>
map <leader>d  :FufDir<cr>
map <leader>fd :FufFileWithCurrentBufferDir<cr>
map <leader>fl :FufLine<cr>
map <leader>fh :FufHelp<cr>

" Ignore case in search patterns
let g:fuf_ignoreCase = 1




""""""""""""""""""
"    NERDTREE    "
""""""""""""""""""

" Auto Open NERDTree
" autocmd VimEnter * NERDTree
" autocmd VimEnter * wincmd w
autocmd WinEnter * call s:CloseIfOnlyNerdTreeLeft()

" Close all open buffers on entering a window if the only
" buffers left are NERDTree or Tagbar
function! s:CloseIfOnlyNerdTreeLeft()
  if exists("t:NERDTreeBufName")
    if bufwinnr(t:NERDTreeBufName) != -1
      if winnr("$") == 1
        q
      endif
    if bufwinnr("__Tagbar__") != -1
        if winnr("$") == 2
      q
      q
      endif
    endif
    endif
  endif
endfunction

" Show hidden files by default
let NERDTreeShowHidden = 1
let NERDTreeQuitOnOpen = 1

" Faster toggling
map <silent> \[ :NERDTreeToggle<cr>

" Show Bookmarks
let NERDTreeShowBookmarks = 1

" Ignore filetypes
let NERDTreeIgnore = ['\.pyc$']



""""""""""""""""""
"    SNIPMATE    "
""""""""""""""""""

" Don't allow matching of the dot character
let g:snipMateAllowMatchingDot = 0



""""""""""""""""""
"    SUPERTAB    "
""""""""""""""""""

" Play nice with omnicomplete
" let g:SuperTabContextDefaultCompletionType = "<c-x><c-o>"
let g:SuperTabDefaultCompletionType = "context"



""""""""""""""""""
"   SYNTASTIC    "
""""""""""""""""""

" Auto-Open the errors window when errors occur
let g:syntastic_auto_loc_list = 1
" let g:syntastic_python_checker = 'pyflakes'



""""""""""""""""""
"    TAGBAR    "
""""""""""""""""""

" Auto open Tagbar on startup
" autocmd VimEnter * TagbarOpen
map <silent> \] :TagbarToggle<cr>



""""""""""""""""""
"    TCOMMENT    "
""""""""""""""""""

" Faster shortcut for commenting
map <leader>cc <c-_><c-_>
map <leader>cb <c-_>b



""""""""""""""""""
"    XML_EDIT    "
""""""""""""""""""

" When editing html, auto close short tags like <br/>
let xml_use_xhtml = 1


