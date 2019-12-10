syntax off

if !empty($VIM_COLOR)
    color $VIM_COLOR
else
    color hyper-light
endif

execute pathogen#infect()

filetype plugin on

let mapleader=',' " set leader to ,
let g:go_auto_type_info = 0 " vim-go

set nocompatible
set ruler
set encoding=utf-8
set nowrap
set foldmethod=indent
set nofoldenable
set number
set ignorecase
set hlsearch
set textwidth=80
set timeoutlen=1000 ttimeoutlen=0
set splitright
set splitbelow

au BufRead,BufNewFile *.go   set filetype=go textwidth=100
au BufRead,BufNewFile *.erb  set filetype=html
au BufRead,BufNewFile *.hbs  set filetype=html
au BufRead,BufNewFile *.ru   set filetype=ruby
au BufRead,BufNewFile *.cr   set filetype=crystal
au BufRead,BufNewFile *.rs   set filetype=rust
au BufRead,BufNewFile *.json set filetype=javascript
au BufRead,BufNewFile *.yml  set filetype=yaml
au BufRead,BufNewFile *.yaml set filetype=yaml
au BufRead,BufNewFile *.tf   set filetype=terraform
au FileType go nmap <Leader>d <Plug>(go-def)

autocmd Filetype sh         setlocal ts=2 sts=2 sw=2 expandtab
autocmd Filetype html       setlocal ts=2 sts=2 sw=2 expandtab
autocmd Filetype ruby       setlocal ts=2 sts=2 sw=2 expandtab
autocmd Filetype crystal    setlocal ts=2 sts=2 sw=2 expandtab
autocmd Filetype javascript setlocal ts=2 sts=2 sw=2 expandtab
autocmd Filetype python     setlocal ts=4 sts=4 sw=4 expandtab
autocmd Filetype rust       setlocal ts=4 sts=4 sw=4 expandtab
autocmd Filetype go         setlocal ts=4 sts=4 sw=4 noexpandtab
autocmd Filetype yaml       setlocal ts=2 sts=2 sw=2 expandtab
autocmd Filetype terraform  setlocal ts=2 sts=2 sw=2 expandtab
