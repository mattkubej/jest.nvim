if exists('g:loaded_jest')
  finish
endif
let g:loaded_jest = 1

command Jest :call jest#test_project()
command JestFile :call jest#test_file()
command JestSingle :call jest#test_single()
