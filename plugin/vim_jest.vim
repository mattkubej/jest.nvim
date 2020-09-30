if exists('g:loaded_vim_jest') | finish | endif

let s:save_cpo = &cpo
set cpo&vim

command! Jest lua require'vim_jest'.testProject()
command! JestFile lua require'vim_jest'.testFile()
command! JestSingle lua require'vim_jest'.testSingle()

let &cpo = s:save_cpo
unlet s:save_cpo

let g:loaded_vim_jest = 1
