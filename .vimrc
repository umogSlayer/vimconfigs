set background=dark
set nocp
set smartindent
filetype plugin on

imap <C-K><C-K> <ESC>,c i
vmap <C-K><C-K> ,c 
nmap <C-K><C-K> ,c 
vmap <C-K><C-L> ,cc

autocmd FileType cmake set omnifunc=cmakecomplete#Complete

set foldenable
set foldmethod=syntax
set foldcolumn=2
set foldlevel=1

set noexpandtab
set shiftwidth=4
set tabstop=4
set incsearch
set hlsearch

" let g:ycm_min_num_of_chars_for_completion = 99
" let g:ycm_collect_identifiers_from_tags_files = 1

command SetGLSLFileType call SetGLSLFileType()
function SetGLSLFileType()
  for item in getline(1,10)
    if item =~ "#version 400"
      execute ':set filetype=glsl400'
      break
    elseif item =~ "#version 330"
      execute ':set filetype=glsl330'
      break
    else
      execute ':set filetype=glsl330'
      break
    endif
  endfor
endfunction
au BufNewFile,BufRead *.frag,*.vert,*.fp,*.vp,*.glsl SetGLSLFileType
if has('gui_running')
  set guifont=DejaVu\ Sans\ Mono\ 10
endif

set makeprg=env\ LANG=en_US.UTF8\ make

filetype off

call pathogen#infect()
call pathogen#helptags()

set fileencodings=ucs-bom,utf-8,default,cp1251,latin1

au BufNewFile,BufRead *.hqt setf cpp

filetype plugin indent on
syntax on

" highlight
autocmd ColorScheme * highlight MyExtraWhitespace ctermbg=red guibg=lightred
highlight MyExtraWhitespace ctermbg=red guibg=red
match MyExtraWhitespace /\s\+$/
autocmd BufWinEnter * match MyExtraWhitespace /\s\+$/
autocmd InsertEnter * match MyExtraWhitespace /\s\+\%#\@<!$/
autocmd InsertLeave * match MyExtraWhitespace /\s\+$/
autocmd BufWinLeave * call clearmatches()

" visualize whitespace
set listchars=tab:>-,trail:~,extends:>,precedes:<
set list
autocmd BufWinEnter * set list

nmap <F8> :TagbarToggle<CR>
map <C-P> \t
let g:CommandTWildIgnore=&wildignore . ",**/boost/**,**/thirdparty/**,**/out_*/**,**/android/**"

set grepprg=ag\ --vimgrep\ $*
set grepformat=%f:%l:%c:%m

let g:load_doxygen_syntax=1

" rtags bindings
let g:rtagsUseDefaultMappings = 0
