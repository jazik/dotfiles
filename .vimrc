set nocompatible              " be iMproved, required
filetype off                  " required

set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
Plugin 'VundleVim/Vundle.vim'
Plugin 'tpope/vim-fugitive'
Plugin 'jelera/vim-javascript-syntax'
"" Plugin 'pangloss/vim-javascript'
"" Plugin 'nathanaelkane/vim-indent-guides'
"" Plugin 'scrooloose/syntastic'
 
" This does what it says on the tin. It will check your file on open too, not
" just on save.
" " You might not want this, so just leave it out if you don't.
"" let g:syntastic_check_on_open=1

"" Plugin 'Valloric/YouCompleteMe'
 
" These are the tweaks I apply to YCM's config, you don't need them but they
" might help.
" " YCM gives you popups and splits by default that some people might not
" like, so these should tidy it up a bit for you.
"" let g:ycm_add_preview_to_completeopt=0
"" let g:ycm_confirm_extra_conf=0
"" set completeopt-=preview

"" Plugin 'marijnh/tern_for_vim'

call vundle#end()            " required
filetype plugin indent on    " required
