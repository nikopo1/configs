" Vundle Plugins {{{

set nocompatible              " be iMproved, required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'

" Keep Plugin commands between vundle#begin/end.
Plugin 'tpope/vim-fugitive'

" graphical undo-redo
Plugin 'sjl/gundo'

Plugin 'bling/vim-airline'

" Doesn't work without Python 2.X
" Plugin 'Valloric/YouCompleteMe'

" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required
" To ignore plugin indent changes, instead use:
"filetype plugin on
"
" Brief help
" :PluginList       - lists configured plugins
" :PluginInstall    - installs plugins; append `!` to update or just :PluginUpdate
" :PluginSearch foo - searches for foo; append `!` to refresh local cache
" :PluginClean      - confirms removal of unused plugins; append `!` to auto-approve removal
"
" see :h vundle for more details or wiki for FAQ
" Put your non-Plugin stuff after this line

let g:airline_powerline_fonts = 1

"if !exists('g:airline_symbols')
"  let g:airline_symbols = {}
"endif

" unicode symbols
"let g:airline_left_sep = '»'
"let g:airline_left_sep = '▶'
"let g:airline_right_sep = '«'
"let g:airline_right_sep = '◀'
"let g:airline_symbols.linenr = '␊'
"let g:airline_symbols.linenr = '␤'
"let g:airline_symbols.linenr = '¶'
"let g:airline_symbols.branch = '⎇'
"let g:airline_symbols.paste = 'ρ'
"let g:airline_symbols.paste = 'Þ'
"let g:airline_symbols.paste = '∥'
"let g:airline_symbols.whitespace = 'Ξ'

set runtimepath+=~/.vim/bundle/YouCompleteMe
let g:ycm_collect_identifiers_from_tags_files=1
let g:ycm_key_list_select_completion=[]
let g:ycm_key_list_select_previous_completion=[]
let g:ycm_confirm_extra_conf=0
let g:ycm_global_ycm_extra_conf='~/.vim/bundle/YouCompleteMe/third_party/ycmd/cpp/ycm/.ycm_extra_conf.py'
let g:ycm_show_diagnostics_ui=0
let g:ycm_autoclose_preview_window_after_completion=1
let g:ycm_autoclose_preview_window_after_insertion=1

" }}}
" Global configurations {{{

" Enable loading local .vimrc files from the current directory
set exrc

" }}}
" Visual {{{

" enable syntax highlighting
syntax on

" enable spell checking on for text
set spell

" current color scheme
colorscheme molokai

" Uncomment the following to have Vim load indentation rules and plugins
" according to the detected filetype.
if has("autocmd")
  filetype plugin indent on
endif

" show matching brackets
set showmatch

" display line numbers
set number

" show last command in the bottom-right corner, useful for combos
set showcmd

" highlight current line
set cursorline

" tab completion more like the one in bash
set wildmode=longest,list,full
set wildmenu

" no redrawing in middle of macros
set lazyredraw

" format of information displayed in the status bar
"   f - relative pathfile,
"   y - file type
"   h - help buffer tag
"   m - '[+]' if modified or '[-]' if not modifiable
"   r - read-only file tag
"   B - character under cursor value in hex
"   l - current line number
"   L - total number of lines in buffer
"   c - column number
"   C - virtual column number
"   P - percentage through file of displayed window

" old status line, before airline
" set statusline=%<%f\ %y%h%m%r%=%-24.(0x%02B,%l/%L,%c%V%)\ %P

" set statusline=\ %{HasPaste()}%F%m%r%h\ %w\ \ CWD:\ %r%{getcwd()}%h\ \ \ Line:\ %l

" Returns true if paste mode is enabled
function! HasPaste()
  if &paste
    return 'PASTE MODE  '
  endif
  return ''
endfunction

" always display status line
set laststatus=2

" more tabs -- we have enough memory.
set tabpagemax=20

" mark tabs and spaces
set list listchars=tab:»\ ,trail:·,extends:»,precedes:«

" display 80 characters color column
set colorcolumn=80

" }}}
" Editing {{{

