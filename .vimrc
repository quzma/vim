"{{{ Vundle
	"{{{ Voodoo
	set nocompatible               " be iMproved
	filetype off                   " required!
	set rtp+=~/.vim/bundle/vundle/
	call vundle#rc()

	" let Vundle manage Vundle
	" required! 
	Bundle 'gmarik/vundle'
	"}}}
	"{{{ original repos on github
	Bundle 'altercation/vim-colors-solarized'
	Bundle 'majutsushi/tagbar'
	Bundle 'msanders/snipmate.vim'
	Bundle 'peterhoeg/dbext.vim'
	Bundle 'Raimondi/delimitMate'
	Bundle 'scrooloose/nerdcommenter'
	Bundle 'scrooloose/nerdtree'
	Bundle 'tpope/vim-endwise'
	Bundle 'tpope/vim-fugitive'
	Bundle 'tpope/vim-haml'
	Bundle 'tpope/vim-rails'
	Bundle 'tpope/vim-surround'
	Bundle 'tpope/vim-repeat'
	Bundle 'vexxor/kwbd.vim'
	Bundle 'vexxor/phpdoc.vim'
	Bundle 'vexxor/zenburn.vim'
	Bundle 'vexxor/ManPageView'
	Bundle 'xolox/vim-easytags'
	Bundle 'nathanaelkane/vim-indent-guides'
	Bundle 'clones/vim-l9'
	Bundle 'astashov/vim-ruby-debugger'
	Bundle 'chrismetcalf/vim-yankring'
	Bundle 'mattn/zencoding-vim'
	Bundle 'ndreynolds/vim-cakephp'
	Bundle 'mattn/gist-vim'
	Bundle 'kana/vim-textobj-user'
	Bundle 'nelstrom/vim-textobj-rubyblock'
	Bundle 'michaeljsmith/vim-indent-object'
	Bundle 'kchmck/vim-coffee-script' 
	Bundle 'Lokaltog/vim-easymotion'
	Bundle 'Lokaltog/vim-powerline'
	Bundle 'godlygeek/tabular'
	"}}}
	"{{{ vim-scripts repos
	Bundle 'Gundo'
	Bundle 'matchit.zip'
	Bundle 'phpcomplete.vim'
	Bundle 'svndiff'
	Bundle 'Tail-Bundle'
	Bundle 'vcscommand.vim'
	Bundle 'FuzzyFinder'
	Bundle 'scratch.vim'
	Bundle 'vimwiki'
	Bundle 'showmarks--Politz'
	Bundle 'EnhancedJumps'
	Bundle 'IndexedSearch'
	Bundle 'QFixToggle'
	Bundle 'ZoomWin'
	"Bundle 'ri-browser'
	"}}}
"}}} 
"{{{ Basic
	set backspace=indent,eol,start
	set history=350
	set showcmd
	filetype plugin on
	filetype indent on
	syntax on
	set nocursorcolumn
	set cursorline 
	set autoindent
	set updatetime=4000
	set hidden
	set so=5 " Keep 5 lines (top/bottom) for scope
	set encoding=utf-8
	let mapleader = ","
	set softtabstop=4
	set shiftwidth=4
	set incsearch
	set ignorecase
	set smartcase
	set gdefault
	set hlsearch
	set confirm
"}}}
"{{{Colors and visual
	if has("gui_running")
		:colorscheme solarized
		:set background=dark
		call togglebg#map("<F1>")
	else
		:colorscheme zenburn
	endif
	set number
	set guifont=Dina\ 10
	if has("gui_running")
		set lines=90 columns=230
	endif
	set guioptions-=T
	set guioptions-=m
	set guioptions-=r
	set guioptions-=R
	set guioptions-=l
	set guioptions-=L
	set guioptions-=b
	set guioptions+=c
	set tabstop=4
"}}}
"{{{Backup
	set backup
	set backupdir=~/.vim/backup/
	set directory=~/.vim/backup//
