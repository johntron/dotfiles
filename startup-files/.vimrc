set clipboard=unnamed

" line numbers
set nu

set nocp

" default tab spaces
set ts=4

" number of spaces when shifting text
set sw=4

" show ruler
set ru

set nocompatible

" allow backspacing over everything in insert mode
set backspace=indent,eol,start

" keep 50 lines of command line history
set history=50

" display incomplete commands
set showcmd

" do incremental searching
set incsearch

" key for custom keystrokes
let mapleader = ","

" Don't use Ex mode, use Q for formatting
map Q gq

" In many terminal emulators the mouse works just fine, thus enable it.
if has('mouse')
  set mouse=a
endif

" Navigate tabs
map <Leader>, :tabprevious<CR>
map <Leader>. :tabnext<CR>

" syntax highlighting, when the terminal has colors
if &t_Co > 2 || has("gui_running")
  syntax on
  
  " also switch on highlighting the last used search pattern.
  set hlsearch
endif

" Press jj to exit insert mode
inoremap jj <ESC>

"" Emmet
"imap <Leader>m <C-Y>,
"
"" gitgutter
"let g:gitgutter_realtime = 1
"set updatetime=250
"
"" TagBar
"autocmd VimEnter * nested :TagbarOpen
"autocmd VimEnter * nested :call tagbar#autoopen(1)
"map <Leader>t :TagbarToggle<CR>
"
"" Texplore
"map <Leader>e :Texplore<CR>
"
"" CTRL-U in insert mode deletes a lot.  Use CTRL-G u to first break undo,
"" so that you can undo CTRL-U after inserting a line break.
"inoremap <C-U> <C-G>u<C-U>
"
"
"" Only do this part when compiled with support for autocommands.
"if has("autocmd")
"
"  " Enable file type detection.
"  " Use the default filetype settings, so that mail gets 'tw' set to 72,
"  " 'cindent' is on in C files, etc.
"  " Also load indent files, to automatically do language-dependent indenting.
"  filetype plugin indent on
"
"  " Put these in an autocmd group, so that we can delete them easily.
"  augroup vimrcEx
"  au!
"
"  " For all text files set 'textwidth' to 78 characters.
"  autocmd FileType text setlocal textwidth=78
"
"  " When editing a file, always jump to the last known cursor position.
"  " Don't do it when the position is invalid or when inside an event handler
"  " (happens when dropping a file on gvim).
"  " Also don't do it when the mark is in the first line, that is the default
"  " position when opening a file.
"  autocmd BufReadPost *
"    \ if line("'\"") > 1 && line("'\"") <= line("$") |
"    \   exe "normal! g`\"" |
"    \ endif
"
"  augroup END
"
"else
"
"  set autoindent    " always set autoindenting on
"
"endif " has("autocmd")
"
"" Convenient command to see the difference between the current buffer and the
"" file it was loaded from, thus the changes you made.
"" Only define it when not defined already.
"if !exists(":DiffOrig")
"  command DiffOrig vert new | set bt=nofile | r ++edit # | 0d_ | diffthis
"      \ | wincmd p | diffthis
"endif
"
"" CtrlP fuzzy search
"noremap <C-@> :CtrlP<CR>
"let g:ctrlp_prompt_mappings = {
"    \ 'AcceptSelection("e")': ['<2-LeftMouse>'],
"    \ 'AcceptSelection("t")': ['<cr>'],
"    \ }