set splitright		" always open new vertical splits to the right
set splitbelow		" always open new horizontal splits below

" reformat paragraphs, uses the textwidth for the right text wrap margin
map Q gq}

" Align subsequent lines to open parentheses in C sources. Disabled for the
" moment, two tabs look better.
" set cinoptions=(0,W4

" }}}
" Movement & Searching {{{

" move vertically by visual line
nnoremap j gj
nnoremap k gk

" make it easier to move to beginning/end of line
nnoremap B ^
nnoremap E $
xnoremap B ^
xnoremap E $

" double-press 'j' key to exit insert mode
imap jj <Esc>

" mappings for navigating through tabs
nnoremap <F1> 1gt
nnoremap <F2> 2gt
nnoremap <F3> 3gt
nnoremap <F4> 4gt

" restore position inside previously opened file, from vim.wikia
function! ResCur()
  if line("'\"") <= line("$")
    normal! g`"
    return 1
  endif
endfunction

augroup resCur
  autocmd!
  autocmd BufWinEnter * call ResCur()
augroup END

" uncomment this to enable mouse
" if has('mouse')
"   set mouse=a
" endif

" searching configuration
set smartcase		" use smart case when searching
set incsearch		" search as characters are entered
set hlsearch		" highlight matches

" turn off search highlighting after search by pressing F5
nnoremap <F5> :nohlsearch<CR>

" }}}
" Folding {{{

set foldenable		" enables folding
set foldlevelstart=10	" open most folds
set foldnestmax=10	" maximum number of nested folds
set foldmethod=indent 	" fold based on indentation level

" space opens/closes folds
nnoremap <space> za

" }}}
" Leader Shortcuts {{{

let mapleader=","

vmap <leader>s :sort<CR>
map <leader>q gq<END><CR>
map <leader>b :Gblame<CR>
map <leader>m :make<CR>
vmap <leader>{ [{
vmap <leader>} ]}


" }}}
" Editor-specific {{{

set modeline		" use file-specific settings set in edited files
set autowrite		" save file on buffer switch
set dir=/tmp		" set directory to store swap files

" Tell vim to remember certain things when we exit
"  '10  :  marks will be remembered for up to 10 previously edited files
"  "100 :  will save up to 100 lines for each register
"  :20  :  up to 20 lines of command-line history will be remembered
"  %    :  saves and restores the buffer list
"  n    :  where to save the viminfo files
set viminfo='10,\"100,:20,%,n~/.viminfo

set hidden		" no error on opening new file after modifying old one
filetype plugin on	" enable plugin load for specific filetypes

" }}}
" ctags {{{

set tags=./tags;/		" which tag file to use first

" }}}
" cscope {{{

if has("cscope")
	" Look for a 'cscope.out' file starting from the current directory,
	" going up to the root directory.
	let s:dirs = split(getcwd(), "/")
	while s:dirs != []
		let s:path = "/" . join(s:dirs, "/")
		if (filereadable(s:path . "/cscope.out"))
			execute "cs add " . s:path . "/cscope.out " . s:path . " -v"
			break
		endif
		let s:dirs = s:dirs[:-2]
	endwhile

	set csto=0	" use cscope first, then ctags
	set cst		" search both cscope and ctags
	set csverb	" make cs verbose for success/failure messages

	" do a search in current window for the word under the cursor
	nmap <C-\>s :cs find s <C-R>=expand("<cword>")<CR><CR>
	nmap <C-\>g :cs find g <C-R>=expand("<cword>")<CR><CR>
	nmap <C-\>c :cs find c <C-R>=expand("<cword>")<CR><CR>
	nmap <C-\>t :cs find t <C-R>=expand("<cword>")<CR><CR>
	nmap <C-\>e :cs find e <C-R>=expand("<cword>")<CR><CR>
	nmap <C-\>f :cs find f <C-R>=expand("<cfile>")<CR><CR>
	nmap <C-\>i :cs find i ^<C-R>=expand("<cfile>")<CR>$<CR>
	nmap <C-\>d :cs find d <C-R>=expand("<cword>")<CR><CR>

	" do a search in a separate window for the word under the cursor
	nmap <C-@>s :vert scs find s <C-R>=expand("<cword>")<CR><CR>
	nmap <C-@>g :vert scs find g <C-R>=expand("<cword>")<CR><CR>
	nmap <C-@>c :vert scs find c <C-R>=expand("<cword>")<CR><CR>
	nmap <C-@>t :vert scs find t <C-R>=expand("<cword>")<CR><CR>
	nmap <C-@>e :vert scs find e <C-R>=expand("<cword>")<CR><CR>
	nmap <C-@>f :vert scs find f <C-R>=expand("<cfile>")<CR><CR>
	nmap <C-@>i :vert scs find i ^<C-R>=expand("<cfile>")<CR>$<CR>
	nmap <C-@>d :vert scs find d <C-R>=expand("<cword>")<CR><CR>

	" don't open quick fix window to show results for these queries
	set cscopequickfix=s-,c-,d-,i-,t-,e-,g-
endif

" open/close cscope quickfix window
nnoremap <F9> :cope<CR>
nnoremap <S-F9> :ccl<CR>

" cscope navigate through results
nnoremap <S-Tab> :cp<CR>
nnoremap <Tab> :cn<CR>

" Command to rebuild cscope database and reinitialize the connection to it.
command Cscope silent call s:rebuild_cscope()
function s:rebuild_cscope()
    !cscope -Rb

    redir => s:cs_connections
    silent cs show
    redir END

    let s:cs_connections = substitute(s:cs_connections, "^[ \t\n]*", "", "g")
    let s:cs_connections = substitute(s:cs_connections, "[ \t\n]*$", "", "g")

    if s:cs_connections ==? "no cscope connections"
        " Add connection
        silent cs add cscope.out
    else
        " Reset connection
        silent cs reset
    endif
endfunction

" }}}
" Filetypes {{{

" per-filetype settings
autocmd FileType java		setlocal tw=78 cin foldmethod=marker
autocmd FileType c,cpp		setlocal tw=78 cindent expandtab tabstop=4 shiftwidth=4
autocmd FileType lex,yacc	setlocal tw=78 cindent expandtab tabstop=4 shiftwidth=4
autocmd FileType python		setlocal autoindent expandtab sts=4 sw=4 tw=98
autocmd FileType haskell	setlocal tw=78 sw=2 sts=2 et
autocmd FileType tex		setlocal tw=78 sw=2 sts=2 ai et
autocmd FileType markdown	setlocal tw=78 sw=2 sts=2 ai et
" 'linebreak' won't work without 'nolist'
autocmd FileType creole		setlocal tw=0 fo=t wrap nolist linebreak
autocmd FileType mail		setlocal tw=78 fo=tql
autocmd FileType lua		setlocal sts=4 sw=4 ai et

" Custom filetypes per extension. Not sure this is the recommended way to do it.
autocmd BufRead,BufNewFile *.wiki setlocal ft=creole
autocmd BufRead,BufNewFile *.tex setlocal ft=tex
autocmd BufRead,BufNewFile *.l setlocal ft=lex
autocmd BufRead,BufNewFile *.y setlocal ft=yacc
autocmd BufRead,BufNewFile *.md setlocal ft=markdown
autocmd BufRead,BufNewFile *.cool setlocal ft=cool
autocmd BufRead,BufNewFile *.cl setlocal ft=cool
autocmd BufRead,BufNewFile *.miC setlocal ft=C
autocmd BufRead,BufNewFile *.g setlocal ft=antlr
autocmd BufRead,BufNewFile *.rkt setlocal ft=scheme
autocmd BufRead,BufNewFile SConstruct* setlocal ft=python tw=0
autocmd BufRead,BufNewFile SConscript* setlocal ft=python tw=0

" }}}
" Plugins Shortcuts {{{

nnoremap <F6> :GundoToggle<CR>

let g:gundo_width = 110
let g:gundo_preview_height = 40
let g:gundo_right = 1

" }}}

" vim:foldmethod=marker:foldlevel=0
