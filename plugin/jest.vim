if exists('g:loaded_jest') | finish | endif

let s:save_cpo = &cpo
set cpo&vim

" TODO: require only once
command! Jest lua require'jest'.testProject()
command! JestFile lua require'jest'.testFile()
command! JestSingle lua require'jest'.testSingle()

let &cpo = s:save_cpo
unlet s:save_cpo

let g:loaded_jest = 1
