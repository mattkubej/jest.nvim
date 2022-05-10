if vim.g.loaded_nvim_jest then
  return
end
vim.g.loaded_nvim_jest = true

require('nvim-jest').setup()

vim.cmd [[
  command! Jest :call nvim_jest#test_project()
  command! JestFile :call nvim_jest#test_file()
  command! JestSingle :call nvim_jest#test_single()
]]
