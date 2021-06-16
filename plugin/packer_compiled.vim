" Automatically generated packer.nvim plugin loader code

if !has('nvim-0.5')
  echohl WarningMsg
  echom "Invalid Neovim version for packer.nvim!"
  echohl None
  finish
endif

packadd packer.nvim

try

lua << END
  local time
  local profile_info
  local should_profile = false
  if should_profile then
    local hrtime = vim.loop.hrtime
    profile_info = {}
    time = function(chunk, start)
      if start then
        profile_info[chunk] = hrtime()
      else
        profile_info[chunk] = (hrtime() - profile_info[chunk]) / 1e6
      end
    end
  else
    time = function(chunk, start) end
  end
  
local function save_profiles(threshold)
  local sorted_times = {}
  for chunk_name, time_taken in pairs(profile_info) do
    sorted_times[#sorted_times + 1] = {chunk_name, time_taken}
  end
  table.sort(sorted_times, function(a, b) return a[2] > b[2] end)
  local results = {}
  for i, elem in ipairs(sorted_times) do
    if not threshold or threshold and elem[2] > threshold then
      results[i] = elem[1] .. ' took ' .. elem[2] .. 'ms'
    end
  end

  _G._packer = _G._packer or {}
  _G._packer.profile_output = results
end

time([[Luarocks path setup]], true)
local package_path_str = "C:\\Users\\stern\\AppData\\Local\\Temp\\nvim\\packer_hererocks\\2.1.0-beta3\\share\\lua\\5.1\\?.lua;C:\\Users\\stern\\AppData\\Local\\Temp\\nvim\\packer_hererocks\\2.1.0-beta3\\share\\lua\\5.1\\?\\init.lua;C:\\Users\\stern\\AppData\\Local\\Temp\\nvim\\packer_hererocks\\2.1.0-beta3\\lib\\luarocks\\rocks-5.1\\?.lua;C:\\Users\\stern\\AppData\\Local\\Temp\\nvim\\packer_hererocks\\2.1.0-beta3\\lib\\luarocks\\rocks-5.1\\?\\init.lua"
local install_cpath_pattern = "C:\\Users\\stern\\AppData\\Local\\Temp\\nvim\\packer_hererocks\\2.1.0-beta3\\lib\\lua\\5.1\\?.so"
if not string.find(package.path, package_path_str, 1, true) then
  package.path = package.path .. ';' .. package_path_str
end

if not string.find(package.cpath, install_cpath_pattern, 1, true) then
  package.cpath = package.cpath .. ';' .. install_cpath_pattern
end

time([[Luarocks path setup]], false)
time([[try_loadstring definition]], true)
local function try_loadstring(s, component, name)
  local success, result = pcall(loadstring(s))
  if not success then
    vim.schedule(function()
      vim.api.nvim_notify('packer.nvim: Error running ' .. component .. ' for ' .. name .. ': ' .. result, vim.log.levels.ERROR, {})
    end)
  end
  return result
end

time([[try_loadstring definition]], false)
time([[Defining packer_plugins]], true)
_G.packer_plugins = {
  ["TrueZen.nvim"] = {
    loaded = true,
    path = "C:\\Users\\stern\\AppData\\Local\\nvim-data\\site\\pack\\packer\\start\\TrueZen.nvim"
  },
  ["barbar.nvim"] = {
    loaded = true,
    path = "C:\\Users\\stern\\AppData\\Local\\nvim-data\\site\\pack\\packer\\start\\barbar.nvim"
  },
  ["compe-tabnine"] = {
    loaded = true,
    path = "C:\\Users\\stern\\AppData\\Local\\nvim-data\\site\\pack\\packer\\start\\compe-tabnine"
  },
  ["dashboard-nvim"] = {
    loaded = true,
    path = "C:\\Users\\stern\\AppData\\Local\\nvim-data\\site\\pack\\packer\\start\\dashboard-nvim"
  },
  ["diffview.nvim"] = {
    loaded = true,
    path = "C:\\Users\\stern\\AppData\\Local\\nvim-data\\site\\pack\\packer\\start\\diffview.nvim"
  },
  fastfold = {
    loaded = true,
    path = "C:\\Users\\stern\\AppData\\Local\\nvim-data\\site\\pack\\packer\\start\\fastfold"
  },
  ["format.nvim"] = {
    loaded = true,
    path = "C:\\Users\\stern\\AppData\\Local\\nvim-data\\site\\pack\\packer\\start\\format.nvim"
  },
  ["friendly-snippets"] = {
    loaded = true,
    path = "C:\\Users\\stern\\AppData\\Local\\nvim-data\\site\\pack\\packer\\start\\friendly-snippets"
  },
  ["gina.vim"] = {
    loaded = true,
    path = "C:\\Users\\stern\\AppData\\Local\\nvim-data\\site\\pack\\packer\\start\\gina.vim"
  },
  ["git-blame.nvim"] = {
    loaded = true,
    path = "C:\\Users\\stern\\AppData\\Local\\nvim-data\\site\\pack\\packer\\start\\git-blame.nvim"
  },
  ["gitsigns.nvim"] = {
    loaded = true,
    path = "C:\\Users\\stern\\AppData\\Local\\nvim-data\\site\\pack\\packer\\start\\gitsigns.nvim"
  },
  ["goyo.vim"] = {
    loaded = false,
    needs_bufread = false,
    path = "C:\\Users\\stern\\AppData\\Local\\nvim-data\\site\\pack\\packer\\opt\\goyo.vim"
  },
  ["hop.nvim"] = {
    loaded = true,
    path = "C:\\Users\\stern\\AppData\\Local\\nvim-data\\site\\pack\\packer\\start\\hop.nvim"
  },
  ["indent-blankline.nvim"] = {
    loaded = true,
    path = "C:\\Users\\stern\\AppData\\Local\\nvim-data\\site\\pack\\packer\\start\\indent-blankline.nvim"
  },
  kommentary = {
    loaded = true,
    path = "C:\\Users\\stern\\AppData\\Local\\nvim-data\\site\\pack\\packer\\start\\kommentary"
  },
  ["lazygit.nvim"] = {
    loaded = true,
    path = "C:\\Users\\stern\\AppData\\Local\\nvim-data\\site\\pack\\packer\\start\\lazygit.nvim"
  },
  ["limelight.vim"] = {
    loaded = true,
    path = "C:\\Users\\stern\\AppData\\Local\\nvim-data\\site\\pack\\packer\\start\\limelight.vim"
  },
  ["lsp-rooter.nvim"] = {
    config = { "\27LJ\2\n<\0\0\3\0\3\0\a6\0\0\0'\2\1\0B\0\2\0029\0\2\0004\2\0\0B\0\2\1K\0\1\0\nsetup\15lsp-rooter\frequire\0" },
    loaded = true,
    path = "C:\\Users\\stern\\AppData\\Local\\nvim-data\\site\\pack\\packer\\start\\lsp-rooter.nvim"
  },
  ["lsp-trouble.nvim"] = {
    loaded = true,
    path = "C:\\Users\\stern\\AppData\\Local\\nvim-data\\site\\pack\\packer\\start\\lsp-trouble.nvim"
  },
  ["lsp_signature.nvim"] = {
    loaded = true,
    path = "C:\\Users\\stern\\AppData\\Local\\nvim-data\\site\\pack\\packer\\start\\lsp_signature.nvim"
  },
  ["lspkind-nvim"] = {
    loaded = true,
    path = "C:\\Users\\stern\\AppData\\Local\\nvim-data\\site\\pack\\packer\\start\\lspkind-nvim"
  },
  ["lspsaga.nvim"] = {
    loaded = true,
    path = "C:\\Users\\stern\\AppData\\Local\\nvim-data\\site\\pack\\packer\\start\\lspsaga.nvim"
  },
  ["lualine.nvim"] = {
    loaded = true,
    path = "C:\\Users\\stern\\AppData\\Local\\nvim-data\\site\\pack\\packer\\start\\lualine.nvim"
  },
  ["markdown-preview.nvim"] = {
    commands = { "MarkdownPreview" },
    loaded = false,
    needs_bufread = false,
    path = "C:\\Users\\stern\\AppData\\Local\\nvim-data\\site\\pack\\packer\\opt\\markdown-preview.nvim"
  },
  ["moonlight.nvim"] = {
    loaded = true,
    path = "C:\\Users\\stern\\AppData\\Local\\nvim-data\\site\\pack\\packer\\start\\moonlight.nvim"
  },
  neogit = {
    loaded = true,
    path = "C:\\Users\\stern\\AppData\\Local\\nvim-data\\site\\pack\\packer\\start\\neogit"
  },
  ["null-ls.nvim"] = {
    loaded = true,
    path = "C:\\Users\\stern\\AppData\\Local\\nvim-data\\site\\pack\\packer\\start\\null-ls.nvim"
  },
  ["nvim-autopairs"] = {
    loaded = true,
    path = "C:\\Users\\stern\\AppData\\Local\\nvim-data\\site\\pack\\packer\\start\\nvim-autopairs"
  },
  ["nvim-colorizer.lua"] = {
    loaded = true,
    path = "C:\\Users\\stern\\AppData\\Local\\nvim-data\\site\\pack\\packer\\start\\nvim-colorizer.lua"
  },
  ["nvim-compe"] = {
    loaded = true,
    path = "C:\\Users\\stern\\AppData\\Local\\nvim-data\\site\\pack\\packer\\start\\nvim-compe"
  },
  ["nvim-cursorline"] = {
    loaded = true,
    path = "C:\\Users\\stern\\AppData\\Local\\nvim-data\\site\\pack\\packer\\start\\nvim-cursorline"
  },
  ["nvim-dap"] = {
    loaded = true,
    path = "C:\\Users\\stern\\AppData\\Local\\nvim-data\\site\\pack\\packer\\start\\nvim-dap"
  },
  ["nvim-dap-ui"] = {
    loaded = true,
    path = "C:\\Users\\stern\\AppData\\Local\\nvim-data\\site\\pack\\packer\\start\\nvim-dap-ui"
  },
  ["nvim-hlslens"] = {
    loaded = true,
    path = "C:\\Users\\stern\\AppData\\Local\\nvim-data\\site\\pack\\packer\\start\\nvim-hlslens"
  },
  ["nvim-lsp-ts-utils"] = {
    loaded = true,
    path = "C:\\Users\\stern\\AppData\\Local\\nvim-data\\site\\pack\\packer\\start\\nvim-lsp-ts-utils"
  },
  ["nvim-lspconfig"] = {
    loaded = true,
    path = "C:\\Users\\stern\\AppData\\Local\\nvim-data\\site\\pack\\packer\\start\\nvim-lspconfig"
  },
  ["nvim-toggleterm.lua"] = {
    loaded = true,
    path = "C:\\Users\\stern\\AppData\\Local\\nvim-data\\site\\pack\\packer\\start\\nvim-toggleterm.lua"
  },
  ["nvim-tree.lua"] = {
    loaded = true,
    path = "C:\\Users\\stern\\AppData\\Local\\nvim-data\\site\\pack\\packer\\start\\nvim-tree.lua"
  },
  ["nvim-treesitter"] = {
    loaded = true,
    path = "C:\\Users\\stern\\AppData\\Local\\nvim-data\\site\\pack\\packer\\start\\nvim-treesitter"
  },
  ["nvim-treesitter-refactor"] = {
    loaded = true,
    path = "C:\\Users\\stern\\AppData\\Local\\nvim-data\\site\\pack\\packer\\start\\nvim-treesitter-refactor"
  },
  ["nvim-treesitter-textobjects"] = {
    loaded = true,
    path = "C:\\Users\\stern\\AppData\\Local\\nvim-data\\site\\pack\\packer\\start\\nvim-treesitter-textobjects"
  },
  ["nvim-ts-rainbow"] = {
    loaded = true,
    path = "C:\\Users\\stern\\AppData\\Local\\nvim-data\\site\\pack\\packer\\start\\nvim-ts-rainbow"
  },
  ["nvim-web-devicons"] = {
    loaded = true,
    path = "C:\\Users\\stern\\AppData\\Local\\nvim-data\\site\\pack\\packer\\start\\nvim-web-devicons"
  },
  ["packer.nvim"] = {
    loaded = true,
    path = "C:\\Users\\stern\\AppData\\Local\\nvim-data\\site\\pack\\packer\\start\\packer.nvim"
  },
  playground = {
    loaded = true,
    path = "C:\\Users\\stern\\AppData\\Local\\nvim-data\\site\\pack\\packer\\start\\playground"
  },
  ["plenary.nvim"] = {
    loaded = true,
    path = "C:\\Users\\stern\\AppData\\Local\\nvim-data\\site\\pack\\packer\\start\\plenary.nvim"
  },
  ["popup.nvim"] = {
    loaded = true,
    path = "C:\\Users\\stern\\AppData\\Local\\nvim-data\\site\\pack\\packer\\start\\popup.nvim"
  },
  ["rest.nvim"] = {
    loaded = true,
    path = "C:\\Users\\stern\\AppData\\Local\\nvim-data\\site\\pack\\packer\\start\\rest.nvim"
  },
  ["sql.nvim"] = {
    loaded = true,
    path = "C:\\Users\\stern\\AppData\\Local\\nvim-data\\site\\pack\\packer\\start\\sql.nvim"
  },
  ["symbols-outline.nvim"] = {
    loaded = true,
    path = "C:\\Users\\stern\\AppData\\Local\\nvim-data\\site\\pack\\packer\\start\\symbols-outline.nvim"
  },
  ["telescope-bookmarks.nvim"] = {
    config = { "\27LJ\2\nN\0\0\3\0\4\0\a6\0\0\0'\2\1\0B\0\2\0029\0\2\0'\2\3\0B\0\2\1K\0\1\0\14bookmarks\19load_extension\14telescope\frequire\0" },
    loaded = true,
    path = "C:\\Users\\stern\\AppData\\Local\\nvim-data\\site\\pack\\packer\\start\\telescope-bookmarks.nvim"
  },
  ["telescope-cheat.nvim"] = {
    config = { "\27LJ\2\nJ\0\0\3\0\4\0\a6\0\0\0'\2\1\0B\0\2\0029\0\2\0'\2\3\0B\0\2\1K\0\1\0\ncheat\19load_extension\14telescope\frequire\0" },
    loaded = true,
    path = "C:\\Users\\stern\\AppData\\Local\\nvim-data\\site\\pack\\packer\\start\\telescope-cheat.nvim"
  },
  ["telescope-dap.nvim"] = {
    config = { "\27LJ\2\nH\0\0\3\0\4\0\a6\0\0\0'\2\1\0B\0\2\0029\0\2\0'\2\3\0B\0\2\1K\0\1\0\bdap\19load_extension\14telescope\frequire\0" },
    loaded = true,
    path = "C:\\Users\\stern\\AppData\\Local\\nvim-data\\site\\pack\\packer\\start\\telescope-dap.nvim"
  },
  ["telescope-media-files.nvim"] = {
    config = { "\27LJ\2\nP\0\0\3\0\4\0\b6\0\0\0'\2\1\0B\0\2\0029\0\2\0009\0\3\0009\0\3\0B\0\1\1K\0\1\0\16media_files\15extensions\14telescope\frequire\0" },
    loaded = true,
    path = "C:\\Users\\stern\\AppData\\Local\\nvim-data\\site\\pack\\packer\\start\\telescope-media-files.nvim"
  },
  ["telescope-project.nvim"] = {
    config = { "\27LJ\2\nL\0\0\3\0\4\0\a6\0\0\0'\2\1\0B\0\2\0029\0\2\0'\2\3\0B\0\2\1K\0\1\0\fproject\19load_extension\14telescope\frequire\0" },
    loaded = true,
    path = "C:\\Users\\stern\\AppData\\Local\\nvim-data\\site\\pack\\packer\\start\\telescope-project.nvim"
  },
  ["telescope.nvim"] = {
    loaded = true,
    path = "C:\\Users\\stern\\AppData\\Local\\nvim-data\\site\\pack\\packer\\start\\telescope.nvim"
  },
  ["todo-comments.nvim"] = {
    config = { "\27LJ\2\n?\0\0\3\0\3\0\a6\0\0\0'\2\1\0B\0\2\0029\0\2\0004\2\0\0B\0\2\1K\0\1\0\nsetup\18todo-comments\frequire\0" },
    loaded = true,
    path = "C:\\Users\\stern\\AppData\\Local\\nvim-data\\site\\pack\\packer\\start\\todo-comments.nvim"
  },
  ["vim-be-good"] = {
    loaded = true,
    path = "C:\\Users\\stern\\AppData\\Local\\nvim-data\\site\\pack\\packer\\start\\vim-be-good"
  },
  ["vim-better-whitespace"] = {
    loaded = true,
    path = "C:\\Users\\stern\\AppData\\Local\\nvim-data\\site\\pack\\packer\\start\\vim-better-whitespace"
  },
  ["vim-closetag"] = {
    loaded = true,
    path = "C:\\Users\\stern\\AppData\\Local\\nvim-data\\site\\pack\\packer\\start\\vim-closetag"
  },
  ["vim-eunuch"] = {
    loaded = true,
    path = "C:\\Users\\stern\\AppData\\Local\\nvim-data\\site\\pack\\packer\\start\\vim-eunuch"
  },
  ["vim-expand-region"] = {
    loaded = true,
    path = "C:\\Users\\stern\\AppData\\Local\\nvim-data\\site\\pack\\packer\\start\\vim-expand-region"
  },
  ["vim-markdown"] = {
    loaded = true,
    path = "C:\\Users\\stern\\AppData\\Local\\nvim-data\\site\\pack\\packer\\start\\vim-markdown"
  },
  ["vim-matrix-screensaver"] = {
    commands = { "Matrix" },
    loaded = false,
    needs_bufread = false,
    path = "C:\\Users\\stern\\AppData\\Local\\nvim-data\\site\\pack\\packer\\opt\\vim-matrix-screensaver"
  },
  ["vim-move"] = {
    loaded = true,
    path = "C:\\Users\\stern\\AppData\\Local\\nvim-data\\site\\pack\\packer\\start\\vim-move"
  },
  ["vim-peekaboo"] = {
    loaded = true,
    path = "C:\\Users\\stern\\AppData\\Local\\nvim-data\\site\\pack\\packer\\start\\vim-peekaboo"
  },
  ["vim-repeat"] = {
    loaded = true,
    path = "C:\\Users\\stern\\AppData\\Local\\nvim-data\\site\\pack\\packer\\start\\vim-repeat"
  },
  ["vim-startuptime"] = {
    loaded = true,
    path = "C:\\Users\\stern\\AppData\\Local\\nvim-data\\site\\pack\\packer\\start\\vim-startuptime"
  },
  ["vim-surround"] = {
    loaded = true,
    path = "C:\\Users\\stern\\AppData\\Local\\nvim-data\\site\\pack\\packer\\start\\vim-surround"
  },
  ["vim-translator"] = {
    loaded = true,
    path = "C:\\Users\\stern\\AppData\\Local\\nvim-data\\site\\pack\\packer\\start\\vim-translator"
  },
  ["vim-visual-multi"] = {
    loaded = true,
    path = "C:\\Users\\stern\\AppData\\Local\\nvim-data\\site\\pack\\packer\\start\\vim-visual-multi"
  },
  ["vim-vsnip"] = {
    loaded = true,
    path = "C:\\Users\\stern\\AppData\\Local\\nvim-data\\site\\pack\\packer\\start\\vim-vsnip"
  },
  ["vim-vsnip-integ"] = {
    loaded = true,
    path = "C:\\Users\\stern\\AppData\\Local\\nvim-data\\site\\pack\\packer\\start\\vim-vsnip-integ"
  },
  ["which-key.nvim"] = {
    config = { "\27LJ\2\n;\0\0\3\0\3\0\a6\0\0\0'\2\1\0B\0\2\0029\0\2\0004\2\0\0B\0\2\1K\0\1\0\nsetup\14which-key\frequire\0" },
    loaded = true,
    path = "C:\\Users\\stern\\AppData\\Local\\nvim-data\\site\\pack\\packer\\start\\which-key.nvim"
  }
}

time([[Defining packer_plugins]], false)
-- Config for: lsp-rooter.nvim
time([[Config for lsp-rooter.nvim]], true)
try_loadstring("\27LJ\2\n<\0\0\3\0\3\0\a6\0\0\0'\2\1\0B\0\2\0029\0\2\0004\2\0\0B\0\2\1K\0\1\0\nsetup\15lsp-rooter\frequire\0", "config", "lsp-rooter.nvim")
time([[Config for lsp-rooter.nvim]], false)
-- Config for: telescope-project.nvim
time([[Config for telescope-project.nvim]], true)
try_loadstring("\27LJ\2\nL\0\0\3\0\4\0\a6\0\0\0'\2\1\0B\0\2\0029\0\2\0'\2\3\0B\0\2\1K\0\1\0\fproject\19load_extension\14telescope\frequire\0", "config", "telescope-project.nvim")
time([[Config for telescope-project.nvim]], false)
-- Config for: telescope-cheat.nvim
time([[Config for telescope-cheat.nvim]], true)
try_loadstring("\27LJ\2\nJ\0\0\3\0\4\0\a6\0\0\0'\2\1\0B\0\2\0029\0\2\0'\2\3\0B\0\2\1K\0\1\0\ncheat\19load_extension\14telescope\frequire\0", "config", "telescope-cheat.nvim")
time([[Config for telescope-cheat.nvim]], false)
-- Config for: telescope-media-files.nvim
time([[Config for telescope-media-files.nvim]], true)
try_loadstring("\27LJ\2\nP\0\0\3\0\4\0\b6\0\0\0'\2\1\0B\0\2\0029\0\2\0009\0\3\0009\0\3\0B\0\1\1K\0\1\0\16media_files\15extensions\14telescope\frequire\0", "config", "telescope-media-files.nvim")
time([[Config for telescope-media-files.nvim]], false)
-- Config for: which-key.nvim
time([[Config for which-key.nvim]], true)
try_loadstring("\27LJ\2\n;\0\0\3\0\3\0\a6\0\0\0'\2\1\0B\0\2\0029\0\2\0004\2\0\0B\0\2\1K\0\1\0\nsetup\14which-key\frequire\0", "config", "which-key.nvim")
time([[Config for which-key.nvim]], false)
-- Config for: telescope-dap.nvim
time([[Config for telescope-dap.nvim]], true)
try_loadstring("\27LJ\2\nH\0\0\3\0\4\0\a6\0\0\0'\2\1\0B\0\2\0029\0\2\0'\2\3\0B\0\2\1K\0\1\0\bdap\19load_extension\14telescope\frequire\0", "config", "telescope-dap.nvim")
time([[Config for telescope-dap.nvim]], false)
-- Config for: todo-comments.nvim
time([[Config for todo-comments.nvim]], true)
try_loadstring("\27LJ\2\n?\0\0\3\0\3\0\a6\0\0\0'\2\1\0B\0\2\0029\0\2\0004\2\0\0B\0\2\1K\0\1\0\nsetup\18todo-comments\frequire\0", "config", "todo-comments.nvim")
time([[Config for todo-comments.nvim]], false)
-- Config for: telescope-bookmarks.nvim
time([[Config for telescope-bookmarks.nvim]], true)
try_loadstring("\27LJ\2\nN\0\0\3\0\4\0\a6\0\0\0'\2\1\0B\0\2\0029\0\2\0'\2\3\0B\0\2\1K\0\1\0\14bookmarks\19load_extension\14telescope\frequire\0", "config", "telescope-bookmarks.nvim")
time([[Config for telescope-bookmarks.nvim]], false)

-- Command lazy-loads
time([[Defining lazy-load commands]], true)
vim.cmd [[command! -nargs=* -range -bang -complete=file MarkdownPreview lua require("packer.load")({'markdown-preview.nvim'}, { cmd = "MarkdownPreview", l1 = <line1>, l2 = <line2>, bang = <q-bang>, args = <q-args> }, _G.packer_plugins)]]
vim.cmd [[command! -nargs=* -range -bang -complete=file Matrix lua require("packer.load")({'vim-matrix-screensaver'}, { cmd = "Matrix", l1 = <line1>, l2 = <line2>, bang = <q-bang>, args = <q-args> }, _G.packer_plugins)]]
time([[Defining lazy-load commands]], false)

vim.cmd [[augroup packer_load_aucmds]]
vim.cmd [[au!]]
  -- Filetype lazy-loads
time([[Defining lazy-load filetype autocommands]], true)
vim.cmd [[au FileType markdown ++once lua require("packer.load")({'goyo.vim'}, { ft = "markdown" }, _G.packer_plugins)]]
time([[Defining lazy-load filetype autocommands]], false)
vim.cmd("augroup END")
if should_profile then save_profiles() end

END

catch
  echohl ErrorMsg
  echom "Error in packer_compiled: " .. v:exception
  echom "Please check your config for correctness"
  echohl None
endtry
