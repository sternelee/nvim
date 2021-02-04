local api = vim.api
local luv = vim.loop
local open_mode = luv.constants.O_CREAT + luv.constants.O_WRONLY + luv.constants.O_TRUNC

local M = {}
local clipboard = {
  move = {},
  copy = {}
}

local function clear_prompt()
  vim.api.nvim_command('normal :esc<CR>')
end

local function refresh_tree()
  vim.api.nvim_command(":NvimTreeRefresh")
end

local function create_file(file)
  luv.fs_open(file, "w", open_mode, vim.schedule_wrap(function(err, fd)
    if err then
      api.nvim_err_writeln('Could not create file '..file)
    else
      -- FIXME: i don't know why but libuv keeps creating file with executable permissions
      -- this is why we need to chmod to default file permissions
      luv.fs_chmod(file, 420)
      luv.fs_close(fd)
      api.nvim_out_write('File '..file..' was properly created\n')
      refresh_tree()
    end
  end))
end

local function get_num_entries(iter)
  local i = 0
  for _ in iter do
    i = i + 1
  end
  return i
end

function M.create(node)
  if node.name == '..' then return end

  local add_into
  if node.entries ~= nil then
    add_into = node.absolute_path..'/'
  else
    add_into = node.absolute_path:sub(0, -(#node.name + 1))
  end

  local ans = vim.fn.input('Create file '..add_into)
  clear_prompt()
  if not ans or #ans == 0 then return end

  if not ans:match('/') then
    return create_file(add_into..ans)
  end

  -- create a foler for each element until / and create a file when element is not ending with /
  -- if element is ending with / and it's the last element, we need to manually refresh
  local relpath = ''
  local idx = 0
  local num_entries = get_num_entries(ans:gmatch('[^/]+/?'))
  for path in ans:gmatch('[^/]+/?') do
    idx = idx + 1
    relpath = relpath..path
    if relpath:match('.*/$') then
      local success = luv.fs_mkdir(add_into..relpath, 493)
      if not success then
        api.nvim_err_writeln('Could not create folder '..add_into..relpath)
        return
      end
      if idx == num_entries then
        api.nvim_out_write('Folder '..add_into..relpath..' was properly created\n')
        refresh_tree()
      end
    else
      create_file(add_into..relpath)
    end
  end
end

local function clear_buffer(absolute_path)
  for _, buf in pairs(api.nvim_list_bufs()) do
    if api.nvim_buf_get_name(buf) == absolute_path then
      api.nvim_command(':bd! '..buf)
    end
  end
end

local function remove_dir(cwd)
  local handle = luv.fs_scandir(cwd)
  if type(handle) == 'string' then
    return api.nvim_err_writeln(handle)
  end

  while true do
    local name, t = luv.fs_scandir_next(handle)
    if not name then break end

    local new_cwd = cwd..'/'..name
    if t == 'directory' then
      local success = remove_dir(new_cwd)
      if not success then return false end
    else
      local success = luv.fs_unlink(new_cwd)
      if not success then return false end
      clear_buffer(new_cwd)
    end
  end

  return luv.fs_rmdir(cwd)
end

local function do_copy(source, destination)
  local source_stats = luv.fs_stat(source)

  if source_stats and source_stats.type == 'file' then
    return luv.fs_copyfile(source, destination)
  end

  local handle = luv.fs_scandir(source)

  if type(handle) == 'string' then
    return false, handle
  end

  luv.fs_mkdir(destination, source_stats.mode)

  while true do
    local name, _ = luv.fs_scandir_next(handle)
    if not name then break end

    local new_name = source..'/'..name
    local new_destination = destination..'/'..name
    local success, msg = do_copy(new_name, new_destination)
    if not success then return success, msg end
  end

  return true
end

local function do_single_paste(source, dest, action_type, action_fn)
  local dest_stats = luv.fs_stat(dest)
  local should_process = true
  local should_rename = false
  if dest_stats then
    local ans = vim.fn.input(dest..' already exists, overwrite ? y/n/r(ename): ')
    clear_prompt()
    should_process = ans:match('^y')
    should_rename = ans:match('^r')
  end

  if should_rename then
    local new_dest = vim.fn.input('New name: ', dest)
    return do_single_paste(source, new_dest, action_type, action_fn)
  end

  if should_process then
    local success, errmsg = action_fn(source, dest)
    if not success then
      api.nvim_err_writeln('Could not '..action_type..' '..source..' - '..errmsg)
    end
  end
end

local function do_paste(node, action_type, action_fn)
  if node.name == '..' then return end
  local clip = clipboard[action_type]
  if #clip == 0 then return end

  local destination = node.absolute_path
  local stats = luv.fs_stat(destination)
  local is_dir = stats and stats.type == 'directory'

  if not is_dir then
    destination = vim.fn.fnamemodify(destination, ':p:h')
  elseif not node.open then
    destination = vim.fn.fnamemodify(destination, ':p:h:h')
  end

  local msg = #clip..' entries'

  if #clip == 1 then
    msg = clip[1].absolute_path
  end

  local ans = vim.fn.input(action_type..' '..msg..' to '..destination..'? y/n: ')
  clear_prompt()
  if not ans:match('^y') then
    return api.nvim_out_write('Canceled.\n')
  end

  for _, entry in ipairs(clip) do
    local dest = destination..'/'..entry.name
    do_single_paste(entry.absolute_path, dest, action_type, action_fn)
  end

  clipboard[action_type] = {}
  return refresh_tree()
end

local function add_to_clipboard(node, clip)
  if node.name == '..' then return end

  for idx, entry in ipairs(clip) do
    if entry.absolute_path == node.absolute_path then
      table.remove(clip, idx)
      return api.nvim_out_write(node.absolute_path..' removed to clipboard.\n')
    end
  end
  table.insert(clip, node)
  api.nvim_out_write(node.absolute_path..' added to clipboard.\n')
end

function M.remove(node)
  if node.name == '..' then return end

  local ans = vim.fn.input("Remove " ..node.name.. " ? y/n: ")
  clear_prompt()
  if ans:match('^y') then
    if node.entries ~= nil then
      local success = remove_dir(node.absolute_path)
      if not success then
        return api.nvim_err_writeln('Could not remove '..node.name)
      end
      api.nvim_out_write(node.name..' has been removed\n')
    else
      local success = luv.fs_unlink(node.absolute_path)
      if not success then
        return api.nvim_err_writeln('Could not remove '..node.name)
      end
      api.nvim_out_write(node.name..' has been removed\n')
      clear_buffer(node.absolute_path)
    end
    refresh_tree()
  end
end

function M.rename(node)
  if node.name == '..' then return end

  local new_name = vim.fn.input("Rename " ..node.name.. " to ", node.absolute_path)
  clear_prompt()
  if not new_name or #new_name == 0 then return end

  local success = luv.fs_rename(node.absolute_path, new_name)
  if not success then
    return api.nvim_err_writeln('Could not rename '..node.absolute_path..' to '..new_name)
  end
  api.nvim_out_write(node.absolute_path..' ➜ '..new_name..'\n')
  for _, buf in pairs(api.nvim_list_bufs()) do
    if api.nvim_buf_is_loaded(buf) then
      if api.nvim_buf_get_name(buf) == node.absolute_path then
        api.nvim_buf_set_name(buf, new_name)
      end
    end
  end
  refresh_tree()
end

function M.copy(node)
  add_to_clipboard(node, clipboard.copy)
end

function M.cut(node)
  add_to_clipboard(node, clipboard.move)
end

function M.paste(node)
  if clipboard.move[1] ~= nil then
    return do_paste(node, 'move', luv.fs_rename)
  end

  return do_paste(node, 'copy', do_copy)
end

function M.print_clipboard()
  local content = {}
  if #clipboard.move > 0 then
    table.insert(content, 'Cut')
    for _, item in pairs(clipboard.move) do
      table.insert(content, ' * '..item.absolute_path)
    end
  end
  if #clipboard.copy > 0 then
    table.insert(content, 'Copy')
    for _, item in pairs(clipboard.copy) do
      table.insert(content, ' * '..item.absolute_path)
    end
  end

  return api.nvim_out_write(table.concat(content, '\n')..'\n')
end

return M
