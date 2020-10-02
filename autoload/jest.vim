function jest#test_project()
  call luaeval('require("jest").testProject()')
endfunction

function jest#test_file()
  call luaeval('require("jest").testFile()')
endfunction

function jest#test_single()
  call luaeval('require("jest").testSingle()')
endfunction