"}}}
"{{{ Undo and Gundo
	set undofile 
	set undodir=~/.vim/undo
	set undolevels=1000 "maximum number of changes that can be undone
	set undoreload=10000 "maximum number lines to save for undo on a buffer reload
	au BufReadPost * set undofile
	nnoremap <F9> :GundoToggle<CR>
"}}}
"{{{WRAPPING
	set nowrap
	noremap <F6> :set nowrap!<CR>
	set sidescroll=10
	set listchars+=precedes:<,extends:>
"}}}
"{{{Statusline
	set laststatus=2
	"set statusline=%F%m%r%h%w\ [FORMAT=%{&ff}]\ [TYPE=%Y]\ [LEN=%L]\ [POS=%04l,%04v][%p%%]
	"set statusline+=\ [CWD=
	"set statusline+=%{getcwd()}
	"set statusline+=]
	"set statusline+=\ %{fugitive#statusline()} 
"}}}
"{{{fugitive.vim
	nnoremap <Leader>ge :Gedit HEAD<CR>
	nnoremap <Leader>gs :Gstatus<CR>
	nnoremap <Leader>gd :Gdiff<CR>
	nnoremap <Leader>gn :Gblame<CR>
	nnoremap <Leader>gR :Gremove<CR>
	nnoremap <Leader>gc :Gcommit<CR>
	nnoremap <Leader>gl :Glog<CR>
	nnoremap <Leader>gb :Gbrowse<CR>
	autocmd BufReadPost fugitive://* set bufhidden=delete
	autocmd User fugitive
	  \ if fugitive#buffer().type() =~# '^\%(tree\|blob\)$' |
	  \   nnoremap <buffer> <C-u> :edit %:h<CR> |
	  \ endif
	nnoremap <C-Right> :cnext<CR>
	nnoremap <C-Left> :cprev<CR>
