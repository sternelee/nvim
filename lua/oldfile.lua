local buf, win, start_win

local function open()
  local path = vim.api.nvim_get_current_line()

  if vim.api.nvim_win_is_valid(start_win) then
    vim.api.nvim_set_current_win(start_win)
    vim.api.nvim_command('edit ' .. path)
  else
    vim.api.nvim_command('leftabove vsplit ' .. path)
    start_win = vim.api.nvim_get_current_win()
  end
end

local function close()
  if win and vim.api.nvim_win_is_valid(win) then
    vim.api.nvim_win_close(win, true)
  end
end

local function open_and_close()
  open()
  close()
end

local function preview()
  open()
  vim.api.nvim_set_current_win(win)
end

local function split(axis)
  local path = vim.api.nvim_get_current_line()

  if vim.api.nvim_win_is_valid(start_win) then
    vim.api.nvim_set_current_win(start_win)
    vim.api.nvim_command(axis ..'split ' .. path)
  else
    vim.api.nvim_command('leftabove ' .. axis..'split ' .. path)
  end

  close()
end

local function open_in_tab()
  local path = vim.api.nvim_get_current_line()

  vim.api.nvim_command('tabnew ' .. path)
  close()
end


local function redraw()
  vim.api.nvim_buf_set_option(buf, 'modifiable', true)
  local items_count =  vim.api.nvim_win_get_height(win) - 1
  local list = {}
  local oldfiles = vim.api.nvim_get_vvar('oldfiles')

  for i = #oldfiles, #oldfiles - items_count, -1 do
    pcall(function()
      local path = vim.api.nvim_call_function('fnamemodify', {oldfiles[i], ':.'})
      table.insert(list, #list + 1, path)
    end)
  end

  vim.api.nvim_buf_set_lines(buf, 0, -1, false, list)
  vim.api.nvim_buf_set_option(buf, 'modifiable', false)
end

local function set_mappings()
  local mappings = {
    q = 'close()',
    ['<cr>'] = 'open_and_close()',
    v = 'split("v")',
    s = 'split("")',
    p = 'preview()',
    t = 'open_in_tab()'
  }

  for k,v in pairs(mappings) do
    vim.api.nvim_buf_set_keymap(buf, 'n', k, ':lua require"nvim-oldfile".'..v..'<cr>', {
        nowait = true, noremap = true, silent = true
      })
  end
end

local function create_win()
  start_win = vim.api.nvim_get_current_win()

  vim.api.nvim_command('botright vnew')
  win = vim.api.nvim_get_current_win()
  buf = vim.api.nvim_get_current_buf()

  vim.api.nvim_buf_set_name(0, 'Oldfiles #' .. buf)

  vim.api.nvim_buf_set_option(0, 'buftype', 'nofile')
  vim.api.nvim_buf_set_option(0, 'swapfile', false)
  vim.api.nvim_buf_set_option(0, 'filetype', 'nvim-oldfile')
  vim.api.nvim_buf_set_option(0, 'bufhidden', 'wipe')

  vim.api.nvim_command('setlocal nowrap')
  vim.api.nvim_command('setlocal cursorline')

  set_mappings()
end

local function oldfiles()
  if win and vim.api.nvim_win_is_valid(win) then
    vim.api.nvim_set_current_win(win)
  else
    create_win()
  end

  redraw()
end

return {
  oldfiles = oldfiles,
  close = close,
  open_and_close = open_and_close,
  preview = preview,
  open_in_tab = open_in_tab,
  split = split
}
