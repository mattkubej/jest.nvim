function nvim_jest#test_project()
  call luaeval('require("nvim-jest").test_project()')
endfunction

function nvim_jest#test_file()
  call luaeval('require("nvim-jest").test_file()')
endfunction

function nvim_jest#test_single()
  call luaeval('require("nvim-jest").test_single()')
endfunction
