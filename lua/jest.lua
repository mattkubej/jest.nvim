local function get_current_file_path()
  return vim.api.nvim_eval('expand("%:p")')
end

local function create_window()
  vim.api.nvim_command('botright vnew')
end

local function focus_last_accessed_window()
  vim.api.nvim_command('wincmd p')
end

local function run_jest(args)
  local t = {}
  local cmd = vim.g.jest_cmd or 'npx jest'
  table.insert(t, 'terminal ' .. cmd)

  if args ~= nil then
    for _, v in pairs(args) do
      table.insert(t, v)
    end
  end

  local jest_cmd = table.concat(t, '')
  vim.api.nvim_command(jest_cmd)
end

local function test_project()
  create_window()
  run_jest()
  focus_last_accessed_window()
end

local function test_file()
  local c_file = get_current_file_path()
  create_window()

  local args = {}
  table.insert(args, ' --runTestsByPath ' .. c_file)
  table.insert(args, ' --watch')
  run_jest(args)

  focus_last_accessed_window()
end

local function test_single()
  local c_file = get_current_file_path()
  local line = vim.api.nvim_get_current_line()

  local _, _, test_name = string.find(line, "^%s*%a+%(['\"](.+)['\"]")

  if test_name ~= nil then
    create_window()

    local args = {}
    table.insert(args, ' --runTestsByPath ' .. c_file)
    table.insert(args, " -t='" .. test_name .. "'")
    table.insert(args, " --watch")
    run_jest(args)

    focus_last_accessed_window()
  else
    print('ERR: Could not find test name. Place cursor on line with test name.')
  end
end

return {
  testProject = test_project,
  testFile    = test_file,
  testSingle  = test_single,
}
