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
set completeopt=menu,longest
set encoding=utf-8  " Encoding Setting
set pastetoggle=<F5>
set scrolloff=7
set whichwrap+=<,>,h,l  " add <,>,h,l to move over lines
set shiftround      " When use <,> to indent line, the width will be multiple of shiftwidth

filetype plugin on
filetype indent on

" Color scheme
set t_Co=256
syntax on
hi Comment ctermfg=red
colorscheme gruvbox
set background=dark

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"                                 Functions                                  "
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

let g:background_opacity = 1

function ChangeBackground()
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
nnoremap   <leader>b    :call ChangeBackground()<CR>
nnoremap   <F10>        :GitGutterLineHighlightsToggle<CR>
nnoremap   <F12>        :NERDTreeToggle<CR>

" Mapping for swap line cursor moving
nnoremap   k            gk
nnoremap   gk           k
nnoremap   j            gj
nnoremap   gj           j

" Keep search pattern at the center of the screen.
nnoremap <silent> n nzz
nnoremap <silent> N Nzz
nnoremap <silent> * *zz
nnoremap <silent> # #zz
nnoremap <silent> g* g*zz

" y$ -> Y Make Y behave like other capitals
map Y y$

" remap U to <C-r> for easier redo
nnoremap U <C-r>

" exchange #/* function
nnoremap * #
nnoremap # *

nnoremap <silent><leader>/ :nohls<CR>

" key mapping for folding
nnoremap <space> za
nnoremap <leader><space> zm

" set filetypes
autocmd BufNewFile,BufRead *.less set filetype=less
autocmd BufNewFile,BufRead *.js set filetype=javascript

" add filetype for Utilsnip
" autocmd FileType javascript :UltiSnipsAddFiletypes javascript
" autocmd FileType html       :UltiSnipsAddFiletypes html
" autocmd FileType css        :UltiSnipsAddFiletypes css
" autocmd FileType less       :UltiSnipsAddFiletypes css
" autocmd FileType python     :UltiSnipsAddFiletypes python

" exclude from buffer next or prev
autocmd FileType qf set nobuflisted
autocmd FileType ll set nobuflisted

" set different indent style
autocmd FileType python,javascript,html,css,less set tabstop=2 softtabstop=2 shiftwidth=2

" call ChangeBackground on startup
autocmd VimEnter * :call ChangeBackground()

autocmd filetype tcl nnoremap <F9> :w <bar> exec '!tclsh '.shellescape('%')<CR>
autocmd filetype python nnoremap <F9> :w <bar> exec '!python '.shellescape('%')<CR>
autocmd filetype c      nnoremap <F9> :w <bar> exec '!gcc '.shellescape('%').';./a.out'<CR>
autocmd filetype cpp    nnoremap <F9> :w <bar> exec '!clear; clang++ --std=c++17 '.shellescape('%').';./a.out'<CR>


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"                            Plugin Configuration                            "
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

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
let g:UltiSnipsJumpForwardTrigger  = "<Tab>"
let g:UltiSnipsJumpBackwardTrigger = "<s-Tab>"

" Airline
let g:airline#extensions#tabline#enabled  = 1
let g:airline#extensions#tabline#fnamemod = ':t'
let g:airline#extensions#hunks#enabled    = 1
let g:airline#extensions#branch#enabled   = 1
let g:airline_powerline_fonts             = 1

" Ternjs
let tern#is_show_argument_hints_enabled = 1
let g:tern_show_argument_hints   = 'on_hold'
let g:tern_show_signature_in_pum = 1

" GitGutter
let g:gitgutter_realtime         = 1
let g:gitgutter_eager            = 1

" Javascript-libraries-syntax
let g:used_javascript_libs       = 'react'
set omnifunc=syntaxcomplete#Complete

" MultipleCursors
let g:multi_cursor_exit_from_insert_mode = 0

" IndentLine
let g:indentLine_color_term = 8
let g:indentLine_char = '¦'

" JSX
let g:jsx_ext_required = 0

" Easy Motion
let g:EasyMotion_smartcase = 1
map <Leader><leader>h <Plug>(easymotion-linebackward)
map <Leader><Leader>j <Plug>(easymotion-j)
map <Leader><Leader>k <Plug>(easymotion-k)
map <Leader><leader>l <Plug>(easymotion-lineforward)
" 重复上一次操作, 类似repeat插件, 很强大
map <Leader><leader>. <Plug>(easymotion-repeat)

call plug#begin()
Plug 'tpope/vim-fugitive'
Plug 'jiangmiao/auto-pairs'
Plug 'othree/javascript-libraries-syntax.vim'
Plug 'junegunn/vim-easy-align'
Plug 'easymotion/vim-easymotion'
Plug 'airblade/vim-gitgutter'
Plug 'ternjs/tern_for_vim'
Plug 'jason0x43/vim-js-indent'
Plug 'mxw/vim-jsx'
Plug 'mlaursen/vim-react-snippets'
Plug 'terryma/vim-multiple-cursors'
Plug 'tpope/vim-repeat'
Plug 'tpope/vim-surround'
Plug 'vim-airline/vim-airline'
Plug 'othree/yajs.vim'
Plug 'preservim/nerdtree'
Plug 'junegunn/fzf', { 'do': { -> fzf#install()  }  }
Plug 'junegunn/fzf.vim'
call plug#end()


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
