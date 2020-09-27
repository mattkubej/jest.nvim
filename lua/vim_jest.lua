local function jest()
  c_win = vim.api.nvim_get_current_win()

  vim.api.nvim_command('botright vnew')
  win = vim.api.nvim_get_current_win()
  buf = vim.api.nvim_get_current_buf()

  vim.api.nvim_command('terminal npx jest')
  vim.api.nvim_command('wincmd p')
end

return {
  jest = jest
}
