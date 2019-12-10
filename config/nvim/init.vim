syntax off

if !empty($VIM_COLOR)
    color $VIM_COLOR
else
    color hyper-light
endif

let mapleader=',' " set leader to ,

"set nocompatible
"set ruler
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
"set packpath=~/.config/nvim/pack/plugins/start
"set runtimepath=~/.config/nvim/pack/plugins/start
set packpath^=~/.config/nvim/pack/plugins/start

au BufRead,BufNewFile *.go   set filetype=go textwidth=100
au BufRead,BufNewFile *.ru   set filetype=ruby
au BufRead,BufNewFile *.rb   set filetype=ruby
au BufRead,BufNewFile *.json set filetype=javascript
au BufRead,BufNewFile *.yml  set filetype=yaml
au BufRead,BufNewFile *.yaml set filetype=yaml
au BufRead,BufNewFile *.tf   set filetype=terraform
"au FileType go nmap <Leader>d <Plug>(go-def)
"
autocmd Filetype sh         setlocal ts=2 sts=2 sw=2 expandtab
autocmd Filetype html       setlocal ts=2 sts=2 sw=2 expandtab
autocmd Filetype ruby       setlocal ts=2 sts=2 sw=2 expandtab
autocmd Filetype crystal    setlocal ts=2 sts=2 sw=2 expandtab
autocmd Filetype javascript setlocal ts=2 sts=2 sw=2 expandtab
autocmd Filetype python     setlocal ts=4 sts=4 sw=4 expandtab
autocmd Filetype go         setlocal ts=4 sts=4 sw=4 noexpandtab
autocmd Filetype yaml       setlocal ts=2 sts=2 sw=2 expandtab
autocmd Filetype terraform  setlocal ts=2 sts=2 sw=2 expandtab

let g:prettier#autoformat = 0
autocmd BufWritePre *.js,*.jsx,*.mjs,*.ts,*.tsx,*.css,*.less,*.scss,*.json,*.graphql,*.md,*.vue,*.yaml,*.html PrettierAsync
