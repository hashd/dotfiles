set nocompatible    " be iMproved, required
filetype off        " required
set encoding=utf-8
set t_Co=256        " set 256 colors mode

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
if filereadable(expand("~/.vim/settings/vimrc.bundles"))
  source ~/.vim/settings/vimrc.bundles
endif
call vundle#end()

" load any local settings if available
if filereadable($HOME . "/.vim/settings/vimrc.local")
  source ~/.vim/settings/vimrc.local
endif

" load any local key mappings if available
if filereadable(expand("~/.vim/settings/vimrc.mappings"))
  source ~/.vim/settings/vimrc.mappings
endif

" load custom functions if available
if filereadable(expand("~/.vim/settings/vimrc.custom"))
    source ~/.vim/settings/vimrc.custom
endif

let g:syntastic_check_on_open=1
set t_ut=
syntax on
filetype plugin indent on