"}}}
"{{{Misc
	nnoremap <CR> :noh<CR><CR>
	nnoremap <C-g> <C-]>
	noremap č _
	noremap ć $
	noremap <Space> /
	noremap <C-CR> o<Esc>
	nnoremap <leader>b :silent !xdg-open <C-R>=escape("<C-R><C-F>", "#?&;\|%")<CR><CR>		"Open link under cursor in browser
	au FileType * setl fo-=cro "Disable auto comments
	nmap <C-q> :Kwbd<CR>
	if !exists(":DiffOrig")
	  command DiffOrig vert new | set bt=nofile | r # | 0d_ | diffthis
			  \ | wincmd p | diffthis
	endif
	noremap <M-h> :bp<CR>
	noremap <M-l> :bn<CR>
	noremap <C-Tab> :bn<CR>
	nnoremap <leader>f gg=G
	nnoremap <c-down> ]czz 
	nnoremap <c-up> [czz 
"}}}
"{{{Semicolon macro
	let @p='A;'
	noremap <M-,> @p
	inoremap <M-,> @p
"}}}
"{{{ F7 - copypasta
	"copy
	vmap <F7> "+ygv<Esc>
	"paste (Shift-F7 to paste after normal cursor, Ctrl-F7 to paste over visual selection)
	nmap <S-F7> "+gP
	nmap <F7> "+gp
	imap <F7> <C-r><C-o>+
	vmap <C-F7> "+p`]
	cmap <F7> <C-r><C-o>+
	noremap <C-a> <Esc>gg"+yG
"}}}
"{{{ Easytags
    let g:easytags_on_cursorhold = 1
	let g:easytags_updatetime_autodisable = 1
"}}}
"{{{Move lines
	nnoremap <M-j> :m+<CR>==
	nnoremap <M-k> :m-2<CR>==
	inoremap <M-j> <Esc>:m+<CR>==gi
	inoremap <M-k> <Esc>:m-2<CR>==gi
	vnoremap <M-j> :m'>+<CR>gv=`<my`>mzgv`yo`z
	vnoremap <M-k> :m'<-2<CR>gv=`>my`<mzgv`yo`z
"}}}
"{{{Autocomplete
	function! FoolishTab() "Uses Tab or C-n dependant on context (simplified SuperTab or SmartTab principle
	   "check if at beginning of line
		if strpart( getline('.'), 0, col('.')-1 ) =~ '^\s*$'
		  return "\<Tab>"
		else
		  return "\<C-n>"
		endif
	endfunction

	set completeopt+=longest
	set completeopt-=preview "Preview doesnt seem to close
	inoremap <C-l> <C-x><C-o>
	inoremap <C-k> <C-x><C-u>
	inoremap <S-Tab> <Tab>
	nnoremap <S-Tab> <Tab>
	vnoremap <S-Tab> <Tab>
	inoremap <Tab> <C-r>=FoolishTab()<CR>
"}}}
"{{{delimitmate
        let delimitMate_expand_cr = 1
        let delimitMate_expand_space = 1
"}}}
"{{{phpdoc
	inoremap <C-d> <ESC>:call PhpDocSingle()<CR>i 
	nnoremap <C-d> :call PhpDocSingle()<CR> 
	vnoremap <C-d> :call PhpDocRange()<CR> 
" }}}
"{{{YANKRING
	noremap ž :YRShow<CR>
	inoremap ž <Esc>:YRShow<CR>j
	function! YRRunAfterMaps()
			nnoremap Y   :<C-U>YRYankCount 'y$'<CR>
	endfunction
	let g:yankring_min_element_length = 2 
"}}}
"{{{NERDTree
	nnoremap <F5> :NERDTreeToggle<CR>
	let g:NERDTreeShowBookmarks = 1
	let g:NERDTreeHijackNetrw = 0
"}}}
"{{{ NERDCommenter
	map zq <plug>NERDCommenterComment
	map zw <plug>NERDCommenterUncomment
	map zm <plug>NERDCommenterMinimal
"}}}
"{{{Rails
	nnoremap <Leader>rm :Rmodel<CR>
	nnoremap <Leader>rv :Rview<CR>
	nnoremap <Leader>rc :Rcontroller<CR>
	nnoremap <Leader>rh :Rhelper<CR>
	nnoremap <Leader>rs :Rspec<CR>
"}}}
"{{{VCS
	let VCSCommandMapPrefix = '<Leader>s'
	nnoremap <Leader>sx :VCSGotoOriginal!<CR>
	nnoremap <Leader>ss :VCSStatus -q<CR>
"}}}
"{{{Tagbar
	noremap <F8> :TagbarToggle<CR>
	let g:tagbar_autofocus = 1
	let g:tagbar_autoshowtag = 1
	let g:tagbar_singleclick = 1
	let g:tagbar_compact = 1

	let g:tagbar_type_php = {
	    \ 'kinds' : [
	        \ 'i:interfaces',
			\ 'c:classes',
	        \ 'd:constant definitions',
	        \ 'f:functions',
	        \ 'j:javascript functions'
	    \ ]
	\ }
"}}}
"{{{FuzzyFinder
	let g:fuf_modesDisable = []
	let g:fuf_mrufile_maxItem = 400
	let g:fuf_mrucmd_maxItem = 400
	nnoremap <Leader>ff :FufFile<CR>
	nnoremap <Leader>fg :FufBookmarkDir<CR>
	nnoremap <Leader>fh :FufFileWithCurrentBufferDir<CR>
	nnoremap <Leader>fb :FufBuffer<CR>
	nnoremap <Leader>fc :FufCoverageFile<CR>
	nnoremap <Leader>fm :FufMruFile<CR>
	nnoremap <Leader>fn :FufMruFileInCwd<CR>
	nnoremap <Leader>fq :FufQuickfix<CR>
	nnoremap <Leader>fj :FufJumpList<CR>
	nnoremap <Leader>fR :FufRenewCache<CR>
	noremap - :FufBuffer<CR>
"}}}
"{{{SVNDIFF
	noremap <F2> :call Svndiff("prev")<CR>
	noremap <F3> :call Svndiff("next")<CR>
	noremap <F4> :call Svndiff("clear")<CR>
	hi DiffAdd      ctermfg=0 ctermbg=2 guibg='green'
	hi DiffDelete   ctermfg=0 ctermbg=1 guibg='red'
	hi DiffChange   ctermfg=0 ctermbg=3 guibg='yellow'
"}}}
"{{{SHELLEXECUTE in new buffer with :Shell
function! s:ExecuteInShell(command, bang)
	let _ = a:bang != '' ? s:_ : a:command == '' ? '' : join(map(split(a:command), 'expand(v:val)'))
	if (_ != '')
		let s:_ = _
		let bufnr = bufnr('%')
		let winnr = bufwinnr('^' . _ . '$')
		silent! execute  winnr < 0 ? 'new ' . fnameescape(_) : winnr . 'wincmd w'
		setlocal buftype=nowrite bufhidden=wipe nobuflisted noswapfile nowrap number
		silent! :%d
		let message = 'Execute ' . _ . '...'
		call append(0, message)
		echo message
		silent! 2d | resize 1 | redraw
		silent! execute 'silent! %!'. _
		silent! execute 'resize ' . line('$')
		silent! execute 'syntax on'
		silent! execute 'autocmd BufUnload <buffer> execute bufwinnr(' . bufnr . ') . ''wincmd w'''
		silent! execute 'autocmd BufEnter <buffer> execute ''resize '' .  line(''$'')'
		silent! execute 'nnoremap <silent> <buffer> <LocalLeader>r :call <SID>ExecuteInShell(''' . _ . ''', '''')<CR>'
		silent! execute 'nnoremap <silent> <buffer> <LocalLeader>g :execute bufwinnr(' . bufnr . ') . ''wincmd w''<CR>'
		silent! syntax on
	endif
endfunction

command! -complete=shellcmd -nargs=* -bang Shell call s:ExecuteInShell(<q-args>, '<bang>')
command! -complete=shellcmd -nargs=* -bang S call s:ExecuteInShell('svn '.<q-args>, '<bang>')
"}}}
"{{{Showmarks
nnoremap ' :ShowMarksOnce<cr>'
"}}}
"{{{Indent guides 
nnoremap <F10> :IndentGuidesToggle<CR>
"}}}
"{{{Ruby debugger
let g:ruby_debugger_default_script = 'script/rails s'
"}}}
"{{{ cakephp-vim
	nnoremap <Leader>cc :Ccontroller<CR>
	nnoremap <Leader>cm :Cmodel<CR>
	nnoremap <Leader>cv :Cview<CR>
"}}}
"{{{ Window related
noremap <C-k> <C-W>k
noremap <C-j> <C-W>j
noremap <C-h> <C-W>h
noremap <C-l> <C-W>l
noremap <C-x> <C-W>c
"}}}
"{{{ vimwiki
	let g:vimwiki_folding=1
"}}}
"{{{ gist-vim
	let g:gist_open_browser_after_post = 1
"}}}
"{{{ easymotion
	let g:EasyMotion_leader_key = 'q'
"}}}
"{{{ firefox autorefresh
autocmd BufWriteCmd *.html,*.css,*.gtpl,*.ctp,*.js :call Refresh_firefox()
function! Refresh_firefox()
  if &modified
    write
    silent !echo  'vimYo = content.window.pageYOffset;
          \ vimXo = content.window.pageXOffset;
          \ BrowserReload();
          \ content.window.scrollTo(vimXo,vimYo);
          \ repl.quit();'  |
          \ nc -w 1 localhost 4242 2>&1 > /dev/null
  endif
endfunction
"}}}
"{{{ qfixtoggle
noremap <Leader>q :QFix<CR>
"}}}
"{{{ zencoding
let g:user_zen_next_key = '<c-n>'
let g:user_zen_prev_key = '<c-m>'
"}}}

"{{{ zoomwin
	nnoremap <Leader>o :ZoomWin<CR>
"}}}
"{{{ staging - next and previous line with same indent
	nnoremap <M-b> k:call search('^'. matchstr(getline(line('.')+1), '\(\s*\)') .'\S', 'b')<CR>^
	nnoremap <M-f> :call search('^'. matchstr(getline(line('.')), '\(\s*\)') .'\S')<CR>^
"}}}
" vim: foldenable foldmethod=marker foldcolumn=1 foldlevel=0
