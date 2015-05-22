syntax on
set backspace=indent,eol,start
set ignorecase
set history=50		" keep 50 lines of command line history
set ruler		    " show the cursor position all the time
set showcmd		    " display incomplete commands
set incsearch		" do incremental searching
set nu			    " enable line number
set hlsearch
set tabstop=4		" set length of tab
set softtabstop=4	" set length of tab
set shiftwidth=4
set smarttab
set expandtab 		" use space instead of tab
set autoindent		" always set autoindenting on
set wildmenu
set winaltkeys=no
set laststatus=2	" vim status bar

filetype plugin on
filetype indent on

" Color scheme
set t_Co=256
colorscheme wombat256

" set comment color
hi Comment ctermfg=red

let python_highlight_all = 1

" general key mapping 
imap jj <ESC>						
nnoremap <S-Q> gT
nnoremap <S-W> gt 

" key mapping for adding comment to code
autocmd filetype c map <F7> :s/^/\/\//g<CR>
autocmd filetype c map <F8> :s/^\/\///g<CR>
autocmd filetype cpp map <F7> :s/^/\/\//g<CR>
autocmd filetype cpp map <F8> :s/^\/\///g<CR>
autocmd filetype html map <F7> :s/^\(.*\)$/<!--\1-->/g<CR> 
autocmd filetype html map <F8> :s/^<!--\(.*\)-->$/\1/g<CR>
autocmd filetype sh map <F7> :s/^/# /g<CR>
autocmd filetype sh map <F8> :s/^# //g<CR>
autocmd filetype perl map <F7> :s/^/# /g<CR>
autocmd filetype perl map <F8> :s/^# //g<CR>
autocmd filetype python map <F7> :s/^/# /g<CR>
autocmd filetype python map <F8> :s/^# //g<CR>

" key mapping for executing code
autocmd filetype c map <F9> :w<CR>:!gcc -lm % && ./a.out<CR>
autocmd filetype cpp map <F9> :w<CR>:make clean<CR>:make<CR>:!./a.out<CR>
autocmd filetype sh map <F9> :w<CR>:!bash %<CR>
autocmd filetype perl map <F9> :w<CR>:!perl %<CR>
autocmd filetype python map <F9> :w<CR>:!`which python3.4` %<CR>

"folding
set foldenable 
autocmd filetype python set foldmethod=indent
set foldcolumn=0 
set foldnestmax=2 
nnoremap <space> za

" other key mapping 
"" using pep8 to debug python
" autocmd filetype python map <F10> :w<CR>:!pep8 %<CR>

" [WEB] let php using html indent
" autocmd filetype php :set filetype=html

" completion
" let g:SuperTabDefaultCompletionType = "context"
let g:pydiction_location = '~/.vim/bundle/pydiction/complete-dict'
" autocmd Filetype python set complete+=pythoncomplete#Complete
" autocmd FileType c setl omnifunc=ccomplete#Complete
" autocmd FileType html set omnifunc=htmlcomplete#CompleteTags
" autocmd FileType java set omnifunc=javacomplete#Complete
" autocmd FileType java set completefunc=javacomplete#CompleteParamsInfo 

" let g:airline_powerline_fonts = 1
" let g:airline#extensions#tabline#enabled = 1

" return last edit location
if has("autocmd")
    autocmd BufRead *.txt set tw=78
    autocmd BufReadPost *
        \ if line("'\"") > 0 && line ("'\"") <= line("$") |
        \   exe "normal g'\"" |
        \ endif
endif

" vundle check
" let iCanHazVundle=1
" let vundle_readme=expand('~/.vim/bundle/vundle/README.md')
" if !filereadable(vundle_readme)
"     echo "Installing Vundle.."
"     echo ""
"     silent !mkdir -p ~/.vim/bundle
"     silent !git clone https://github.com/gmarik/vundle ~/.vim/bundle/vundle
"     let iCanHazVundle=0
" endif

set rtp+=~/.vim/bundle/vundle/
call vundle#rc()

" let Vundle manage Vundle
" required! 
Bundle 'gmarik/vundle'

" git repo
" Bundle 'bling/vim-airline'
Bundle 'rkulla/pydiction'
Bundle 'ervandew/supertab'
" Bundle 'gerw/vim-latex-suite'
" Bundle 'scrooloose/nerdtree'
" Bundle 'javacomplete'
" Bundle 'AutoComplPop'
" Bundle 'ctags.vim'
" Bundle 'taglist.vim'
" Bundle 'vimspell'
" Bundle 'klen/python-mode'

" snipmate
" Bundle 'MarcWeber/vim-addon-mw-utils'
" Bundle 'tomtom/tlib_vim'
" Bundle 'garbas/vim-snipmate'
" Bundle 'honza/vim-snippets'


""" THE FOLLOWING IS DEPRECATED """

"" vim setting for latex
" let spell_auto_type = "tex"
" autocmd filetype tex map <F8> :set cursorline!<CR><Bar>:echo "Highlight active cursor line: " . strpart("OffOn", 3 * &cursorline, 3)<CR>
" autocmd filetype tex map <silent> <F9> \ll:!echo % \| awk -F "." '{print $1".pdf"}'<CR>	
" autocmd filetype tex map <silent> <F10> :set spell! spelllang=en_us <CR><Bar>:syntax spell toplevel<CR><Bar>:echo "Spell check: " . strpart("OffOn", 3 * &spell, 3)<CR>
" autocmd filetype tex map <F11> :s/^/% /g<CR>
" autocmd filetype tex map <F12> :s/^% //g<CR>
" autocmd filetype tex map <F1> ]s
" autocmd filetype tex map <F2> z=
" autocmd filetype tex map <F3> zg
"" for compiling latex
" set shellslash
" set grepprg=grep\ -nH\ $*
" let g:tex_flavor='latex'
" let g:Tex_FormatDependency_pdf = 'dvi,ps,pdf'
" let g:Tex_CompileRule_dvi = 'pdflatex --interaction=nonstopmode $*'
" let g:Tex_CompileRule_ps = 'dvips -Ppdf -o $*.ps $*.dvi'
" let g:Tex_CompileRule_pdf = 'ps2pdf $*.ps'
" let g:Tex_ViewRule_pdf = 'evince'
" let g:tex_comment_nospell = 1
" let g:Tex_IgnoredWarnings = 1
