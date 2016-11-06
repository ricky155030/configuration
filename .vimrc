""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"                               General Config                               "
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

syntax enable
set nocompatible
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
set copyindent
set autoindent
set preserveindent
set wildmenu
set winaltkeys=no
set laststatus=2	" vim status bar
set hidden
set completeopt-=preview
set encoding=utf-8  " Encoding Setting

filetype plugin on
filetype indent on

" Color scheme
set t_Co=256
colorscheme wombat256
set background=light
hi Comment ctermfg=red
" syntax enable
" colorscheme solarized
" set background=dark

" folding
set foldenable 
autocmd filetype python set foldmethod=indent
set foldcolumn=0 
set foldnestmax=2 
nnoremap <space> za

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"                                 Functions                                  "
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

let g:background_opacity = 1

function BackgroundToggle()
    echo "execute"
    if ! exists("g:background_opacity")
        return
    endif

    if g:background_opacity
        execute "highlight Normal ctermbg=none"
        execute "highlight LineNr ctermbg=none"
    else
        execute "highlight Normal ctermbg=234"
        execute "highlight LineNr ctermbg=232"
    endif

    let g:background_opacity = !g:background_opacity
endfunction


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"                                Key Mapping                                 "
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

let mapleader = "\<C-c>"

" general key mapping 
inoremap   jj           <ESC>
nnoremap   <leader>hh   <C-w>h
nnoremap   <leader>jj   <C-w>j
nnoremap   <leader>kk   <C-w>k
nnoremap   <leader>ll   <C-w>l
nnoremap   <leader>t    :badd 
nnoremap   <S-Q>        :bprev<CR>
nnoremap   <S-W>        :bnext<CR>
nnoremap   <leader>q    :bdelete<CR>
nnoremap   <leader>s    :w<CR>
nnoremap   <leader>[    :lprevious<CR>
nnoremap   <leader>]    :lnext<CR>
nnoremap   <F12>        :NERDTreeToggle<CR>
nnoremap   <F10>        :GitGutterLineHighlightsToggle<CR>
nnoremap   <F5>         :SyntasticToggleMode<CR>
nnoremap   <leader>b    :call BackgroundToggle()<CR>

set pastetoggle=<leader>p

" key mapping for adding comment to code
autocmd filetype c      map <F7> :s/^/\/\//g<CR>
autocmd filetype c      map <F8> :s/^\/\///g<CR>
autocmd filetype cpp    map <F7> :s/^/\/\//g<CR>
autocmd filetype cpp    map <F8> :s/^\/\///g<CR>
autocmd filetype html   map <F7> :s/^\(.*\)$/<!--\1-->/g<CR>
autocmd filetype html   map <F8> :s/^<!--\(.*\)-->$/\1/g<CR>
autocmd filetype sh     map <F7> :s/^/# /g<CR>
autocmd filetype sh     map <F8> :s/^# //g<CR>
autocmd filetype perl   map <F7> :s/^/# /g<CR>
autocmd filetype perl   map <F8> :s/^# //g<CR>
autocmd filetype python map <F7> :s/^/# /g<CR>
autocmd filetype python map <F8> :s/^# //g<CR>

" key mapping for executing code
autocmd filetype c      map <F9> :w<CR>:!gcc -lm % && ./a.out<CR>
autocmd filetype cpp    map <F9> :w<CR>:make clean<CR>:make<CR>:!./a.out<CR>
autocmd filetype sh     map <F9> :w<CR>:!bash %<CR>
autocmd filetype perl   map <F9> :w<CR>:!perl %<CR>
autocmd filetype python map <F9> :w<CR>:!`which python3.4` %<CR>

" add filetype for Utilsnip
autocmd FileType javascript :UltiSnipsAddFiletypes javascript
autocmd FileType html       :UltiSnipsAddFiletypes html
autocmd FileType css        :UltiSnipsAddFiletypes css
autocmd FileType less       :UltiSnipsAddFiletypes css
autocmd FileType python     :UltiSnipsAddFiletypes python

" exclude from buffer next or prev
autocmd FileType qf set nobuflisted
autocmd FileType ll set nobuflisted

" set filetypes
autocmd BufNewFile,BufRead *.less set filetype=less
autocmd BufNewFile,BufRead *.js set filetype=javascript

