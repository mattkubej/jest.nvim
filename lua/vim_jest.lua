-- How to get rid of vim warning?
local vim = vim

local function get_current_file_path()
  return vim.api.nvim_eval('expand("%:p")')
end

local function create_window()
  vim.api.nvim_command('botright vnew')
end

local function focus_last_accessed_window()
  vim.api.nvim_command('wincmd p')
end

local function test_project()
  create_window()
  vim.api.nvim_command('terminal npx jest')
  focus_last_accessed_window()
end

local function test_file()
  local c_file = get_current_file_path()
  create_window()

  -- TODO: abstract jest execution
  local t = {}
  table.insert(t, 'terminal npx jest')
  table.insert(t, ' --runTestsByPath ')
  table.insert(t, c_file)
  table.insert(t, ' --watch')
  local jest_cmd = table.concat(t, '')

  vim.api.nvim_command(jest_cmd)
  focus_last_accessed_window()
end

local function test_single()
  local c_file = get_current_file_path()
  local line = vim.api.nvim_get_current_line()

  local _, _, test_name = string.find(line, "^%s*%a+%(['\"](.+)['\"]")

  -- TODO: add error messaging
  if test_name ~= nil then
    create_window()

    local t = {}
    table.insert(t, 'terminal npx jest')
    table.insert(t, ' --runTestsByPath ')
    table.insert(t, c_file)
    table.insert(t, " -t='")
    table.insert(t, test_name)
    table.insert(t, "' --watch")
    local jest_cmd = table.concat(t, '')

    vim.api.nvim_command(jest_cmd)
    focus_last_accessed_window()
  end
end

return {
  testProject = test_project,
  testFile    = test_file,
  testSingle  = test_single,
}
