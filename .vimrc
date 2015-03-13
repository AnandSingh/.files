"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"
" Maintainer: Anand Singh <email@anandkrs@gmail.com>
" Last change:	2013 Dec 25
"
" To use it, copy it to
"     for Unix and OS/2:  ~/.vimrc
"	      for Amiga:  s:.vimrc
"  for MS-DOS and Win32:  $VIM\_vimrc
"	    for OpenVMS:  sys$login:.vimrc
"Refrence: 
"   amix.dk/vim/vimrc.html
"
"Sections:
"	-> General
"   -> Colors and Fonts 
"   -> Files, backups & undo 
"   -> Tab & Indent
"   -> Plugin
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => General
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Use Vim settings, rather than Vi settings (much better!).
" This must be first, because it changes other options as a side effect.
set nocompatible

set history=500		" keep 500 lines of command line history
" Enable filetype plugins
filetype plugin on
filetype indent on

" define leader key
let mapleader = ","
let g:mapleader = ","

" Fast saving
nmap <Leader>w :w!<cr>

" Set to auto read when a file is changed outside
set autoread
" Ignore compiled files
set wildignore=*.o,*~,*.pyc
set ruler		" show the cursor position all the time
" allow backspacing over everything in insert mode
set backspace=indent,eol,start
set whichwrap+=<,>,h,l
set ignorecase " ignore cae while searching
" when searching try to be smart about cases
set smartcase
" Highlight search result
set hlsearch
set incsearch		" do incremental searching
" show matching brackets when text indicator is over then 
set showmatch
" how manny tenths of a sec to blink when matching brackets
set mat=2

" Speed up the navigation by giving a list of file with line number
" use ! at the end so that it doesn't open the first result automatically
nmap <leader>a <Esc>:Ack!
" no sound in case of error
set noerrorbells
set novisualbell
set t_vb=
set tm=500

set number

" to compile an programm (got it from http://stackoverflow.com/questions/2627886/how-do-i-run-a-c-program-from-vim)
map <F8> :w <CR> :!gcc % -o %< && ./%< <CR>

map <F10> :w<CR> :!clear; make<CR> :!./%<<CR>

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Colors and Fonts 
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" enable syntex highlighting
syntax enable

" colorscheme listing
" for xoria256
colorscheme xoria256
" for solarized
" syntax enable
" set background=light
" let g:solarized_termcolors=256
" colorscheme solarized

" set standard encoding as utf8 and en_US as the standard language
set encoding=utf8

" Use unix as the standard file type
set ffs=unix,dos,mac

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Files, backups & undo 
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Turn backup off as everythng is in git 
set nobackup
set nowritebackup
set noswapfile


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Tab & Indent 
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" use spaes instead of tav
set expandtab

" be smart with tabs
set smarttab

" 1 tab == 4 spaces
set shiftwidth=4
set tabstop=4
" Configure shiftwidth, tabstop, and softtabstop for python file
autocmd Filetype python set sw=4
autocmd Filetype python set ts=4
autocmd Filetype python set sts=4

" Turn backup off as everythng is in git 

" linebreak on 500 char
set lbr
set tw=500

set ai "Auto indent
set si "Smart indent
set wrap "Wrap lines



"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Moving around 
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" map space to search and ctrl-space to backwards search
map <space> /
map <c-space> ?

" map to move around windows 
map <C-j> <C-w>j
map <C-k> <C-W>k
map <C-h> <C-W>h
map <C-l> <C-W>l

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Plugin 
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" map space to search and ctrl-space to backwards search
" runtime path manipulation for Pathogen
" https://github.com/tpope/vim-pathogen/
execute pathogen#infect()

" ctrlp help  http://kien.github.io/ctrlp.vim/
let g:ctrlp_map = '<c-p>'
" When invoked, unless a starting directory is specified, 
" CtrlP will set its local working directory according to this variable:
"   'c'  - the directory of the current file
"   'r'  - the nearest ancestor that contains one of these directories or files .git 
"          .hg .svn .bzr _darcs
"   'a'  - like c but only if the currenty working directory outside of CtrlP 
"           is not a direct ancestor of the directory of the current file
"    0 or '' disable the feature
let g:ctrlp_working_path_mode = 'ra'

" Use an coustom find file command
let g:ctrlp_user_command = 'find %s -type f'

" open NERDTree automatically when vim starts up if no files were specified
autocmd vimenter * if !argc() | NERDTree | endif
" open NERDTree automtically when vim starts up
" autocmd vimenter * NERDTree
" shortcut to open NERDTree with <ctrl+n>
map <C-n> :NERDTreeToggle<CR>
" close vim if the only window left open is NERDTree
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTreeType") && b:NERDTreeType == "primary") | q | endif

"if has('cscope')
"    set cscopetag cscopeverbose

"    if has('quickfix')
"        set cscopequickfix=s-,c-,d-,i-,t-,e-
"    endif

