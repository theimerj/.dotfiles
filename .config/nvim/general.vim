" ________    ___      ___  ___   _____ ______    ________   ________
" |\   ___  \ |\  \    /  /||\  \ |\   _ \  _   \ |\   __  \ |\   ____\
" \ \  \\ \  \\ \  \  /  / /\ \  \\ \  \\\__\ \  \\ \  \|\  \\ \  \___|
"  \ \  \\ \  \\ \  \/  / /  \ \  \\ \  \\|__| \  \\ \   _  _\\ \  \
"   \ \  \\ \  \\ \    / /    \ \  \\ \  \    \ \  \\ \  \\  \|\ \  \____
"    \ \__\\ \__\\ \__/ /      \ \__\\ \__\    \ \__\\ \__\\ _\ \ \_______\
"     \|__| \|__| \|__|/        \|__| \|__|     \|__| \|__|\|__| \|_______|


"----------------------------------------------------------------------
"               Basic Preference Things
"----------------------------------------------------------------------

let mapleader = ','                                         " Map leader to ','
set exrc                                                    " Load local .vimrc files
set secure                                                  " Do not allow autocommands etc.

filetype plugin indent on " Turn on plugins, auto indentation, and syntax highlighting

set autoindent                                              " Makes it indented in insert mode on new lines
set cursorline                                              " Show a line under the cursor
set title                                                   " Title of the window is set to 'titlestring' or filename
set backspace=2                                             " Make backspace work like most other programs
set formatoptions-=t                                        " Do not automatically wrap text when typing
set hidden                                                  " Hide buffers istead of unloading them
set history=200                                             " Only save 200 undos
set ignorecase                                              " Ignorecase when searching stuff
set incsearch                                               " do incremental searching
set laststatus=2                                            " Always display the status line
set list listchars=tab:»·,trail:·                           " Display extra whitespace
set mousefocus                                              " gvim mouse click will select pane
set nobackup                                                " Stop vim from leaving temp files everywhere
set nocompatible                                            " Use Vim settings, rather then Vi settings
set nowrap                                                  " Do not automatically wrap on load
set nowritebackup                                           " Don't write your undo history to a file
set ruler                                                   " show the cursor position all the time
set shell=/bin/zsh                                          " Ensure that vim always runs from a shell https://rvm.io/integration/vim
set showcmd                                                 " display incomplete commands
set t_vb=                                                   " 🔕
set vb                                                      " Turn on vim internal visual bell
set wildmenu                                                " Turn on the WiLd menu

set tabstop=4                                               " The width of a TAB is set to 4.
                                                            " Still it is a \t. It is just that
                                                            " Vim will interpret it to be having
                                                            " a width of 4.

set shiftwidth=4                                            " Indents will have a width of 4
set softtabstop=4                                           " Sets the number of columns for a TAB
set shiftround                                              " Round indent to multiple of shiftwidth
set expandtab                                               " Expand TABs to spaces

" Ignore compiled files
set wildignore+=*.o,*~,*.pyc
set wildignore+="bin/*"
set wildignore+="build/*"

set relativenumber                                          " Set relative numbers
set numberwidth=4                                           " Set number widthn

"------------------------Search--------------------------"

set hlsearch                                                " Turn on search highlighting
set incsearch                                               " Turn on incremental search




"------------------------Splits--------------------------"

" Splits
set splitbelow                                              " Always open splits below current window
set splitright                                              " Always open splits to the right




"------------------------Other configuration--------------------------"

" Use Ack instead of Grep when available (You should really check out Ack it is awesome http://beyondgrep.com/)
if executable("ack")
  set grepprg=ack\ -H\ --nogroup\ --nocolor
endif

