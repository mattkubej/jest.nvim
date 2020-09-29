if exists('g:loaded_vim_jest') | finish | endif

let s:save_cpo = &cpo
set cpo&vim

command! Jest lua require'vim_jest'.testProject()
command! JestCurrent lua require'vim_jest'.testCurrentFile()
command! JestSingleTest lua require'vim_jest'.testSingleTest()

let &cpo = s:save_cpo
unlet s:save_cpo

let g:loaded_vim_jest = 1