" set different indent style
autocmd FileType javascript setlocal tabstop=2 | setlocal softtabstop=2 | setlocal shiftwidth=2
autocmd FileType html setlocal tabstop=2 | setlocal softtabstop=2 | setlocal shiftwidth=2
autocmd FileType css setlocal tabstop=2 | setlocal softtabstop=2 | setlocal shiftwidth=2
autocmd FileType less setlocal tabstop=2 | setlocal softtabstop=2 | setlocal shiftwidth=2

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"                            Plugin Confiuration                             "
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" Jedi
let g:jedi#completions_enabled                      = 0

" YouCompleteMe
let g:ycm_min_num_of_chars_for_completion           = 2
let g:ycm_autoclose_preview_window_after_completion = 1
let g:ycm_key_list_select_completion                = ['<C-n>', '<Down>']
let g:ycm_key_list_previous_completion              = ['<C-p>', '<Up>']
let g:ycm_use_ultisnips_completer                   = 1
let g:ycm_filetype_blacklist                        = {
      \ 'tagbar' : 1,
      \ 'qf' : 1,
      \ 'notes' : 1,
      \ 'unite' : 1,
      \ 'text' : 1,
      \ 'vimwiki' : 1,
      \ 'gitcommit' : 1,
      \}

" Ultisnips
let g:UltiSnipsExpandTrigger       = "<Tab>"
let g:UltiSnipsJumpForwardTrigger  = "<C-n>"
let g:UltiSnipsJumpBackwardTrigger = "<C-p>"

" Airline
let g:airline#extensions#tabline#enabled  = 1
let g:airline#extensions#tabline#fnamemod = ':t'
let g:airline#extensions#hunks#enabled    = 1
let g:airline#extensions#branch#enabled   = 1
let g:airline_powerline_fonts             = 1

" Syntastic
" set statusline+=%#warningmsg#
" set statusline+=%{SyntasticStatuslineFlag()}
" set statusline+=%*
" let g:syntastic_always_populate_loc_list = 1
" let g:syntastic_auto_loc_list            = 1
" let g:syntastic_check_on_open            = 0
" let g:syntastic_check_on_wq              = 0
" let g:syntastic_loc_list_height          = 5
" let g:syntastic_python_checkers          = ['pylint']
" let g:syntastic_html_checkers            = ['tidy']
" let g:syntastic_javascript_checkers      = ['jshint']

" Ternjs
let tern#is_show_argument_hints_enabled = 1
let g:tern_show_argument_hints   = 'on_hold'
let g:tern_show_signature_in_pum = 1

" GitGutter
let g:gitgutter_realtime         = 1
let g:gitgutter_eager            = 1

" Javascript-libraries-syntax
let g:used_javascript_libs       = 'jquery,react'
set omnifunc=syntaxcomplete#Complete

" MultipleCursors
let g:multi_cursor_exit_from_insert_mode = 0

" IndentLine
let g:indentLine_color_term = 8
let g:indentLine_char = '¦'

" JSX
let g:jsx_ext_required = 0

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"                                   Others                                   "
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

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

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"                                  Plugins                                   "
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" let Vundle manage Vundle
" required! 
Plugin 'gmarik/vundle'

" git repo
Plugin 'bling/vim-airline'
Plugin 'vim-airline/vim-airline-themes'
Plugin 'airblade/vim-gitgutter'
Plugin 'godlygeek/tabular'
Plugin 'tpope/vim-fugitive'
Plugin 'terryma/vim-multiple-cursors'
Plugin 'scrooloose/nerdtree'
Plugin 'Yggdroot/indentLine'
Plugin 'tpope/vim-surround'             " Click ds, ysiw, cs to change surrounding quotation
Plugin 'rking/ag.vim'
Plugin 'jiangmiao/auto-pairs'
" Plugin 'groenewege/vim-less'

" AutoComplete
Plugin 'Valloric/YouCompleteMe'
Plugin 'davidhalter/jedi-vim'           " auto complete for python
Plugin 'marijnh/tern_for_vim'           " auto complete for javascript

" Syntax
Plugin 'othree/javascript-libraries-syntax.vim'
" Plugin 'othree/yajs.git'
Plugin 'mxw/vim-jsx'

" Snippet
Plugin 'SirVer/ultisnips'
Plugin 'honza/vim-snippets'
Plugin 'justinj/vim-react-snippets'

" Indent
Plugin 'gavocanov/vim-js-indent'

