" curl -fLo ~/.vim/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

call plug#begin()

Plug 'mtdl9/vim-log-highlighting'
Plug 'scrooloose/nerdtree'
Plug 'Valloric/YouCompleteMe', { 'commit': 'd2abd1594f228de79a05257fc5d4fca5c9a7ead3' }
Plug 'ctrlpvim/ctrlp.vim'
Plug 'itchyny/lightline.vim'
Plug 'editorconfig/editorconfig-vim'
Plug 'dyng/ctrlsf.vim'
Plug 'flazz/vim-colorschemes'
Plug 'cstrahan/vim-capnp'
Plug 'octol/vim-cpp-enhanced-highlight'

call plug#end()
filetype indent off

"Tab size"
set ts=4
set expandtab
set sw=4
set softtabstop=4
set shiftwidth=4

autocmd Filetype cpp setlocal expandtab ts=2 softtabstop=2 shiftwidth=2
autocmd Filetype c setlocal expandtab ts=2 softtabstop=2 shiftwidth=2
autocmd Filetype cuda setlocal expandtab ts=2 softtabstop=2 shiftwidth=2
autocmd Filetype sh setlocal expandtab ts=2 softtabstop=2 shiftwidth=2
autocmd FileType javascript,html,css setlocal expandtab ts=2 softtabstop=2 shiftwidth=2

set nu
set autoindent
set ai
set encoding=utf-8
syntax on
set hlsearch
set ruler
set term=xterm-256color
"set cursorline
colorscheme molokai
"let g:rehash256 = 1
set backspace=indent,eol,start
set laststatus=2
set scrolloff=10
set incsearch
inoremap jh <Esc>

autocmd BufRead,BufNewFile *.c,*.h set smartindent

highlight ExtraWhitespace ctermbg=red guibg=red
autocmd BufWinEnter * match ExtraWhitespace /\s\+$/
autocmd InsertEnter * match ExtraWhitespace //
autocmd InsertLeave * match ExtraWhitespace /\s\+$/
if version >= 702
  autocmd BufWinLeave * call clearmatches()
  end

"Remove trailing whitespace
autocmd BufWritePre *.py,*.cpp,*.c,*.cc,*.h,*.hpp,*.cu,*.cuh :%s/\s\+$//e

"Remove tab
autocmd BufWritePre *.py :%s/\t/    /e

"Fix python indent
autocmd FileType python setlocal et cinwords=if,elif,else,for,while,try,except,finally,def,class

"line length limit"
au BufWinEnter *.py,*.cpp,*.c,*.cc,*.h,*.hpp,*.cu,*.cuh let w:m1=matchadd('Search', '\%<81v.\%>79v', -1)
au BufWinEnter *.py,*.cpp,*.c,*.cc,*.h,*.hpp,*.cu,*.cuh let w:m2=matchadd('ErrorMsg', '\%>80v.\+', -1)

"Tab highlighting"
function! HiTabs()
    syntax match TAB /\t/
    hi TAB ctermbg=blue ctermfg=red
endfunction
au BufEnter,BufRead * call HiTabs()

"nerdtree"
"autocmd VimEnter * NERDTree
cabbrev nt NERDTree
map <C-o> :NERDTreeToggle<CR>
let NERDTreeIgnore = ['\.pyc$', '\.swp$']

"youcompleteme"
let g:ycm_autoclose_preview_window_after_completion = 1
set completeopt-=preview

"ctrlp"
let g:ctrlp_prompt_mappings = { 'PrtExit()': ['<esc>'] }
let g:ctrlp_working_path_mode = 0

"ctrlsf"
cabbrev cs CtrlSF

augroup vimrc_todo
    au!
    au Syntax * syn match MyTodo /\v<(FIXME|NOTE|TODO|HACK|OPTIMIZE|XXX)/
          \ containedin=.*Comment,vimCommentTitle
augroup END
hi def link MyTodo Todo
