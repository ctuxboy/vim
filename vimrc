""""""""""""""""" VIMRC VERSION 1.2.0 """""""""""""""""
" more info https://dougblack.io/words/a-good-vimrc.html
" sheatcheet http://yannesposito.com/Scratch/en/blog/Learn-Vim-Progressively/

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => General
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" NOTES:
" =====
" CTRL + n                  = auto complition
" :term(inal)               = open terminal (close terminal, type in the terminal 'exit")
" CTRL-W CTRL-W             = move focus to the next window (ex. switch between terminal and vim windows
" :e <space> <TAB>          = File explorer, show files and dirs in current directory
" :Explore/:Sex/:Vex/:Tex   = File explorer (S/V/T are short for Split/Vertical/Tab)
" :q                        = close current window
" :ls                       = list buffers
" :bX                       = show buffer X
" :bd or :bdX               = close current buffer or buffer delete X, works also for closing the Explorer
" :find *.py <tab>          = search all py-files also in subfolders
" :b <space> <tab>          = shows all buffers
" :!python3 %               = run python3 current script/current buffer (you can replace % with a filename
" when open the :Ex(plorer), select a file and type 'v' for open file to the right
" :30Vex                    = open Explorer in vertical split with 30 characters (also use ':30vsplit')
" :gg=G                     = re-indent file (Python)
" :ggVG                     = Select All (CTRL+A)

" Linenumbers
set number

" Sets how many lines of history VIM has to remember
set history=500

" Use system clipboard
set clipboard=unnamedplus

" Explorer settings
let g:netrw_browse_split=4  " open in prior window
let g:netrw_altv=1          " open splits to the right
let g:netrw_liststyle=3     " Explorer Tree view
let g:netrw_keepdir = 0
let g:netrw_winsize = 30    " Size explorer = 30

set fileencoding=utf-8

set nocompatible
set tabstop=4           " number of visual spaces per TAB
set softtabstop=4       " number of spaces in tab when editing
set expandtab           " tabs are spaces
set cursorline          " highlight current line
syntax enable           " enable syntax processing
set wrap                " wrap lines 

" Enable filetype
filetype on

" load filetype-specific indent files
filetype indent on

autocmd FileType html setlocal shiftwidth=2 tabstop=2 softtabstop=2
autocmd FileType python setlocal shiftwidth=4 tabstop=4 softtabstop=4

" hide mouse after typeing
set mousehide 
set nohlsearch

set showmatch               " hightlight matching [{()}]
set incsearch           " search as characters are entered
set hlsearch            " highlight matches

" Ignore case when searching
set ignorecase          " Ignore case when searching
set foldenable          " enable folding
set foldnestmax=10      " 10 nested fold max
nnoremap <space> za         " space open/closes folds
set foldmethod=indent   " fold based on indent level
nnoremap gV `[v`]           " highlight last inserted text

set path+=**            " Search also in subfolders
set wildmenu            " Tab completion
set wildmode=full
set lazyredraw          " redraw only when we need to.

" For regular expressions turn magic on
set magic

" enable all Python syntax highlighting features
let python_highlight_all = 1

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Moving around, tabs, windows and buffers
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" Disable highlight when <leader><cr> is pressed
map <silent> <leader><cr> :noh<cr>

" Smart way to move between windows
map <C-j> <C-W>j
map <C-k> <C-W>k
map <C-h> <C-W>h
map <C-l> <C-W>l

" Switch CWD to the directory of the open buffer
map <leader>cd :cd %:p:h<cr>:pwd<cr>

" Select ALL
map <C-a> <esc>ggVG<CR>

" Return to last edit position when opening files (You want this!)
au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif

" Set to auto read when a file is changed from the outside
set autoread
au FocusGained,BufEnter * checktime

" STATUSLINE/STATUSBAR
" Always show the status line
set laststatus=2

" Format the status line
set statusline=\ %F%m%r%h\ %w\ \ FileType:\ %y\ \ CWD:\ %r%{getcwd()}%h\ %=Line:\ %l\/%L\ \ Column:\ %c\ 

set wildchar=<Tab>

" show command in bottom bar
set showcmd

" Press [F9] = save current buffer and execute Python3 script
autocmd FileType python map <buffer> <F9> :w<CR>:exec '!python3' shellescape(@%, 1)<CR>
autocmd FileType python imap <buffer> <F9> <esc>:w<CR>:exec '!python3' shellescape(@%, 1)<CR>

" ABBREVIATIONS
iabbrev @@ c.hollebeke@gmail.com

" HTML abbreviations
autocmd FileType html :iabbrev html5> <!doctype html><CR><html lang="nl"><CR><head><CR><TAB><meta charset="utf-8"><CR><meta name="viewport" content="width=device-width, initial-scale=1"><CR><title>A Basic HTML5 Template</title><CR><meta name="description" content="A simple HTML5 Template for new projects."><CR><meta name="author" content="Christophe Hollebeke"><CR><meta property="og:title" content="A Basic HTML5 Template"><CR><meta property="og:type" content="website"><CR><meta property="og:url" content="https://www.website.com/"><CR><meta property="og:description" content="A simple HTML5 Template for new projects."><CR><meta property="og:image" content="image.png"><CR><link rel="icon" href="/favicon.ico"><CR><link rel="icon" href="/favicon.svg" type="image/svg+xml"><CR><link rel="apple-touch-icon" href="/apple-touch-icon.png"><CR><link rel="stylesheet" href="css/styles.css?v=1.0"><CR><BACKSPACE></head><CR><body><CR><TAB><!-- your content here... --><CR><BACKSPACE><script src="js/scripts.js"></script><CR></body><CR></html>

"Python abbreviations 
autocmd Filetype python :iabbrev print print( )<left><left><left>
autocmd FileType python :iabbrev ifmain if __name__ == '__main__':

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Colors and Fonts
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Enable syntax highlighting
syntax enable 

" Enable 256 colors palette in Gnome Terminal
if $COLORTERM == 'gnome-terminal'
    set t_Co=256
endif

try
    colorscheme desert
catch
endtry

set background=dark

" Set extra options when running in GUI mode
if has("gui_running")
    set guioptions-=T
    set guioptions-=e
    set t_Co=256
    set guitablabel=%M\ %t
endif

" Set utf8 as standard encoding and en_US as the standard language
set encoding=utf8

" Use Unix as the standard file type
set ffs=unix,dos,mac

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Files, backups and undo
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" Turn backup off, since most stuff is in SVN, git etc. anyway...
" set nobackup
" set nowb
set noswapfile
