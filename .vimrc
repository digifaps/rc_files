	set nocompatible              " be iMproved, required
	filetype off                  " required

	" set the runtime path to include Vundle and initialize
	set rtp+=~/.vim/bundle/Vundle.vim
	call vundle#begin()
	" alternatively, pass a path where Vundle should install plugins
	" call vundle#begin('~/some/path/here')
	" let Vundle manage Vundle, required
	Plugin 'VundleVim/Vundle.vim'
	Plugin 'scrooloose/nerdtree'
	Plugin 'bling/vim-airline'
	Plugin 'vim-airline/vim-airline-themes'
	Plugin 'majutsushi/tagbar'
	Plugin 'altercation/vim-colors-solarized'
	Plugin 'tpope/vim-fugitive'
	Plugin 'flazz/vim-colorschemes'
	Plugin 'sjl/gundo.vim'
	Plugin 'Raimondi/delimitMate'
	Plugin 'bronson/vim-trailing-whitespace'
	Plugin 'a.vim'
	Plugin 'will133/vim-dirdiff'
	Plugin 'tomtom/tcomment_vim'
	Plugin 'Lokaltog/vim-easymotion'
	Plugin 'airblade/vim-gitgutter'
	Plugin 'scrooloose/syntastic'
	Plugin 'scrooloose/nerdcommenter'
	Plugin 'godlygeek/tabular'

	" All of your Plugins must be added before the following line
	call vundle#end()            " required
	filetype plugin indent on    " required
	" To ignore plugin indent changes, instead use:
	" filetype plugin on
	" see :h vundle for more details or wiki for FAQ
	" Put your non-Plugin stuff after this line
  if !exists('g:airline_symbols')
	  let g:airline_symbols = {}
  endif

	let g:airline_symbols.space = "\ua0"
  let g:airline_theme = "dark"
  let g:airline_powerline_fonts = 1         " automatically populate g:airline_symbols with powerline symbols
  let g:airline#extensions#tabline#enabled = 1
  let g:airline#extensions#tabline#fnamemod = ':t'
  let g:airline#extensions#tabline#show_close_button = 0
  let g:airline#extensions#tabline#show_splits = 0
  let g:airline#extensions#tagbar#enabled = 1
  let g:airline#extensions#syntastic#enable = 1
  set laststatus=2


  " --- Fast tabular navigation
  map <tab> gt
  map <S-tab> gT

  " -------------------------------------- "
  " --------------- LEADER --------------- "
  " -------------------------------------- "

  let mapleader = "," " , is leader key, used as <leader> in key bindings
  let g:mapleader = ","    " g: global variable see :help internal-variables

  " -------------------------------------- "
  " --------------- NERDtee -------------- "
  " -------------------------------------- "

  nmap <leader>ne :NERDTreeToggle<cr>

  " -------------------------------------- "
  " -------------- ctrlp ----------------- "
  " -------------------------------------- "

  let g:ctrlp_working_path_mode='a'
  nmap <leader>p :CtrlPBuffer<cr>

  " -------------------------------------- "
  " -------------- Gundo ----------------- "
  " -------------------------------------- "

  nmap <leader>gu :GundoToggle<cr>

  " -------------------------------------- "
  " --------------- Tagbar -------------- "
  " -------------------------------------- "

  nmap <leader>ta :TagbarToggle<cr>
  let g:tagbar_sort = 0

  " -------------------------------------- "
  " -------------- gitgutter ------------- "
  " -------------------------------------- "

  nmap <leader>gg :GitGutterToggle<cr>

  " -------------------------------------- "
  " -------- trailing-whitespace --------- "
  " -------------------------------------- "

  nmap <leader>fw :FixWhitespace<cr>

  " -------------------------------------- "
  " --------------- a.vim ---------------- "
  " -------------------------------------- "

  nmap <leader>AA :A<cr>
  nmap <leader>AS :AS<cr>
  nmap <leader>AV :AV<cr>
  nmap <leader>AT :AT<cr>

  " -------------------------------------- "
  " -------------- Tabularize ------------ "
  " -------------------------------------- "


	nmap <Leader>a= :Tabularize /=<CR>
	vmap <Leader>a= :Tabularize /=<CR>
	nmap <Leader>a: :Tabularize /:<CR>
	vmap <Leader>a: :Tabularize /:<CR>
	nmap <Leader>A: :Tabularize /:\zs<CR>
  vmap <Leader>A: :Tabularize /:\zs<CR>
	"nmap <Leader>a| :Tabularize /|<CR>
	"vmap <Leader>a| :Tabularize /|<CR>
	inoremap <silent> <Bar>   <Bar><Esc>:call <SID>align()<CR>a

	function! s:align()
		let p = '^\s*|\s.*\s|\s*$'
		  if exists(':Tabularize') && getline('.') =~# '^\s*|' && (getline(line('.')-1) =~# p || getline(line('.')+1) =~# p)
				let column = strlen(substitute(getline('.')[0:col('.')],'[^|]','','g'))
				let position = strlen(matchstr(getline('.')[0:col('.')],'.*|\s*\zs.*'))
				Tabularize/|/l1
				normal! 0
				call search(repeat('[^|]*|',column).'\s\{-\}'.repeat('.',position),'ce',line('.'))
			endif
	endfunction

	" -------------------------------------- "
  " -------------- SOLIRIZED ------------- "
  " -------------------------------------- "

  syntax enable
  set background=dark
  let g:solarized_termcolors=256
  set t_Co=256
  colorscheme monokai

  set tabstop=2               " number of visual spaces per TAB
  set softtabstop=2           " number of spaces in tab when editing
  set shiftwidth=2            " nuber of spaces for each step of (auto)indentAL OPTIONS)"
  set autoindent              " Copy indent from current line when starting a new line
  set number                  " show line numbers
  " set relativenumber
  set colorcolumn=100         " keep lines 100 characters at most
  set cursorline              " highlight current line
  set wildmenu                " visual autocomplete for command menu
  set hidden                  " hide buffers instead of closing them
  set mouse=a                 " enable use of the mouse. Only works for certain terminals

	" set showcmd                " show command in bottom bar
	" set cmdheight=2            " Nuber of screen lines to use for the command-line
	" set ruler                  " Show line and column numbers of the cursor position, seperated by a comma
  set autoread                " Set to auto read when a file is changed from the outside"
  set smartindent             " use entelligent identation for C-like languages
  set incsearch               " search as characters are entered
  set hlsearch                " highlight matches
  set showmatch               " highlight matchin [{()}]
  set ignorecase              " ignore case of normal letters
  set smartcase               " ignore case whem the pattern contains lowercase only

  " -------------------------------------- "
  " ----------- Other Bindings ----------- "
  " -------------------------------------- "

  " --- Tiping j and k to switch to command mode

	inoremap jk <esc>

  " --- Smarter moving between split windows

	map <C-h> <C-w>h
  map <C-j> <C-w>j
  map <C-k> <C-w>k
  map <C-l> <C-w>l
  set splitright
  set splitbelow

  " --- Fast saving

	nmap <leader>w :w!<cr>

  " --- Fast vimrc editing

	nmap <leader>e :e! ~/.vimrc<cr>

  " --- Automatic reload and source of ~/.vimrc

	augroup reload_vimrc " {
		autocmd!
    autocmd BufWritePost $MYVIMRC source $MYVIMRC
    augroup END " }

	" --- Fast buffer navigation

	map <leader>t :bp<cr>
  map <leader>s :bn<cr>

	set statusline+=%#warningmsg#
	set statusline+=%{SyntasticStatuslineFlag()}
	set statusline+=%*

	let g:syntastic_always_populate_loc_list = 1
	let g:syntastic_auto_loc_list = 1
	let g:syntastic_check_on_open = 1
	let g:syntastic_check_on_wq = 0
