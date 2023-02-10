" Use Vim settings, rather than Vi settings (much better!).
" o
" This must be first, because it changes other options as a side effect.
set nocompatible

"pathogen to install vim scrips:
execute pathogen#infect()

" Leader key on space bar
let mapleader=" "

" place backup files in folders dedicated to temporary files
set backupdir=~/.vim/tmp,~/.tmp,~/tmp,/var/tmp,/tmp
set directory=~/.vim/tmp,~/.tmp,~/tmp,/var/tmp,/tmp

" syntax highlight
syntax enable

" http://stackoverflow.com/questions/7278267/incorrect-colors-with-vim-in-iterm2-using-solarized
if !has("gui_running")
  "let g:solarized_termtrans=1
  let g:solarized_termcolors=16 "256
endif

" colorscheme
" solarized options 
let g:solarized_visibility = "high"
let g:solarized_contrast = "high"

set background=dark
let w:solarized_style="dark"
let g:solarized_termcolors=256
colorscheme solarized8_high

function! ToggleBackground()
  if (w:solarized_style=="dark")
    let w:solarized_style="light"
    set background=light
    colorscheme solarized8_high
  else
    let w:solarized_style="dark"
    set background=dark
    colorscheme solarized8_high
  endif
endfunction
command! Togbg call ToggleBackground()
nnoremap <leader>, :call ToggleBackground()<CR>
inoremap <F5> <ESC>:call ToggleBackground()<CR>a
vnoremap <F5> <ESC>:call ToggleBackground()<CR>

" I don't like Vim to ever write a backup file. I prefer more modern ways of
" protecting against data loss.
set nobackup
set noswapfile

" tabstop settings
set tabstop=2
set softtabstop=2
set shiftwidth=2
set expandtab
set shiftround

set autoindent
set backspace=indent,eol,start
set complete-=i
set smarttab

set nrformats-=octal

" Search is only case-sensitive for upper-case characters
set ignorecase
set smartcase
set hlsearch
set incsearch
" Use <C-L> to clear the highlighting of :set hlsearch.
if maparg('<C-L>', 'n') ==# ''
  nnoremap <silent> <C-L> :nohlsearch<CR><C-L>
endif

set mouse=nc " allow mouse in normal and command-line mode only (see help mouse)

" For vim-powerline theme
set laststatus=2
let g:airline_powerline_fonts = 1

" automatically reload files
set autoread

" Remember more commands and search history
set history=1000

" Make tab completion for files/buffers act like bash
set wildmenu
set wildignore=*.pyc,*.class

" Turn on line numbers
set number

" Open split panes below or to the right (see
" https://github.com/thoughtbot/dotfiles/)
set splitbelow
set splitright

" remap escape (eliminates reaching for escape key)
inoremap jk <ESC>

" show commands
set showcmd

" allow to save files with root permissions
cmap w!! w !sudo tee % >/dev/null 


" AkS: Most of the above are copied from here
" https://github.com/janernsting/dotfiles/blob/master/vim/vimrc

" AkS: close html tags http://vim.wikia.com/wiki/Auto_closing_an_HTML_tag
:iabbrev <// </<C-X><C-O>
:iabbrev <-/ <BS></<C-X><C-O>




" allow backspacing over everything in insert mode
set backspace=indent,eol,start

if has("vms")
  set nobackup		" do not keep a backup file, use versions instead
else
  set backup		" keep a backup file
endif

set history=50		" keep 50 lines of command line history
set ruler		" show the cursor position all the time

" Don't use Ex mode, use Q for formatting
map Q gq

" CTRL-U in insert mode deletes a lot.  Use CTRL-G u to first break undo,
" so that you can undo CTRL-U after inserting a line break.
inoremap <C-U> <C-G>u<C-U>

" In many terminal emulators the mouse works just fine, thus enable it.
if has('mouse')
  " set mouse=a
endif

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

else

  set autoindent		" always set autoindenting on

endif " has("autocmd")

" Convenient command to see the difference between the current buffer and the
" file it was loaded from, thus the changes you made.
" Only define it when not defined already.
if !exists(":DiffOrig")
  command DiffOrig vert new | set bt=nofile | r ++edit # | 0d_ | diffthis
		  \ | wincmd p | diffthis
endif


" for coffee-script-vim
autocmd QuickFixCmdPost * nested cwindow | redraw!
autocmd BufWritePost *.coffee silent make!
" end for coffee-sript-vim



" for vim-jsx
let g:syntastic_javascript_checkers = ['eslint']
" end vim-jsx

source $VIMRUNTIME/macros/matchit.vim
