"-------------------------------------------------------------------------------
" I. PLUGIN
"
" :PluginList       - lists configured plugins
" :PluginInstall    - installs plugins; append `!` to update or just :PluginUpdate
" :PluginSearch foo - searches for foo; append `!` to refresh local cache
" :PluginClean      - confirms removal of unused plugins; append `!` to auto-approve removal
"-------------------------------------------------------------------------------
let mapleader = "\\"
let maplocalleader = "\\"

set rtp+=~/.vim/bundle/Vundle.vim

call vundle#begin()
Bundle 'ervandew/supertab'
Plugin 'gmarik/Vundle.vim'
Plugin 'majutsushi/tagbar'
Plugin 'scrooloose/nerdtree'
Plugin 'scrooloose/nerdcommenter'
Plugin 'SirVer/ultisnips'
Plugin 'Valloric/YouCompleteMe'
call vundle#end()

let g:ycm_key_list_select_completion   = [ '<c-n>', '<down>' ]
let g:ycm_key_list_previous_completion = [ '<c-p>', '<up>'   ]
let g:SuperTabDefaultCompletionType    = '<c-n>'

let g:UltiSnipsExpandTrigger           = '<tab>'
let g:UltiSnipsJumpForwardTrigger      = '<tab>'
let g:UltiSnipsJumpBackwardTrigger     = '<s-tab>'

nnoremap <F5> :NERDTreeToggle<cr>
nnoremap <F6> :TagbarToggle<CR>

"-------------------------------------------------------------------------------
" II. OPTIONS
"-------------------------------------------------------------------------------
" 1 IMPORTANT
set nocompatible
set pastetoggle=<F3>

" 2 MOVING AROUND, SEARCHING AND PATTERNS
set whichwrap+=<,>,[,],s,b
set incsearch
set magic
set noignorecase
set smartcase

" 3 TAGES
" 4 DISPLAYING TEXT
set fillchars=vert:\ ,stl:\ ,stlnc:\
set number

" 5 SYNTAX, HIGHLIGHTING AND SPELLING
syntax on
filetype plugin indent on
set hlsearch
set cursorline
let &colorcolumn=join(range(81, 300), ",")

" 6 MULTIPLE WINDOWS
set laststatus=2

" 7 MULTIPLE TAB PAGES
" 8 TERMINAL
" 9 USING THE MOUSE
set mouse=a

" 10 GUI
" 11 PRINTING
" 12 MESSAGES AND INFO
set showcmd
set showmode
set ruler
set report=0
set confirm
set noerrorbells

" 13 SELECTING TEXT
set selection=exclusive
set selectmode=mouse,key

" 14 EDITING TEXT
set textwidth=80
set backspace=2
set formatoptions+=t
set completeopt=longest,menu
set showmatch
set matchtime=1

" 15 TABS AND INDENTING
set tabstop=4
set shiftwidth=4
set smarttab
set softtabstop=4
set expandtab
set autoindent
set smartindent
set cindent

" 16 FOLDING
" 17 DIFF MODE
" 18 MAPPING
" 19 READING AND WRITING FILES
set nowritebackup
set nobackup
set autowrite
set autoread

" 20 THE SWAP FILE
set noswapfile

" 21 COMMAND LINE EDITING
set history=500
set wildmenu

" 22 EXECUATING EXTERNAL COMMANDS
" 23 RUNNING MAKE AND JUMPING TO ERRORS
" 24 LANGUAGE SPECIFIC

" 25 MULTI-BYTE CHARACTERS
" 26 VARIOUS
set viminfo+=!

"-------------------------------------------------------------------------------
" III. MAPPING
"-------------------------------------------------------------------------------
map <silent> <leader><cr>      :noh<cr>
map <silent> <localleader><cr> :noh<cr>
nnoremap <silent> <leader>rc   :vsp $MYVIMRC<cr>
nnoremap <silent> <leader>sr   :w<cr>:source $MYVIMRC<cr>:noh<cr>
nnoremap <silent> <F4>         :call <SID>StripTrailingWhitespaces()<cr>

nnoremap <c-j> <c-W>j
nnoremap <c-k> <c-W>k
nnoremap <c-h> <c-W>h
nnoremap <c-l> <c-W>l

inoremap ( ()<esc>i
inoremap { {}<esc>i
inoremap [ []<esc>i
"inoremap " ""<esc>i
"inoremap ' ''<esc>i

inoremap ) <c-r>=ClosePair(')')<cr>
inoremap } <c-r>=ClosePair('}')<cr>
inoremap ] <c-r>=ClosePair(']')<cr>
"inoremap " <c-r>=QuoteDelim('"')<cr>
"inoremap ' <c-r>=QuoteDelim("'")<cr>

inoremap <expr> <bs> DeleteEmptyPair()

vnoremap ( <esc>`>a)<esc>`<i(<esc>
vnoremap ) <esc>`>a)<esc>`<i(<esc>
vnoremap { <esc>`>a}<esc>`<i{<esc>
vnoremap } <esc>`>a}<esc>`<i{<esc>
vnoremap [ <esc>`>a]<esc>`<i[<esc>
vnoremap ] <esc>`>a]<esc>`<i[<esc>
vnoremap < <esc>`>a><esc>`<i<<esc>
vnoremap > <esc>`>a><esc>`<i<<esc>
vnoremap " <esc>`>a"<esc>`<i"<esc>
vnoremap ' <esc>`>a'<esc>`<i'<esc>

func! ClosePair(char)
	if getline('.')[col('.') - 1] == a:char
		return "\<right>"
	else
		return a:char
	endif
endfunc

func! QuoteDelim(char)
	let line = getline('.')
	let col = col('.')
	if line[col - 2] == "\\"
		return a:char
	elseif line[col - 1] == a:char
		return "\<right>"
	else
		return a:char.a:char."\<left>"
	endif
endfunc

func! DeleteEmptyPair()
	if InAnEmptyPair()
		return "\<left>\<del>\<del>"
	else
		return "\<bs>"
	endif
endfunc

func! InAnEmptyPair()
	let cur = strpart(getline('.'),getpos('.')[2]-2,2)
	for pair in (split(&matchpairs,',') + ['":"',"':'"])
		if cur == join(split(pair,':'),'')
			return 1
		endif
	endfor
	return 0
endfunc

func! <SID>StripTrailingWhitespaces()
    let _s = @/
    let l = line(".")
    let c = col(".")
    %s/\s\+$//e
    let @/ = _s
    call cursor(l, c)
endfunc

"-------------------------------------------------------------------------------
" IV. AUTOCOMMAND
"-------------------------------------------------------------------------------
for f in split(glob('~/.vim/ftplugin/*.vim'), '\n')
	exe 'source' f
endfor
autocmd BufNewFile * silent! $r ~/.vim/template/%:e.tpl

if has("autocmd")
  autocmd bufwritepost .vimrc source $MYVIMRC
endif

"-------------------------------------------------------------------------------
" V. GUI
"-------------------------------------------------------------------------------
colorscheme peachpuff
highlight ColorColumn ctermbg=235 guibg=#808080
