set nocompatible    " be iMproved, required
filetype off        " required
set t_Co=256        " set 256 colors mode

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
if filereadable(expand("~/.vimrc.bundles"))
  source ~/.vimrc.bundles
endif
call vundle#end()

" load any local settings if available
if filereadable($HOME . "/.vimrc.local")
  source ~/.vimrc.local
endif

" load any local key mappings if available
if filereadable(expand("~/.vimrc.mappings"))
  source ~/.vimrc.mappings
endif

" load custom functions if available
if filereadable(expand("~/.vimrc.custom"))
    source ~/.vimrc.custom
endif

let g:syntastic_check_on_open=1
set t_ut=
filetype plugin indent on
