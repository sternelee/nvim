--make life easier
local cmd = vim.cmd
local g = vim.g
local fn = vim.fn
local execute = vim.api.nvim_command
local nvim_exec = vim.api.nvim_exec
local remap = vim.api.nvim_set_keymap
--gui
g.neovide_fullscreen = true
g.neovide_cursor_vfx_mode = "pixiedust"
nvim_exec([[set guifont=VictorMono\ NF:h16]], false)
--Install packer
local install_path = fn.stdpath('data') .. '/site/pack/packer/start/packer.nvim'
if fn.empty(fn.glob(install_path)) > 0 then
  execute('!git clone https://github.com/wbthomason/packer.nvim '.. install_path)
end
-- https://github.com/rockerBOO/awesome-neovim
--setup packer
require('packer').startup(function()
  use 'wbthomason/packer.nvim'
  use 'nvim-lua/plenary.nvim'
  -- 状态栏
  use {'hoob3rt/lualine.nvim', requires = {'kyazdani42/nvim-web-devicons', opt = true}}
  use 'ryanoasis/vim-devicons'
  use 'romgrk/barbar.nvim'
  use 'kyazdani42/nvim-tree.lua'
  use 'glepnir/dashboard-nvim'
  -- git相关
  use 'lewis6991/gitsigns.nvim'
  use 'lambdalisue/gina.vim'
  use 'f-person/git-blame.nvim' -- 显示git message
  -- 语法高亮
  use { 'nvim-treesitter/nvim-treesitter', run = ':TSUpdate' }
  use  'nvim-treesitter/nvim-treesitter-textobjects'
  use 'nvim-treesitter/nvim-treesitter-refactor'
  use 'nvim-treesitter/playground'
  use 'junegunn/limelight.vim'
  use 'norcalli/nvim-colorizer.lua' -- 色值高亮
  use 'shaunsingh/moonlight.nvim' -- theme
  use 'savq/melange'
  use 'sunjon/shade.nvim' -- 高亮当前tab窗口
  -- 导航finder操作
  use 'mg979/vim-visual-multi'
  use 'phaazon/hop.nvim'
  use {'liuchengxu/vim-clap', run = ':Clap install-binary'}
  use {'nvim-telescope/telescope.nvim', requires = {{'nvim-lua/popup.nvim'}, {'nvim-lua/plenary.nvim'}}}
  use {
    'nvim-telescope/telescope-project.nvim',
    config = function()
      require"telescope".load_extension("project")
    end
  }
  use {
    'ahmedkhalf/lsp-rooter.nvim',
    config = function()
      require('lsp-rooter').setup {
      }
    end
  }
  -- 语法建议
  use 'neovim/nvim-lspconfig'
  -- use 'hrsh7th/nvim-compe'
  use 'nvim-lua/completion-nvim'
  use 'steelsojka/completion-buffers'
  use 'nvim-treesitter/completion-treesitter'
  use 'kristijanhusak/completion-tags'
  -- 语法提示
  use 'folke/lsp-trouble.nvim'
  use 'onsails/lspkind-nvim'
  use 'simrat39/symbols-outline.nvim'
  use 'ray-x/lsp_signature.nvim'
  use 'ray-x/navigator.lua'
  use 'jose-elias-alvarez/nvim-lsp-ts-utils'
  use 'jose-elias-alvarez/null-ls.nvim'
  -- snippet相关
  use 'hrsh7th/vim-vsnip'
  use 'hrsh7th/vim-vsnip-integ'
  use 'rafamadriz/friendly-snippets'
  -- 方便操作
  use 'glepnir/indent-guides.nvim'
  use 'kevinhwang91/nvim-hlslens'
  use 'tpope/vim-eunuch'
  use 'gennaro-tedesco/nvim-peekup' -- 查看历史的复制和删除的寄存器,快捷键 ""
  use 'voldikss/vim-translator' -- npm install fanyi -g 安装翻译
  use 'b3nj5m1n/kommentary' -- 注释
  use {'iamcco/markdown-preview.nvim', opt = true, run = 'cd app && yarn install', cmd = 'MarkdownPreview'}
  use 'Pocco81/TrueZen.nvim'
  use { 'uguu-org/vim-matrix-screensaver', opt = true, cmd = 'Matrix' }
  use 'windwp/nvim-autopairs' -- 自动符号匹配
  use {
    "blackCauldron7/surround.nvim",
    config = function()
      require "surround".setup {}
    end
  }
  use {
    "folke/which-key.nvim",
    config = function()
      require("which-key").setup {}
    end
  } -- 提示leader按键
  use 'sindrets/diffview.nvim' -- diff对比
  use 'p00f/nvim-ts-rainbow' -- 彩虹匹配
  use {
      'folke/todo-comments.nvim',
      config = function ()
          require('todo-comments').setup{}
      end
  }
  use 'konfekt/fastfold' -- 性能更好的语法折叠
  use 'ThePrimeagen/vim-be-good'
  use 'sbdchd/neoformat'
end)

