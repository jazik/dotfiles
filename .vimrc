set nocompatible              " be iMproved, required
filetype off                  " required
set tabstop=8 softtabstop=0 expandtab shiftwidth=4 smarttab

set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
Plugin 'VundleVim/Vundle.vim'
Plugin 'tpope/vim-fugitive'
Plugin 'jelera/vim-javascript-syntax'
Plugin 'scrooloose/nerdtree'
"" Plugin 'pangloss/vim-javascript'
"" Plugin 'nathanaelkane/vim-indent-guides'
"" Plugin 'scrooloose/syntastic'

" https://medium.com/@huntie/10-essential-vim-plugins-for-2018-39957190b7a9
Plugin 'junegunn/fzf'
set rtp+=/usr/bin
Plugin 'junegunn/fzf.vim'
Plugin 'itchyny/lightline'
Plugin 'airblade/vim-gitgutter'
Plugin 'w0rp/ale'
 
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
