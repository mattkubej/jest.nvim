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

return {
  testProject     = test_project,
  testCurrentFile = test_current_file,
}
