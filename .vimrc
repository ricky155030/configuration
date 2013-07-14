set backspace=indent,eol,start

set history=50		" keep 50 lines of command line history
set ruler		" show the cursor position all the time
set showcmd		" display incomplete commands
set incsearch		" do incremental searching
set nu			" enable line number
set tabstop=4		" set length of tab
set shiftwidth=4
set smarttab
set autoindent		" always set autoindenting on
set wildmenu

filetype plugin on
syntax on
syntax enable

" This is for spell check color 
hi clear SpellBad
hi SpellBad term=underline cterm=underline ctermfg=red

" This is for spell check in tex file
autocmd filetype tex map <F5> :set spell!<CR><Bar>:echo "Spell check: " . strpart("OffOn", 3 * &spell, 3)<CR>

" This is line cursor highlight
autocmd filetype tex map <F6> :set cursorline!<CR><Bar>:echo "Highlight active cursor line: " . strpart("OffOn", 3 * &cursorline, 3)<CR>

" Color scheme
set t_Co=256
let python_highlight_all = 1
colorscheme wombat256

" In many terminal emulators the mouse works just fine, thus enable it.
if has('mouse')
  set mouse=a
endif

" map key shortcuts
imap jj <ESC>						" map 'jj' switch to normal mode
map <silent> <F6> :s/^/#/g<CR>					" Comment hotkey
map <silent> <F7> :s/#//g<CR> 					" Comment hotkey
nnoremap <silent> <F12> :NERDTree<CR>
autocmd filetype python map <F9> :w<CR>:!python %<CR>	" Hotkey to execute python file
autocmd filetype python map <F10> :w<CR>:!pep8 %<CR>	" Hotkey to debug python (using pep8)

" completion
let g:SuperTabDefaultCompletionType = "context"
let g:pydiction_location = '~/.vim/bundle/pydiction/complete-dict'
" autocmd Filetype python set complete+=pythoncomplete#Complete
autocmd FileType html set omnifunc=htmlcomplete#CompleteTags
autocmd FileType java set omnifunc=javacomplete#Complete
autocmd FileType java set completefunc=javacomplete#CompleteParamsInfo 

set laststatus=2		" vim status bar
" let g:Powerline_symbols = 'fancy'

" vundle check
let iCanHazVundle=1
let vundle_readme=expand('~/.vim/bundle/vundle/README.md')
if !filereadable(vundle_readme)
  echo "Installing Vundle.."
  echo ""
  silent !mkdir -p ~/.vim/bundle
  silent !git clone https://github.com/gmarik/vundle ~/.vim/bundle/vundle
  let iCanHazVundle=0
endif

set rtp+=~/.vim/bundle/vundle/
call vundle#rc()

" let Vundle manage Vundle
" required! 
Bundle 'gmarik/vundle'

" git repo
Bundle 'Lokaltog/vim-powerline'
Bundle 'rkulla/pydiction'
Bundle 'ervandew/supertab'
Bundle 'Valloric/YouCompleteMe'
" vim-scripts repo
Bundle 'javacomplete'