--settings
local scopes = {o = vim.o, b = vim.bo, w = vim.wo}
local function opt(scope, key, value)
  scopes[scope][key] = value
  if scope ~= 'o' then scopes['o'][key] = value end
end

local indent = 4
cmd 'hi NORMAL guibg=#2f334d'
opt('b', 'expandtab', true)                           -- Use spaces instead of tabs
opt('b', 'shiftwidth', indent)                        -- Size of an indent
opt('b', 'smartindent', true)                         -- Insert indents automatically
opt('b', 'tabstop', indent)                           -- Number of spaces tabs count for
opt('o', 'completeopt', 'menuone,noselect,noinsert')           -- Completion options (for compe)
opt('o', 'hidden', true)                              -- Enable modified buffers in background
opt('o', 'scrolloff', 3 )                             -- Lines of context
opt('o', 'shiftround', true)                          -- Round indent
opt('o', 'sidescrolloff', 8 )                         -- Columns of context
opt('o', 'smartcase', true)                           -- Don't ignore case with capitals
opt('o', 'splitbelow', true)                          -- Put new windows below current
opt('o', 'splitright', true)                          -- Put new windows right of current
opt('o', 'termguicolors', true)                       -- True color support
opt('o', 'clipboard', 'unnamed')
opt('o', 'pumblend', 25 )
opt('o', 'scrolloff', 2 )
opt('o', 'tabstop', 2)
opt('o', 'shiftwidth', 2)
opt('o', 'softtabstop', 2)
opt('o', 'swapfile', false )
opt('o', 'showmode', false )
opt('o', 'background', 'dark' )
opt('o', 'backup', false )
opt('w', 'number', true)                              -- Print line number
opt('o', 'lazyredraw', false)
opt('o', 'signcolumn', 'yes')
opt('o', 'mouse', 'a')
opt('o', 'cmdheight', 1)
opt('o', 'wrap', false)
opt('o', 'relativenumber', true)
opt('o', 'hlsearch', true)
opt('o', 'inccommand', 'split')
opt('o', 'smarttab', true)
opt('o', 'incsearch', true)
opt('o', 'foldmethod', 'manual')
opt('o', 'breakindent', true)
opt('o', 'lbr', true)
opt('o', 'formatoptions', 'l')
--set shortmess
vim.o.shortmess = vim.o.shortmess .. "c"

--mappings
local function map(mode, lhs, rhs, opts)
  local options = {noremap = true}
  if opts then options = vim.tbl_extend('force', options, opts) end
  remap(mode, lhs, rhs, options)
end

