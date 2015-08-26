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
nmap <F11> :call CommitTemplate()<CR>

"This totally depend on the project
"nmap <F11> :!find ./hbbtv/ ./launcher/ ./ohtv/ -iname '*.c' -o -iname '*.h' > cscope.files<CR>
"   \:!cscope -b -i cscope.files -f cscope.out<CR>
"   \:cs reset<CR>


"- replace ctags key with cscope
map <C-_> :cstag <C-R>=expand("<cword>")<CR><CR>
map g<C-]> :cs find 3 <C-R>=expand("<cword>")<CR><CR>
map g<C-\> :cs find 0 <C-R>=expand("<cword>")<CR><CR>
"================== C11 syntax  ==================="
au BufNewFile,BufRead *.cpp set syntax=cpp11

map <leader>fb :FufBuffer<CR>
map <leader>ff :FufFile **/<CR>

set nocompatible              " be iMproved, required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

" let Vundle manage Vundle, required
Plugin 'gmarik/Vundle.vim'

Plugin 'tpope/vim-fugitive'
Plugin 'L9'
Plugin 'git://git.wincent.com/command-t.git'
Plugin 'rstacruz/sparkup', {'rtp': 'vim/'}
Plugin 'user/L9', {'name': 'newL9'}

Plugin 'FuzzyFinder'
Plugin 'a.vim'
Plugin 'fugitive.vim'
Plugin 'taglist.vim'
Plugin 'minibufexpl.vim'
Plugin 'Syntastic'
"snipmate for auto complete
Plugin 'superSnipMate'
"no need to press 'ctrl+n' for autocompletion
Plugin 'AutoComplPop'
"for selecting autocompletion item by pressing tab
Plugin 'SuperTab'
"for FuzzyFinder tab
Plugin 'scrooloose/nerdtree'

Plugin 'kien/ctrlp.vim'

call vundle#end()

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

function! CommitTemplate()
  r ~/work/program_store/dotfiles/vim/template.txt
endfunction
