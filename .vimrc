" ======================================================================================================== "
" SPACE & TABS                                                                                SPACE & TABS "
" ======================================================================================================== "
set tabstop=4		    " number of visual spaces per TAB
set softtabstop=4	    " number of spaces when editing
set shiftwidth=4        " number of spaces when using >>
set expandtab		    " tabs are spaces
set autoindent
set smarttab

" ======================================================================================================== "
" UI CONFIG                                                                                      UI CONFIG "
" ======================================================================================================== "
set number              " show line numbers
set relativenumber      " show relative line numbers
set showcmd		        " show last command in bottom bar
set ruler
set wildmenu            " visual autocomplete for command menu
set showmatch           " highlight matching[{()}]

" ======================================================================================================== "
" LOOK                                                                                                LOOK "
" ======================================================================================================== "
colorscheme darkblue

" ======================================================================================================== "
" CODING                                                                                            CODING "
" ======================================================================================================== "
syntax on

let mapleader = "\<Space>"

" ======================================================================================================== "
" REMAP                                                                                              REMAP "
" ======================================================================================================== "
nnoremap <Leader>w :w<CR>
nnoremap <Leader>q :q!<CR>
nnoremap <Leader>d yyp
inoremap ( ()<left>
inoremap < <><left>
inoremap [ []<left>
inoremap { {}<left>
inoremap " ""<left>
inoremap ' ''<left>

" ========================================================================================== (R)MDR Files "
autocmd Filetype rmd vnoremap <C-B> di****<left><left><Esc>p`<
autocmd Filetype rmd vnoremap <C-I> di**<left><Esc>p`<
autocmd Filetype rmd vnoremap <C-T> di~~~~<left><left><Esc>p`<
autocmd Filetype rmd nnoremap !1 I#<Space><Esc>
autocmd Filetype rmd nnoremap !2 I##<Space><Esc>
autocmd Filetype rmd nnoremap !3 I###<Space><Esc>
autocmd Filetype rmd nnoremap !4 I####<Space><Esc>

" =============================================================================================== C++ CODE "
autocmd Filetype cpp map <F5> :!make<CR>

" MARKDOWN CODE
autocmd Filetype markdown map <F5> :!pandoc<space>-N<space><c-r>%<space>--toc<space>-o<space>a.pdf<CR>

" ============================================================================================ PYTHON CODE "
autocmd Filetype python map <F5> :!python3<space><c-r>%<CR>

augroup Shebang
  autocmd BufNewFile *.py 0put =\"#!/usr/bin/env python3\<nl>\<nl>\"|$
  autocmd BufNewFile *.sh 0put =\"#!/bin/bash\<nl>\<nl>\"|$
augroup END