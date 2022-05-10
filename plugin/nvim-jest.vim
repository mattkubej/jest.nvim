if exists('g:loaded_nvim_jest')
  finish
endif
let g:loaded_nvim_jest = 1

command Jest :call nvim_jest#test_project()
command JestFile :call nvim_jest#test_file()
command JestSingle :call nvim_jest#test_single()
