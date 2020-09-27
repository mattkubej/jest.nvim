if exists('g:loaded_whid') | finish | endif

let s:save_cpo = &cpo
set cpo&vim

command! Jest lua require'vim_jest'.jest()

let &cpo = s:save_cpo
unlet s:save_cpo

let g:loaded_vim_jest = 1
