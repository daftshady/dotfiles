"Vundle starts"

set nocompatible
filetype off                  " required
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'

Plugin 'scrooloose/nerdtree'
Plugin 'Valloric/YouCompleteMe'
Plugin 'ctrlpvim/ctrlp.vim'
Plugin 'Yggdroot/indentLine'
Plugin 'itchyny/lightline.vim'
Plugin 'editorconfig/editorconfig-vim'
" sudo apt-get install ack-grep "
Plugin 'dyng/ctrlsf.vim'
Plugin 'flazz/vim-colorschemes'
Plugin 'cstrahan/vim-capnp'
Plugin 'octol/vim-cpp-enhanced-highlight'

" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin on

"Vundle ends"

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
autocmd FileType javascript setlocal expandtab ts=2 softtabstop=2 shiftwidth=2

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