g.mapleader = " "                                                     --leader
map('i', 'jk', '<esc>')                                               --jk to exit
map('c', 'jk', '<C-C>')
map('n', ';', ':')                                                     --semicolon to enter command mode
map('n', 'j', 'gj')                                                    --move by visual line not actual line
map('n', 'k', 'gk')
map('n', 'q', '<cmd>q<CR>')
map('n', '<leader>w', '<cmd>HopWord<CR>')                              --easymotion/hop
map('n', '<leader>l', '<cmd>HopLine<CR>')
map('n', '<leader>/', '<cmd>HopPattern<CR>')
map('n', '<leader>p', '<cmd>Telescope<CR>')                   --fuzzy
map('n', '<leader>fr', '<cmd>Telescope oldfiles<CR>')                   --fuzzy
map('n', '<leader>f', '<cmd>Telescope find_files<CR>')
map('n', '<leader>fb', '<cmd>Telescope buffers<CR>')
map('n', '<leader>g', '<cmd>Telescope live_grep<CR>')
map('n', '<leader>fs', '<cmd>Telescope treesitter<CR>')
map('n', '<leader>fc', '<cmd>Telescope commands<CR>')
map('n', '<leader>fp', '<cmd>Telescope project<CR>')
map('n', '<leader>fm', '<cmd>Telescope marks<CR>')
map('n', 'ff', '<cmd>Clap files<CR>')
map('n', 'fb', '<cmd>Clap buffers<CR>')
map('n', 'fg', '<cmd>Clap grep2<CR>')
map('n', 'fG', '<cmd>Clap grep<CR>')
map('n', '<leader>fe', '<cmd>e ~/.config/nvim/init.lua<CR>')
map('n', '<leader>z', '<cmd>TZAtaraxis<CR>')                           --ataraxis
map('n', '<leader>x', '<cmd>TZAtaraxis l45 r45 t2 b2<CR>')
map('n', '<leader>e', '<cmd>NvimTreeToggle<CR>')                      --nvimtree
map('n', '<c-k>', '<cmd>wincmd k<CR>')                                 --ctrlhjkl to navigate splits
map('n', '<c-j>', '<cmd>wincmd j<CR>')
map('n', '<c-h>', '<cmd>wincmd h<CR>')
map('n', '<c-l>', '<cmd>wincmd l<CR>')
map('n', '<c-s>', '<cmd>w<CR>')
map('n', '<c-x>', '<cmd>BufferClose<CR>')
map('n', '<leader>b', '<cmd>BufferPick<CR>')
map('n', '<leader>bj', '<cmd>bprevious<CR>')
map('n', '<leader>bn', '<cmd>bnext<CR>')
map('n', '<leader>be', '<cmd>tabedit<CR>')
map('n', '<leader>ga', '<cmd>Gina add .<CR>')
map('n', '<leader>gm', '<cmd>Gina commit<CR>')
map('n', '<leader>gs', '<cmd>Gina status<CR>')
map('n', '<leader>gl', '<cmd>Gina pull<CR>')
map('n', '<leader>gu', '<cmd>Gina push<CR>')
cmd([[autocmd BufWritePre * %s/\s\+$//e]])                             --remove trailing whitespaces
cmd([[autocmd BufWritePre * %s/\n\+\%$//e]])

local numbers = {"1", "2", "3", "4", "5", "6", "7", "8", "9"}
for _, num in pairs(numbers) do
  map('n', '<leader>'..num, '<cmd>BufferGoto '..num..'<CR>')
end

g.loaded_python_provider = 0
g.loaded_python3_provider = 0
g.loaded_ruby_provider = 0
g.loaded_perl_provider = 0

--visual multi
nvim_exec([[
let g:VM_maps = {}
let g:VM_default_mappings = 0
let g:VM_maps["Add Cursor Down"] = '<A-j>'
let g:VM_maps["Add Cursor Up"] = '<A-k>'
]], false)

-- fastfold
g.fastfold_savehook = 1
g.fastfold_fold_command_suffixes =  {'x','X','a','A','o','O','c','C'}
g.fastfold_fold_movement_commands = {']z', '[z', 'zj', 'zk'}
g.markdown_folding = 1
g.tex_fold_enabled = 1
g.vimsyn_folding = 'af'
g.xml_syntax_folding = 1
g.javaScript_fold = 1
g.sh_fold_enabled= 7
g.ruby_fold = 1
g.perl_fold = 1
g.perl_fold_blocks = 1
g.r_syntax_folding = 1
g.rust_fold = 1
g.php_folding = 1

--barbar
nvim_exec([[
let bufferline = get(g:, 'bufferline', {})
let bufferline.animation = v:false
let bufferline.auto_hide = v:true
let bufferline.icons = 'both'
]], false)

--theme
require('moonlight').set()
-- cmd 'colorscheme melange'

require('kommentary.config').use_extended_mappings()

--nvim treesitter
require'nvim-treesitter.configs'.setup {
  ensure_installed = {"vue", "html", "javascript", "typescript", "css", "json", "rust", "lua"}, -- one of "all", "maintained" (parsers with maintainers), or a list of languages
  highlight = {
    enable = true,
  },
  rainbow = {
    enable = true,
    extended_mode = true,
  }
}

-- Signature help
require('lsp_signature').on_attach()

-- npm install --global vls vscode-css-languageserver-bin vscode-html-languageserver-bin typescript typescript-language-server vscode-json-languageserver graphql-language-service-cli dockerfile-language-server-nodejs stylelint-lsp vim-language-server yaml-language-server
-- can use rls or rust_analyzer

local on_attach = function(client, bufnr)
  local function buf_set_keymap(...) vim.api.nvim_buf_set_keymap(bufnr, ...) end
  local function buf_set_option(...) vim.api.nvim_buf_set_option(bufnr, ...) end

  buf_set_option('omnifunc', 'v:lua.vim.lsp.omnifunc')

  -- Mappings.
  local opts = { noremap=true, silent=true }
  buf_set_keymap('n', 'gD', '<Cmd>lua vim.lsp.buf.declaration()<CR>', opts)
  buf_set_keymap('n', 'gd', '<Cmd>lua vim.lsp.buf.definition()<CR>', opts)
  -- buf_set_keymap('n', 'K', '<Cmd>lua vim.lsp.buf.hover()<CR>', opts)
  buf_set_keymap('n', 'gi', '<cmd>lua vim.lsp.buf.implementation()<CR>', opts)
  -- buf_set_keymap('n', '<C-k>', '<cmd>lua vim.lsp.buf.signature_help()<CR>', opts)
  buf_set_keymap('n', '<space>wa', '<cmd>lua vim.lsp.buf.add_workspace_folder()<CR>', opts)
  buf_set_keymap('n', '<space>wr', '<cmd>lua vim.lsp.buf.remove_workspace_folder()<CR>', opts)
  buf_set_keymap('n', '<space>wl', '<cmd>lua print(vim.inspect(vim.lsp.buf.list_workspace_folders()))<CR>', opts)
  buf_set_keymap('n', '<space>D', '<cmd>lua vim.lsp.buf.type_definition()<CR>', opts)
  buf_set_keymap('n', '<spacn>rn', '<cmd>lua vim.lsp.buf.rename()<CR>', opts)
  buf_set_keymap('n', '<space>ca', '<cmd>lua vim.lsp.buf.code_action()<CR>', opts)
  buf_set_keymap('n', 'gr', '<cmd>lua vim.lsp.buf.references()<CR>', opts)
  buf_set_keymap('n', 'ge', '<cmd>lua vim.lsp.diagnostic.show_line_diagnostics()<CR>', opts)
  buf_set_keymap('n', '[d', '<cmd>lua vim.lsp.diagnostic.goto_prev()<CR>', opts)
  buf_set_keymap('n', ']d', '<cmd>lua vim.lsp.diagnostic.goto_next()<CR>', opts)
  buf_set_keymap('n', '<space>q', '<cmd>lua vim.lsp.diagnostic.set_loclist()<CR>', opts)

  buf_set_keymap('n', 'gh', '<cmd>Lspsaga lsp_finder<CR>', opts)
  buf_set_keymap('n', 'ca', '<cmd>Lspsaga code_action<CR>', opts)
  buf_set_keymap('n', 'K', '<cmd>Lspsaga hover_doc<CR>', opts)
  buf_set_keymap('n', '<C-k>', '<cmd>Lspsaga signature_help<CR>', opts)
  buf_set_keymap('n', 'rn', '<cmd>Lspsaga rename<CR>', opts)
  -- buf_set_keymap('n', 'gd', '<cmd>Lspsaga preview_definition<CR>', opts)
  buf_set_keymap('n', '<space>cd', '<cmd>Lspsaga show_line_diagnostics<CR>', opts)
  buf_set_keymap('n', '[e', '<cmd>Lspsaga diagnostic_jump_next<CR>', opts)
  buf_set_keymap('n', ']e', '<cmd>Lspsaga diagnostic_jump_prev<CR>', opts)

  -- Set some keybinds conditional on server capabilities
  if client.resolved_capabilities.document_formatting then
    buf_set_keymap("n", "<space>fo", "<cmd>lua vim.lsp.buf.formatting()<CR>", opts)
  end
  if client.resolved_capabilities.document_range_formatting then
    buf_set_keymap("v", "<space>fo", "<cmd>lua vim.lsp.buf.range_formatting()<CR>", opts)
  end

end

local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities.textDocument.completion.completionItem.snippetSupport = true
capabilities.textDocument.completion.completionItem.resolveSupport = {
  properties = {
    'documentation',
    'detail',
    'additionalTextEdits',
  }
}

local function setup_servers()
  local servers = { "cssls", "html", "rust_analyzer", "tsserver",  "graphql", "vls" }
  for _, server in pairs(servers) do
    require'lspconfig'[server].setup{
      on_attach = require('completion').on_attach,
      capabilities = capabilities,
    }
  end
end

setup_servers()

g.completion_chain_complete_list = {
  default = {
    { complete_items = { 'lsp' } },
    { complete_items = { 'buffers' } },
    { complete_items = { 'ts' } },
    { complete_items = { 'tags' } },
    { mode = { '<c-p>' } },
    { mode = { '<c-n>' } }
  },
}

--use tab to navigate autocomplete
local t = function(str)
  return vim.api.nvim_replace_termcodes(str, true, true, true)
end

local check_back_space = function()
    local col = vim.fn.col('.') - 1
    if col == 0 or vim.fn.getline('.'):sub(col, col):match('%s') then
        return true
    else
        return false
    end
end

-- Use (s-)tab to:
--- move to prev/next item in completion menuone
--- jump to prev/next snippet's placeholder
_G.tab_complete = function()
  if vim.fn.pumvisible() == 1 then
    return t "<C-n>"
  elseif vim.fn.call("vsnip#available", {1}) == 1 then
    return t "<Plug>(vsnip-expand-or-jump)"
  elseif check_back_space() then
    return t "<Tab>"
  else
    return vim.fn['compe#complete']()
  end
end
_G.s_tab_complete = function()
  if vim.fn.pumvisible() == 1 then
    return t "<C-p>"
  elseif vim.fn.call("vsnip#jumpable", {-1}) == 1 then
    return t "<Plug>(vsnip-jump-prev)"
  else
    return t "<S-Tab>"
  end
end

remap("i", "<Tab>", "v:lua.tab_complete()", {expr = true})
remap("s", "<Tab>", "v:lua.tab_complete()", {expr = true})
remap("i", "<S-Tab>", "v:lua.s_tab_complete()", {expr = true})
remap("s", "<S-Tab>", "v:lua.s_tab_complete()", {expr = true})

require('nvim-autopairs').setup({
  disable_filetype = { "TelescopePrompt" },
})
local npairs = require('nvim-autopairs')

_G.MUtils= {}

vim.g.completion_confirm_key = ""
MUtils.completion_confirm=function()
  if vim.fn.pumvisible() ~= 0  then
    if vim.fn.complete_info()["selected"] ~= -1 then
      return vim.fn["compe#confirm"](npairs.esc("<c-r>"))
    else
      return npairs.esc("<cr>")
    end
  else
    return npairs.autopairs_cr()
  end
end

remap('i' , '<CR>','v:lua.MUtils.completion_confirm()', {expr = true , noremap = true})
vim.lsp.set_log_level("debug")
require("trouble").setup {}
require("lspkind").init()

require('symbols-outline').setup()

require('nvim-autopairs').setup({
  disable_filetype = { "TelescopePrompt" },
})

require'diffview'.setup{}

--colorizer
require'colorizer'.setup()

require'shade'.setup({
  overlay_opacity = 50,
  opacity_step = 1,
  keys = {
    brightness_up    = '<C-Up>',
    brightness_down  = '<C-Down>',
    toggle           = '<Leader>s',
  }
})

require('indent_guides').setup({
})

--nvimtree
g.nvim_tree_side = "left"
g.nvim_tree_width = 25
g.nvim_tree_ignore = {".git", "node_modules", ".cache"}
g.nvim_tree_auto_open = 0
g.nvim_tree_auto_close = 0
g.nvim_tree_quit_on_open = 0
g.nvim_tree_follow = 1
g.nvim_tree_indent_markers = 1
g.nvim_tree_hide_dotfiles = 1
g.nvim_tree_git_hl = 1
g.nvim_tree_root_folder_modifier = ":~"
g.nvim_tree_allow_resize = 1

g.nvim_tree_show_icons = {
    git = 1,
    folders = 1,
    files = 1
}

g.nvim_tree_icons = {
    default = '',
    symlink = '',
    git  = {
      unstaged = "",
      staged = "✓",
      unmerged = "",
      renamed = "",
      untracked = "",
      deleted = "",
      ignored = ""
      },
    folder  = {
      default = "",
      open = "",
      empty = "",
      empty_open = "",
      symlink = "",
      symlink_open = "",
      },
      lsp  = {
        hint = "",
        info = "",
        warning = "",
        error = "",
        }
}

--telescope
require('telescope').setup{
  defaults = {
    vimgrep_arguments = {
      'rg',
      '--color=never',
      '--no-heading',
      '--with-filename',
      '--line-number',
      '--column',
      '--smart-case'
    },
    prompt_position = "top",
    prompt_prefix = " ",
    selection_caret = " ",
    entry_prefix = "  ",
    initial_mode = "insert",
    selection_strategy = "reset",
    sorting_strategy = "ascending",
    -- layout_strategy = "vertical",
    layout_defaults = {
      horizontal = {
        mirror = false,
      },
      vertical = {
        mirror = true,
      },
    },
    file_sorter =  require'telescope.sorters'.get_fuzzy_file,
    file_ignore_patterns = {},
    generic_sorter =  require'telescope.sorters'.get_generic_fuzzy_sorter,
    shorten_path = true,
    winblend = 0,
    width = 0.75,
    preview_cutoff = 120,
    results_height = 1,
    results_width = 0.8,
    border = {},
    borderchars = { '─', '│', '─', '│', '╭', '╮', '╯', '╰' },
    color_devicons = true,
    use_less = true,
    set_env = { ['COLORTERM'] = 'truecolor' }, -- default = nil,
    file_previewer = require'telescope.previewers'.vim_buffer_cat.new,
    grep_previewer = require'telescope.previewers'.vim_buffer_vimgrep.new,
    qflist_previewer = require'telescope.previewers'.vim_buffer_qflist.new,

    buffer_previewer_maker = require'telescope.previewers'.buffer_previewer_maker,
    extensions = {}
  }
}

--gitsigns
require('gitsigns').setup {
  signs = {
    add          = {hl = 'GitSignsAdd'   , text = '│', numhl='GitSignsAddNr'   , linehl='GitSignsAddLn'},
    change       = {hl = 'GitSignsChange', text = '│', numhl='GitSignsChangeNr', linehl='GitSignsChangeLn'},
    delete       = {hl = 'GitSignsDelete', text = '_', numhl='GitSignsDeleteNr', linehl='GitSignsDeleteLn'},
    topdelete    = {hl = 'GitSignsDelete', text = '‾', numhl='GitSignsDeleteNr', linehl='GitSignsDeleteLn'},
    changedelete = {hl = 'GitSignsChange', text = '~', numhl='GitSignsChangeNr', linehl='GitSignsChangeLn'},
  },
  numhl = false,
  linehl = false,
  keymaps = {
    -- Default keymap options
    noremap = true,
    buffer = true,

    ['n ]c'] = { expr = true, "&diff ? ']c' : '<cmd>lua require\"gitsigns\".next_hunk()<CR>'"},
    ['n [c'] = { expr = true, "&diff ? '[c' : '<cmd>lua require\"gitsigns\".prev_hunk()<CR>'"},

    ['n <leader>hs'] = '<cmd>lua require"gitsigns".stage_hunk()<CR>',
    ['n <leader>hu'] = '<cmd>lua require"gitsigns".undo_stage_hunk()<CR>',
    ['n <leader>hr'] = '<cmd>lua require"gitsigns".reset_hunk()<CR>',
    ['n <leader>hR'] = '<cmd>lua require"gitsigns".reset_buffer()<CR>',
    ['n <leader>hp'] = '<cmd>lua require"gitsigns".preview_hunk()<CR>',
    ['n <leader>hb'] = '<cmd>lua require"gitsigns".blame_line()<CR>',

    -- Text objects
    ['o ih'] = ':<C-U>lua require"gitsigns".select_hunk()<CR>',
    ['x ih'] = ':<C-U>lua require"gitsigns".select_hunk()<CR>'
  },
  watch_index = {
    interval = 1000
  },
  current_line_blame = false,
  sign_priority = 6,
  update_debounce = 100,
  status_formatter = nil, -- Use default
  use_decoration_api = true,
  use_internal_diff = false,  -- If luajit is present
}

fn.sign_define(
    "LspDiagnosticsSignError",
    {texthl = "LspDiagnosticsSignError", text = "", numhl = "LspDiagnosticsSignError"}
)
fn.sign_define(
    "LspDiagnosticsSignWarning",
    {texthl = "LspDiagnosticsSignWarning", text = "", numhl = "LspDiagnosticsSignWarning"}
)
fn.sign_define(
    "LspDiagnosticsSignHint",
    {texthl = "LspDiagnosticsSignHint", text = "", numhl = "LspDiagnosticsSignHint"}
)
fn.sign_define(
    "LspDiagnosticsSignInformation",
    {texthl = "LspDiagnosticsSignInformation", text = "", numhl = "LspDiagnosticsSignInformation"}
)

-- lualine
local lualine = require'lualine'
-- Color table for highlights
local colors = {
  bg       = '#1d2133',
  fg       = '#e4f3fa',
  yellow   = '#ffc777',
  cyan     = '#04d1f9',
  darkblue = '#a1abe0',
  green    = '#2df4c0',
  orange   = '#f67f81',
  violet   = '#ecb2f0',
  magenta  = '#b4a4f4',
  blue     = '#04d1f9';
  red      = '#ff757f';
}

local conditions = {
  buffer_not_empty = function()
    return vim.fn.empty(vim.fn.expand('%:t')) ~= 1
  end,
  hide_in_width = function()
    return vim.fn.winwidth(0) > 80
  end,
  check_git_workspace = function()
    local filepath = vim.fn.expand('%:p:h')
    local gitdir = vim.fn.finddir('.git', filepath .. ';')
    return gitdir and #gitdir > 0 and #gitdir < #filepath
  end
}

-- Config
local lualine_config = {
  options = {
    -- Disable sections and component separators
    component_separators = "",
    section_separators = "",
    -- theme = 'moonlight'
    -- theme = {
    --   -- We are going to use lualine_c and lualine_x as left and
    --   -- right section. Both are highlighted by c theme .  So we
    --   -- are just setting default looks o statusline
    --   normal = { c = {fg = colors.fg, bg = colors.bg}},
    --   inactive = { c = {fg = colors.fg, bg = colors.bg}}
    -- },
  },
  sections = {
    -- these are to remove the defaults
    lualine_a = {},
    lualine_b = {},
    lualine_y = {},
    lualine_z = {},
    -- These will be filled later
    lualine_c = {},
    lualine_x = {},
  },
  inactive_sections = {
    -- these are to remove the defaults
    lualine_a = {},
    lualine_v = {},
    lualine_y = {},
    lualine_z = {},
    lualine_c = {},
    lualine_x = {},
  }
}

-- Inserts a component in lualine_c at left section
local function ins_left(component)
  table.insert(lualine_config.sections.lualine_c, component)
end

-- Inserts a component in lualine_x ot right section
local function ins_right(component)
  table.insert(lualine_config.sections.lualine_x, component)
end

ins_left {
 function() return '▊' end,
 color = {fg = colors.blue}, -- Sets highlighting of component
 left_padding = 0 -- We don't need space before this
}

ins_left {
  -- mode component
  function()
    -- auto change color according to neovims mode
    local mode_color = {
      n      = colors.red,
      i      = colors.green,
      v      = colors.blue,
      [''] = colors.blue,
      V      = colors.blue,
      c      = colors.magenta,
      no     = colors.red,
      s      = colors.orange,
      S      = colors.orange,
      [''] = colors.orange,
      ic     = colors.yellow,
      R      = colors.violet,
      Rv     = colors.violet,
      cv     = colors.red,
      ce     = colors.red,
      r      = colors.cyan,
      rm     = colors.cyan,
      ['r?'] = colors.cyan,
      ['!']  = colors.red,
      t      = colors.red
    }
    vim.api.nvim_command('hi! LualineMode guifg='..mode_color[vim.fn.mode()] .. " guibg="..colors.bg)
    return '〒'  end,
  color = "LualineMode",
  left_padding = 0,
}

ins_left {
  -- filesize component
  function()
    local function format_file_size(file)
      local size = vim.fn.getfsize(file)
      if size <= 0 then return '' end
      local sufixes = {'b', 'k', 'm', 'g'}
      local i = 1
      while size > 1024 do
        size = size / 1024
        i = i + 1
      end
      return string.format('%.1f%s', size, sufixes[i])
    end
    local file = vim.fn.expand('%:p')
    if string.len(file) == 0 then return '' end
    return format_file_size(file)
  end,
  condition = conditions.buffer_not_empty,
}

ins_left {
  'filename',
  condition = conditions.buffer_not_empty,
  color = {fg = colors.blue, gui = 'bold'},
}

ins_left {
  'location',
  color = {fg = colors.darkblue, gui = 'bold'}
}

ins_left {
  'progress',
  color = {fg = colors.darkblue, gui = 'bold'},
}

ins_left {
  'diagnostics',
  sources = {'nvim_lsp'},
  symbols = {error = ' ', warn = ' ', info= ' '},
  color_error = colors.red,
  color_warn = colors.yellow,
  color_info = colors.cyan,
}



-- Add components to right sections
ins_right {
  'o:encoding', -- option component same as &encoding in viml
  condition = conditions.hide_in_width,
  color = {fg = colors.darkblue, gui = 'bold'}
}

ins_right {
  'fileformat',
  icons_enabled = true, -- I think icons are cool but Eviline doesn't have them. sigh
  color = {fg = colors.darkblue, gui='bold'},
}

ins_right {
  'branch',
  icon = '',
  condition = conditions.check_git_workspace,
  color = {fg = colors.green, gui = 'bold'},
}

ins_right {
  'diff',
  -- Is it me or the symbol for modified us really weird
  symbols = {added= ' ', modified= ' ', removed= ' '},
  color_added = colors.green,
  color_modified = colors.orange,
  color_removed = colors.red,
  condition = conditions.hide_in_width
}

ins_right {
  -- Lsp server name .
  function ()
    local msg = 'none'
    local buf_ft = vim.api.nvim_buf_get_option(0,'filetype')
    local clients = vim.lsp.get_active_clients()
    if next(clients) == nil then return msg end
    for _, client in ipairs(clients) do
      local filetypes = client.config.filetypes
      if filetypes and vim.fn.index(filetypes, buf_ft) ~= -1 then
        return client.name
      end
    end
    return msg
  end,
  color = {fg = colors.cyan, gui = 'bold'}
}

ins_right {
  function() return '▊' end,
  color = {fg = colors.blue},
  right_padding = 0,
}
lualine.setup(lualine_config)

local true_zen = require("true-zen")

true_zen.setup(
    {
        true_false_commands = false,
        cursor_by_mode = false,
        before_minimalist_mode_shown = true,
        before_minimalist_mode_hidden = true,
        after_minimalist_mode_shown = true,
        after_minimalist_mode_hidden = true,
        bottom = {
            hidden_laststatus = 0,
            hidden_ruler = false,
            hidden_showmode = false,
            hidden_showcmd = false,
            hidden_cmdheight = 1,
            shown_laststatus = 2,
            shown_ruler = true,
            shown_showmode = false,
            shown_showcmd = false,
            shown_cmdheight = 1
        },
        top = {
            hidden_showtabline = 0,
            shown_showtabline = 2
        },
        left = {
            hidden_number = false,
            hidden_relativenumber = false,
            hidden_signcolumn = "no",
            shown_number = true,
            shown_relativenumber = false,
            shown_signcolumn = "yes"
        },
        ataraxis = {
            just_do_it_for_me = false,
            left_padding = 37,
            right_padding = 37,
            top_padding = 2,
            bottom_padding = 2,
            custome_bg = "#1e222a"
        },
        integrations = {
            integration_galaxyline = true
        }
    }
)

g.dashboard_session_directory = '~/.config/nvim/.sessions'
g.dashboard_default_executive = 'telescope'
cmd("let packages = len(globpath('~/AppData/Local/nvim-dat/site/pack/packer/start', '*', 0, 1))")

nvim_exec([[
    let g:dashboard_custom_footer = ['LuaJIT loaded '..packages..' packages']
]], false)
g.dashboard_custom_section = {
    a = {description = {'  Reload Last Session            SPC q l'}, command = 'SessionLoad'},
    b = {description = {'  Recently Opened Files          SPC f r'}, command = 'Telescope oldfiles'},
    c = {description = {'  Open Project                   SPC f p'}, command = 'Telescope Project'},
    d = {description = {'  Jump to Bookmark               SPC f m'}, command = 'Telescope marks'},
    e = {description = {'  Find File                      SPC f  '}, command = 'Telescope find_files'},
    f = {description = {'  Find Word                      SPC g  '}, command = 'Telescope live_grep'},
    g = {description = {'  Open Neovim Configuration      SPC f e'}, command = ':e ~/AppData/Local/nvim/init.lua'},
}

g.dashboard_custom_header = {
                 "=================     ===============     ===============   ========  ========",
                 "\\\\ . . . . . . .\\\\   //. . . . . . .\\\\   //. . . . . . .\\\\  \\\\. . .\\\\// . . //",
                 "||. . ._____. . .|| ||. . ._____. . .|| ||. . ._____. . .|| || . . .\\/ . . .||",
                 "|| . .||   ||. . || || . .||   ||. . || || . .||   ||. . || ||. . . . . . . ||",
                 "||. . ||   || . .|| ||. . ||   || . .|| ||. . ||   || . .|| || . | . . . . .||",
                 "|| . .||   ||. _-|| ||-_ .||   ||. . || || . .||   ||. _-|| ||-_.|\\ . . . . ||",
                 "||. . ||   ||-'  || ||  `-||   || . .|| ||. . ||   ||-'  || ||  `|\\_ . .|. .||",
                 "|| . _||   ||    || ||    ||   ||_ . || || . _||   ||    || ||   |\\ `-_/| . ||",
                 "||_-' ||  .|/    || ||    \\|.  || `-_|| ||_-' ||  .|/    || ||   | \\  / |-_.||",
                 "||    ||_-'      || ||      `-_||    || ||    ||_-'      || ||   | \\  / |  `||",
                 "||    `'         || ||         `'    || ||    `'         || ||   | \\  / |   ||",
                 "||            .===' `===.         .==='.`===.         .===' /==. |  \\/  |   ||",
                 "||         .=='   \\_|-_ `===. .==='   _|_   `===. .===' _-|/   `==  \\/  |   ||",
                 "||      .=='    _-'    `-_  `='    _-'   `-_    `='  _-'   `-_  /|  \\/  |   ||",
                 "||   .=='    _-'          `-__\\._-'         `-_./__-'         `' |. /|  |   ||",
                 "||.=='    _-'                                                     `' |  /==.||",
                 "=='    _-'                        N E O V I M                         \\/   `==",
                 "\\   _-'                                                                `-_   /",
                 " `''                                                                      ``'  ",
                 "                                                                               ",
}
