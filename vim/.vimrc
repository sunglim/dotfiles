"NOTE : to use this .vimrc, you need to install
"TagList, NERDTree, Vundle, FuzzyFinder plugins.

"==================== VIM Set ====================="
set nu
set ai
set ts=2
set sw=2
set expandtab  "tab as space
au Bufenter *.\(c\|cpp\h\)set et
set cindent
set ignorecase
set showmode
set incsearch
set ruler
set showcmd
set smarttab
set hlsearch
set list
syntax enable
"-------------------- VIM Start With --------------"
"au VimEnter * Tlist
"au VimEnter * NERDTree

"==================== Taglist  ===================="
let Tlist_Use_Right_Window=0
let Tlist_Compact_format=1
let Tlist_Enable_Fold_column=0
let Tlist_WinWidth=50
set updatetime=100

"==================== NERDTree ===================="
let NERDTreeWinPos="left"
let NERDTreeQuitOnOpen=1
let g:NERDTRreeChDirMode=2
let NERDTreeWinSize=50
let NERDTreeShowBookmarks=1
let NERDTreeShowHidden=1
let NERDTreeShowFiles=1

"==================== HotKey ======================"
nmap <F3> :Tlist<CR>
nmap <F6> :BufExplorer<CR>
nmap <F8> :NERDTreeFind<CR>
nmap <F9> :NERDTreeToggle<CR>

"This totally depend on the project
nmap <F11> :!find ./hbbtv/ ./launcher/ ./ohtv/ -iname '*.c' -o -iname '*.h' > cscope.files<CR>
   \:!cscope -b -i cscope.files -f cscope.out<CR>
   \:cs reset<CR>


"- replace ctags key with cscope
map <C-_> :cstag <C-R>=expand("<cword>")<CR><CR>
map g<C-]> :cs find 3 <C-R>=expand("<cword>")<CR><CR>
map g<C-\> :cs find 0 <C-R>=expand("<cword>")<CR><CR>
"================== C11 syntax  ==================="
au BufNewFile,BufRead *.cpp set syntax=cpp11

map <leader>fb :FufBuffer<CR>
map <leader>ff :FufFile **/<CR>

set nocompatible               " be iMproved
filetype off                   " required!

set rtp+=~/.vim/bundle/vundle/
call vundle#rc()

" let Vundle manage Vundle
" required!
Bundle 'gmarik/vundle'
" vim-scripts repos
Bundle 'L9'
Bundle 'FuzzyFinder'
Bundle 'a.vim'
Bundle 'fugitive.vim'
Bundle 'taglist.vim'
Bundle 'minibufexpl.vim'
Bundle 'Syntastic'
"snipmate for auto complete
Bundle 'superSnipMate'
"no need to press 'ctrl+n' for autocompletion
Bundle 'AutoComplPop'
"for selecting autocompletion item by pressing tab
Bundle 'SuperTab'
"for FuzzyFinder tab
Bundle 'scrooloose/nerdtree'
" non github repos
Bundle 'git://git.wincent.com/command-t.git'
" ...

filetype plugin indent on     " required!

"================= highlight over than 80 space =========
highlight OverLength ctermbg=red ctermfg=white guibg=#592929
match OverLength /\%81v.\+/


"================== CSCOPE ==================="
if filereadable("./cscope.out")
  cs add ./cscope.out
  set cst
elseif filereadable("./cscope.out")
  cs add ../cscope.out
  set cst
elseif filereadable("./cscope.out")
  cs add ../../cscope.out
  set cst
endif
                                
nmap <C-\>s :cs find s <C-R>=expand("<cword>")<CR><CR>
nmap <C-\>g :cs find g <C-R>=expand("<cword>")<CR><CR>
nmap <C-\>c :cs find c <C-R>=expand("<cword>")<CR><CR>
nmap <C-\>t :cs find t <C-R>=expand("<cword>")<CR><CR>
nmap <C-\>e :cs find e <C-R>=expand("<cword>")<CR><CR>
nmap <C-\>f :cs find f <C-R>=expand("<cfile>")<CR><CR>
nmap <C-\>i :cs find i <C-R>=expand("<cfile>")<CR><CR>
nmap <C-\>d :cs find d <C-R>=expand("<cword>")<CR><CR>

