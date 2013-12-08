" ==========================================================
" Vundle
" ==========================================================
set nocompatible
filetype off

set rtp+=~/.vim/bundle/vundle/
call vundle#rc()

" let Vundle manage Vundle
" required! 
Bundle 'gmarik/vundle'

" My Bundles here:
"
" original repos on github
Bundle 'tpope/vim-fugitive'
Bundle 'Lokaltog/vim-easymotion'
Bundle 'Lokaltog/vim-powerline'
Bundle 'rstacruz/sparkup', {'rtp': 'vim/'}
Bundle 'majutsushi/tagbar'
Bundle 'scrooloose/nerdtree'
"Bundle 'topfunky/PeepOpen-EditorSupport', {'rtp': 'vim-peepopen/'}
"Bundle 'sontek/rope-vim'
Bundle 'tpope/vim-fugitive'
Bundle 'msanders/snipmate.vim'
Bundle 'ervandew/supertab'
"Bundle 'nvie/vim-flake8'
Bundle 'tomasr/molokai'
Bundle 'terryma/vim-multiple-cursors'
Bundle 'klen/python-mode'

" vim-scripts repos
"Bundle 'L9'
"Bundle 'FuzzyFinder'

filetype plugin indent on

" ==========================================================
" Shortcuts
" ==========================================================
" Seriously, guys. It's not like :W is bound to anything anyway.
command! W :w

" Allow pasting blocks of code without indenting
set pastetoggle=<F2>

"Fix Shift+Tab
nmap <S-Tab> <<
imap <S-Tab> <Esc><<i

nmap <Leader>t :TagbarToggle<CR>
nmap <Leader>n :NERDTreeToggle<CR>

" Let me save files with sudo
cmap w!! w !sudo tee % >/dev/null

let NERDTreeIgnore = ['\.pyc$']

set tw=0
set wm=0
set nowrap
set linebreak

" ==========================================================
" Basic Settings
" ==========================================================
syntax on                     " syntax highlighing
filetype on                   " try to detect filetypes
filetype plugin indent on     " enable loading indent file for filetype
set number                    " Display line numbers
set numberwidth=1             " using only 1 column (and 1 space) while possible
set title                     " show title in console title bar
set wildmenu                  " Menu completion in command mode on <Tab>
set wildmode=full             " <Tab> cycles between all matching choices.
set showcmd

set colorcolumn=80

" don't bell or blink
"set noerrorbells
"set vb t_vb=


" don't outdent hashes
inoremap # #

set tabstop=4
set shiftwidth=4
set expandtab
set smarttab
set autoindent
set smartindent
set mouse=a


set ls=2  "Always show status line"


set ruler

set hidden

set nolazyredraw
set showmatch
set encoding=utf8

set backspace=indent,eol,start

set nobackup
set noswapfile

language en_US.UTF-8

set undodir=~/.vim_runtime/undodir
set undofile

" displays tabs with :set list & displays when a line runs off-screen
set listchars=tab:>.,trail:.,precedes:<,extends:>
set list

""" Searching and Patterns
set ignorecase              " Default to using case insensitive searches,
set smartcase               " unless uppercase letters are used in the regex.
set smarttab                " Handle tabs more intelligently
set hlsearch                " Highlight searches by default.
set incsearch               " Incrementally search while typing a /regex

"""" Display
if has("gui_running")
    colorscheme desert
    Remove menu bar
    set guioptions-=m
    "set guifont=Menlo:h14
    "set guifont=Monaco:h14

    " Remove toolbar
    set guioptions-=T
else
   let g:molokai_original = 1
   let g:rehash256 = 1
   colorscheme molokai

endif


" ===========================================================
" FileType specific changes
" ============================================================
" Javascript
au BufRead *.js set makeprg=jslint\ %
" Use tab to scroll through autocomplete menus
"autocmd VimEnter * imap <expr> <Tab> pumvisible() ? "<C-N>" : "<Tab>"
"autocmd VimEnter * imap <expr> <S-Tab> pumvisible() ? "<C-P>" : "<S-Tab>"
autocmd filetype javascript set sw=2 ts=2 expandtab
let g:acp_completeoptPreview=1

" Mako/HTML
autocmd BufNewFile,BufRead *.mako,*.mak,*.jinja2 setlocal ft=html
autocmd FileType html,xhtml,xml,css setlocal expandtab shiftwidth=2 tabstop=2

" Python
"au BufRead *.py compiler nose
au FileType python set omnifunc=pythoncomplete#Complete
au FileType python setlocal expandtab shiftwidth=4 tabstop=4 smartindent cinwords=if,elif,else,for,while,try,except,finally,def,class,with
au BufRead *.py set efm=%C\ %.%#,%A\ \ File\ \"%f\"\\,\ line\ %l%.%#,%Z%[%^\ ]%\\@=%m
au FileType python set foldmethod=indent foldlevel=99

" python-module related settings

let g:pymode_rope = 1
"map <leader>j :RopeGotoDefinition<CR>
"map <leader>r :RopeRename<CR>
let g:pymode_rope_goto_definition_bind = '<leader>j'
"let g:pymode_rope_autocomplete_map = '<tab>'

let g:pymode_lint = 1
let g:pymode_lint_checkers = ['pyflakes', 'pylint', 'pep8']
let g:pymode_lint_ignore = "C0110,C0111"

let g:pymode_virtualenv = 1
let g:pymode_utils_whitespaces = 1
let g:pymode_indent = 1

let g:pymode_syntax = 1

" Ignore these files when completing
set wildignore+=*.o,*.obj,.git,*.pyc
set wildignore+=eggs/**
set wildignore+=*.egg-info/**

"" Add the virtualenv's site-packages to vim path
"if has('python')
"py << EOF
"import os.path
"import sys
"import vim
"if 'VIRTUAL_ENV' in os.environ:
"    project_base_dir = os.environ['VIRTUAL_ENV']
"    sys.path.insert(0, project_base_dir)
"    activate_this = os.path.join(project_base_dir, 'bin/activate_this.py')
"    execfile(activate_this, dict(__file__=activate_this))
"EOF
"endif
"
"" Load up virtualenv's vimrc if it exists
"if filereadable($VIRTUAL_ENV . '/.vimrc')
"    source $VIRTUAL_ENV/.vimrc
"endif
