"Vundle starts"

set nocompatible
filetype off                  " required
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'

Plugin 'scrooloose/nerdtree'
Plugin 'nathanaelkane/vim-indent-guides'
Plugin 'dyng/ctrlsf.vim'
Plugin 'Valloric/YouCompleteMe'
Plugin 'ctrlpvim/ctrlp.vim'

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
set smartindent

" for html/rb files, 2 spaces
autocmd Filetype html setlocal ts=2 sw=2 expandtab
autocmd Filetype ruby setlocal ts=2 sw=2 expandtab

" for js/coffee/jade files, 4 spaces
autocmd Filetype javascript setlocal ts=2 sw=2 sts=0 expandtab
autocmd Filetype coffeescript setlocal ts=2 sw=2 sts=0 expandtab
autocmd Filetype jade setlocal ts=2 sw=2 sts=0 expandtab

" for c/cpp files, 2 spaces
autocmd Filetype cpp setlocal ts=2 sw=2 sts=0 expandtab
autocmd Filetype c setlocal ts=2 sw=2 sts=0 expandtab

set nu
set autoindent
set ai
set encoding=utf-8
syntax on
set hlsearch
set ruler
set term=xterm-256color
colorscheme molokai
let g:rehash256 = 1
set backspace=indent,eol,start

autocmd BufRead,BufNewFile *.c,*.h set smartindent

highlight ExtraWhitespace ctermbg=red guibg=red
autocmd BufWinEnter * match ExtraWhitespace /\s\+$/
autocmd InsertEnter * match ExtraWhitespace //
autocmd InsertLeave * match ExtraWhitespace /\s\+$/
if version >= 702
  autocmd BufWinLeave * call clearmatches()
  end

"Remove trailing whitespace
autocmd BufWritePre *.py,*.txt,*.cpp,*.c :%s/\s\+$//e

"Remove tab
autocmd BufWritePre *.py :%s/\t/    /e

"line length limit"
au BufWinEnter *.py,*.js,*.c let w:m1=matchadd('Search', '\%<81v.\%>79v', -1)
au BufWinEnter *.py,*.js,*.c let w:m2=matchadd('ErrorMsg', '\%>80v.\+', -1)

"Tab highlighting"
function! HiTabs()
    syntax match TAB /\t/
    hi TAB ctermbg=blue ctermfg=red
endfunction
au BufEnter,BufRead * call HiTabs()

"nerdtree"
"autocmd VimEnter * NERDTree
cabbrev nt NERDTree
let NERDTreeIgnore = ['\.pyc$', '\.swp$']

"indent guide"
let g:indent_guides_guide_size = 1
let g:indent_guides_start_level = 2

"ctrlsf"
let g:ctrlsf_ackprg = 'ag'
cabbrev cs CtrlSF

"youcompleteme"
let g:ycm_autoclose_preview_window_after_completion = 1
set completeopt-=preview

