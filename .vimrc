set backspace=indent,eol,start

set history=50		" keep 50 lines of command line history
set ruler		" show the cursor position all the time
set showcmd		" display incomplete commands
set incsearch		" do incremental searching
set nu			" enable line number
set tabstop=4		" set length of tab
set softtabstop=4		" set length of tab
set shiftwidth=4
set smarttab
set expandtab 		" use space instead of tab
set autoindent		" always set autoindenting on
set wildmenu

filetype plugin on
filetype indent on
syntax on
syntax enable

" This is for spell check color 
hi clear SpellBad
hi SpellBad term=underline cterm=underline ctermfg=red

" Color scheme
set t_Co=256
let python_highlight_all = 1
colorscheme wombat256

" In many terminal emulators the mouse works just fine, thus enable it.
if has('mouse')
    set mouse=a
endif

" map key shortcuts
imap jj <ESC>						
" map 'jj' switch to normal mode
nnoremap <silent> <F5> :TlistToggle<cr>
nnoremap <silent> <F6> :wincmd p<cr>
nnoremap <silent> <F7> :set spell!<CR><Bar>:echo "Spell check: " . strpart("OffOn", 3 * &spell, 3)<CR>
nnoremap <silent> <F12> :NERDTreeToggle<CR>
autocmd filetype python map <F9> :w<CR>:!python %<CR>
" Hotkey to execute python file
autocmd filetype python map <F10> :w<CR>:!pep8 %<CR>	
" Hotkey to debug python (using pep8)
autocmd filetype tex map <F8> :set cursorline!<CR><Bar>:echo "Highlight active cursor line: " . strpart("OffOn", 3 * &cursorline, 3)<CR>
" This is line cursor highlight
autocmd filetype tex map <silent> <F9> \ll:!echo % \| awk -F "." '{print $1".pdf"}' \| xargs evince <CR>	
" Hotkey to view compiled pdf
autocmd filetype c map <F7> :s/^/\/\//g<CR>
autocmd filetype c map <F8> :s/^\/\///g<CR>
autocmd filetype c map <F9> :w<CR>:!gcc -lm % && ./a.out<CR>
autocmd filetype cpp map <F9> :w<CR>:!g++ % && ./a.out<CR>
autocmd filetype html map <F7> :s/^\(.*\)$/<!--\1-->/g<CR> 
autocmd filetype html map <F8> :s/^<!--\(.*\)-->$/\1/g<CR>
autocmd filetype sh map <F7> :s/^/# /g<CR>
autocmd filetype sh map <F8> :s/^# //g<CR>

" [WEB] Zencoding filetype enable
autocmd filetype html,css,php EmmetInstall
let g:user_emmet_install_global = 0

" [WEB] let php using html indent
autocmd filetype php :set filetype=html

" completion
let g:SuperTabDefaultCompletionType = "context"
let g:pydiction_location = '~/.vim/bundle/pydiction/complete-dict'
" autocmd Filetype python set complete+=pythoncomplete#Complete
autocmd FileType c setl omnifunc=ccomplete#Complete
autocmd FileType html set omnifunc=htmlcomplete#CompleteTags
autocmd FileType java set omnifunc=javacomplete#Complete
autocmd FileType java set completefunc=javacomplete#CompleteParamsInfo 

set laststatus=2		" vim status bar
let g:airline_powerline_fonts = 1

" for compiling latex
set shellslash
set grepprg=grep\ -nH\ $*
let g:tex_flavor='latex'
let g:Tex_FormatDependency_pdf = 'dvi,ps,pdf'
let g:Tex_CompileRule_dvi = 'pdflatex --interaction=nonstopmode $*'
let g:Tex_CompileRule_ps = 'dvips -Ppdf -o $*.ps $*.dvi'
let g:Tex_CompileRule_pdf = 'ps2pdf $*.ps'
let g:Tex_ViewRule_pdf = 'evince'

" return last edit location
if has("autocmd")
    autocmd BufRead *.txt set tw=78
    autocmd BufReadPost *
                \ if line("'\"") > 0 && line ("'\"") <= line("$") |
                \   exe "normal g'\"" |
                \ endif
endif

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
Bundle 'bling/vim-airline'
Bundle 'rkulla/pydiction'
Bundle 'ervandew/supertab'
Bundle 'gerw/vim-latex-suite'
Bundle 'scrooloose/nerdtree'
Bundle 'javacomplete'
Bundle 'AutoComplPop'
Bundle 'ctags.vim'
Bundle 'taglist.vim'
Bundle 'verilog_systemverilog.vim'

" snipmate
Bundle 'MarcWeber/vim-addon-mw-utils'
Bundle 'tomtom/tlib_vim'
Bundle 'garbas/vim-snipmate'
Bundle 'honza/vim-snippets'

" [WEB] HTML indent
Bundle 'othree/html5.vim'
" [WEB] PHP indent
Bundle '2072/PHP-Indenting-for-VIm'
" [WEB] Zencoding
Bundle 'mattn/emmet-vim'