"    cnoreabbrev csa cs add
"    cnoreabbrev csf cs find
"    cnoreabbrev csk cs kill
"    cnoreabbrev csr cs reset
"    cnoreabbrev css cs show
"    cnoreabbrev csh cs help
" command -nargs=0 Cscope cs add $VIMSRC/src/cscope.out $VIMSRC/src
"endif
if has("cscope")
    set csprg=/usr/bin/cscope
    " change this to 1 to search ctags DBs first
    set csto=0
    set cst
    set nocsverb
    " add any database in current directory
    if filereadable("cscope.out")
        cs add cscope.out
    " else add database pointed to by environment
    elseif $CSCOPE_DB != ""
        cs add $CSCOPE_DB
    endif
    set csverb

    " Using 'CTRL-\' then a search type makes the vim window
    " "shell-out", with search results displayed on the bottom

    nmap <C-\>s :cs find s <C-R>=expand("<cword>")<CR><CR>
    nmap <C-\>g :cs find g <C-R>=expand("<cword>")<CR><CR>
    nmap <C-\>c :cs find c <C-R>=expand("<cword>")<CR><CR>
    nmap <C-\>t :cs find t <C-R>=expand("<cword>")<CR><CR>
    nmap <C-\>e :cs find e <C-R>=expand("<cword>")<CR><CR>
    nmap <C-\>f :cs find f <C-R>=expand("<cfile>")<CR><CR>
    nmap <C-\>i :cs find i ^<C-R>=expand("<cfile>")<CR>$<CR>
    nmap <C-\>d :cs find d <C-R>=expand("<cword>")<CR><CR>

    " Using 'CTRL-spacebar' then a search type makes the vim window
    " split horizontally, with search result displayed in
    " the new window.

    nmap <C-[>s :scs find s <C-R>=expand("<cword>")<CR><CR>
    nmap <C-[>g :scs find g <C-R>=expand("<cword>")<CR><CR>
    nmap <C-[>c :scs find c <C-R>=expand("<cword>")<CR><CR>
    nmap <C-[>t :scs find t <C-R>=expand("<cword>")<CR><CR>
    nmap <C-[>e :scs find e <C-R>=expand("<cword>")<CR><CR>
    nmap <C-[>f :scs find f <C-R>=expand("<cfile>")<CR><CR>
    nmap <C-[>i :scs find i ^<C-R>=expand("<cfile>")<CR>$<CR>
    nmap <C-[>d :scs find d <C-R>=expand("<cword>")<CR><CR>

    " Hitting CTRL-space *twice* before the search type does a vertical
    " split instead of a horizontal one

    nmap <C-[><C-[>s :vert scs find s <C-R>=expand("<cword>")<CR><CR>
    nmap <C-[><C-[>g :vert scs find g <C-R>=expand("<cword>")<CR><CR>
    nmap <C-[><C-[>c :vert scs find c <C-R>=expand("<cword>")<CR><CR>
    nmap <C-[><C-[>t :vert scs find t <C-R>=expand("<cword>")<CR><CR>
    nmap <C-[><C-[>e :vert scs find e <C-R>=expand("<cword>")<CR><CR>
    nmap <C-[><C-[>i :vert scs find i ^<C-R>=expand("<cfile>")<CR>$<CR>
    nmap <C-[><C-[>d :vert scs find d <C-R>=expand("<cword>")<CR><CR>
endif
set showcmd		" display incomplete commands

" Don't use Ex mode, use Q for formatting
map Q gq

" CTRL-U in insert mode deletes a lot.  Use CTRL-G u to first break undo,
" so that you can undo CTRL-U after inserting a line break.
inoremap <C-U> <C-G>u<C-U>

" In many terminal emulators the mouse works just fine, thus enable it.
"if has('mouse')
"  set mouse=a
"endif
"set mouse=a

setlocal omnifunc=javacomplete#Complete
" Only do this part when compiled with support for autocommands.
if has("autocmd")

  " Enable file type detection.
  " Use the default filetype settings, so that mail gets 'tw' set to 72,
  " 'cindent' is on in C files, etc.
  " Also load indent files, to automatically do language-dependent indenting.
  filetype plugin indent on

  " Put these in an autocmd group, so that we can delete them easily.
  augroup vimrcEx
  au!

  " For all text files set 'textwidth' to 78 characters.
  autocmd FileType text setlocal textwidth=78

  autocmd FileType java setlocal omnifunc=javacomplete#Complete
  " When editing a file, always jump to the last known cursor position.
  " Don't do it when the position is invalid or when inside an event handler
  " (happens when dropping a file on gvim).
  " Also don't do it when the mark is in the first line, that is the default
  " position when opening a file.
  autocmd BufReadPost *
    \ if line("'\"") > 1 && line("'\"") <= line("$") |
    \   exe "normal! g`\"" |
    \ endif

  augroup END

endif " has("autocmd")


" Convenient command to see the difference between the current buffer and the
" file it was loaded from, thus the changes you made.
" Only define it when not defined already.
if !exists(":DiffOrig")
  command DiffOrig vert new | set bt=nofile | r # | 0d_ | diffthis
		  \ | wincmd p | diffthis
endif 

set tags+=tags


" Will allow you to use :w!! to write to a file using sudo if you forgot to sudo
" " vim file (it will prompt for sudo password when writing)
" " http://stackoverflow.com/questions/95072/what-are-your-favorite-vim-tricks/96492#96492
cmap w!! %!sudo tee > /dev/null %


nnoremap <up> <nop>
nnoremap <down> <nop>
nnoremap <left> <nop>
nnoremap <right> <nop>
inoremap <up> <nop>
inoremap <down> <nop>
inoremap <left> <nop>
inoremap <right> <nop>

"nnoremap <C-n> :bnext<CR>
"nnoremap <C-p> :bprevious<CR>
"
" pyflakes setting
" pyflake will notify about unsed imports and ivalid syntex
" lets tell pyflake to not use the quick fis window
let g:pyflakes_use_quickfix = 0

" pep8 : This will ensure that code is consistent across all project.
" Add a key mapping that will help to jump each of pep8 violations
let g:pep8_map='<leader>8'

" Enable context sensitive to enable omi code completion
" Use super tab plugin to check the context of code and
" choose thebest situation for that
au FileType python set omnifunc=pythoncomplete#Complete
let g:SuperTabDefaultCompletionType= "context"

" Enable menu and pydoc preview to get most useful information out
" of the code completion
set completeopt=menuone,longest,preview
