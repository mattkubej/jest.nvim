local function create_window()
  c_win = vim.api.nvim_get_current_win()

  vim.api.nvim_command('botright vnew')
  win = vim.api.nvim_get_current_win()
  buf = vim.api.nvim_get_current_buf()
end

local function test_project()
  create_window()
  vim.api.nvim_command('terminal npx jest')
  vim.api.nvim_command('wincmd p')
end

local function test_current_file()
  c_file = vim.api.nvim_eval('expand("%:p")')

  create_window()
  vim.api.nvim_command('terminal npx jest --runTestsByPath ' .. c_file .. ' --watch')
  vim.api.nvim_command('wincmd p')
end

local function test_single_test()
  c_file = vim.api.nvim_eval('expand("%:p")')
  line = vim.api.nvim_get_current_line()

  _, _, test_name = string.find(line, "^%s*%a+%(['\"](.+)['\"]")

  if test_name ~= nil then
    create_window()

    local t = {}
    table.insert(t, 'terminal npx jest')
    table.insert(t, ' --runTestsByPath ')
    table.insert(t, c_file)
    table.insert(t, " -t='")
    table.insert(t, test_name)
    table.insert(t, "' --watch")
    jest_cmd = table.concat(t, '')

    vim.api.nvim_command(jest_cmd)
    vim.api.nvim_command('wincmd p')
  end
end

return {
  testProject     = test_project,
  testCurrentFile = test_current_file,
  testSingleTest  = test_single_test,
}
