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
cmd [[packadd packer.nvim]]
require('packer').startup(function()
  use 'wbthomason/packer.nvim'
  use 'nvim-lua/plenary.nvim'
  -- 状态栏
  use {'windwp/windline.nvim', requires = {'kyazdani42/nvim-web-devicons', opt = true}}
  use 'romgrk/barbar.nvim'
  use 'kyazdani42/nvim-tree.lua'
  use 'glepnir/dashboard-nvim'
  -- git相关
  use 'lewis6991/gitsigns.nvim'
  use 'tpope/vim-fugitive'
  use 'f-person/git-blame.nvim' -- 显示git message
  -- 语法高亮
  use { 'nvim-treesitter/nvim-treesitter', run = ':TSUpdate' }
  use  'nvim-treesitter/nvim-treesitter-textobjects'
  use 'nvim-treesitter/nvim-treesitter-refactor'
  use 'windwp/nvim-ts-autotag'
  use 'nvim-treesitter/playground'
  use 'junegunn/limelight.vim'
  use 'norcalli/nvim-colorizer.lua' -- 色值高亮
  -- use 'shaunsingh/moonlight.nvim' -- theme
  use 'bluz71/vim-nightfly-guicolors'
  use 'sunjon/shade.nvim' -- 高亮当前tab窗口
  -- 导航finder操作
  use 'mg979/vim-visual-multi'
  use 'phaazon/hop.nvim'
  use 'ggandor/lightspeed.nvim'
  use {'liuchengxu/vim-clap', run = ':Clap install-binary'}
  -- use { 'camspiers/snap', rocks = {'fzy'}}
  use {'nvim-telescope/telescope.nvim', requires = {{'nvim-lua/popup.nvim'}, {'nvim-lua/plenary.nvim'}}}
  use {
    'nvim-telescope/telescope-project.nvim',
    config = function()
      require"telescope".load_extension("project")
    end
  }
  --[[ use {
    'ahmedkhalf/lsp-rooter.nvim',
    config = function()
      require('lsp-rooter').setup {
      }
    end
  } ]]
  -- 语法建议
  use 'neovim/nvim-lspconfig'
  use 'hrsh7th/nvim-compe'
  use {'tzachar/compe-tabnine', run='./install.sh', requires = 'hrsh7th/nvim-compe'}
  -- 语法提示
  use 'folke/lsp-trouble.nvim'
  use 'onsails/lspkind-nvim'
  use 'simrat39/symbols-outline.nvim'
  use 'ray-x/lsp_signature.nvim'
  use {'ray-x/navigator.lua', requires = {'ray-x/guihua.lua', run = 'cd lua/fzy && make'},
    config = function()
      require'navigator'.setup()
    end
  }
  use 'jose-elias-alvarez/nvim-lsp-ts-utils'
  use 'jose-elias-alvarez/null-ls.nvim'
  -- snippet相关
  use 'hrsh7th/vim-vsnip'
  use 'hrsh7th/vim-vsnip-integ'
  use 'rafamadriz/friendly-snippets'
  -- 方便操作
  -- use "lukas-reineke/indent-blankline.nvim" -- 对齐线，太多了
  use 'kevinhwang91/nvim-hlslens'
  use 'tpope/vim-eunuch'
  use 'gennaro-tedesco/nvim-peekup' -- 查看历史的复制和删除的寄存器,快捷键 ""
  use 'voldikss/vim-translator' -- npm install fanyi -g 安装翻译
  use 'b3nj5m1n/kommentary' -- 注释
  use 'Pocco81/TrueZen.nvim'
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
  use {
    'mhartington/formatter.nvim',
    config = function()
      require('formatter').setup{}
    end
  }
  use {
    'NTBBloodbath/rest.nvim',
    requires = { 'nvim-lua/plenary.nvim' },
    config = function()
        require('rest-nvim').setup()
    end
  }
end)

--settings
local scopes = {o = vim.o, b = vim.bo, w = vim.wo}
local function opt(scope, key, value)
  scopes[scope][key] = value
  if scope ~= 'o' then scopes['o'][key] = value end
end

local indent = 4
-- cmd 'hi NORMAL guibg=#2f334d'
opt('b', 'expandtab', true)                           -- Use spaces instead of tabs
opt('b', 'shiftwidth', indent)                        -- Size of an indent
opt('b', 'smartindent', true)                         -- Insert indents automatically
opt('b', 'tabstop', indent)                           -- Number of spaces tabs count for
opt('o', 'completeopt', 'menuone,noselect')           -- Completion options (for compe)
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
opt('o', 'lazyredraw', true)
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
opt('o', 'laststatus', 2)
opt('o', 'cursorline', true)
opt('o', 'autowrite', true)
opt('o', 'autoindent', true)

--set shortmess
vim.o.shortmess = vim.o.shortmess .. "c"

nvim_exec([[
filetype on
filetype plugin on
autocmd BufEnter * :syn sync maxlines=500
filetype indent on
]], false)

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
map('n', '<leader>P', '<cmd>Clap<CR>')                   --fuzzy
map('n', '<leader>p', '<cmd>Telescope<CR>')                   --fuzzy
map('n', '<leader>fr', '<cmd>Telescope oldfiles<CR>')                   --fuzzy
map('n', '<leader>f', '<cmd>Telescope find_files<CR>')
map('n', '<leader>fb', '<cmd>Telescope buffers<CR>')
map('n', '<leader>g', '<cmd>Telescope live_grep<CR>')
map('n', '<leader>fs', '<cmd>Telescope treesitter<CR>')
map('n', '<leader>fc', '<cmd>Telescope commands<CR>')
map('n', '<leader>fp', '<cmd>Telescope project<CR>')
map('n', '<leader>fm', '<cmd>Telescope marks<CR>')
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
map('n', '<leader>ga', '<cmd>Git add .<CR>')
map('n', '<leader>gm', '<cmd>Git commit<CR>')
map('n', '<leader>gs', '<cmd>Git status<CR>')
map('n', '<leader>gl', '<cmd>Git pull<CR>')
map('n', '<leader>gu', '<cmd>Git push<CR>')
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
let g:indent_blankline_char_highlight_list = ['|', '¦', '┆', '┊']
let g:indent_blankline_filetype_exclude = ['help', 'dashboard', 'NvimTree', 'telescope']

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
-- require('moonlight').set()
cmd 'colorscheme nightfly'

require('kommentary.config').use_extended_mappings()

require'lightspeed'.setup {
  jump_to_first_match = true,
  jump_on_partial_input_safety_timeout = 400,
  -- This can get _really_ slow if the window has a lot of content,
  -- turn it on only if your machine can always cope with it.
  highlight_unique_chars = false,
  grey_out_search_area = true,
  match_only_the_start_of_same_char_seqs = true,
  limit_ft_matches = 5,
  full_inclusive_prefix_key = '<c-x>',
  -- By default, the values of these will be decided at runtime,
  -- based on `jump_to_first_match`.
  labels = nil,
  cycle_group_fwd_key = nil,
  cycle_group_bwd_key = nil,
}

--nvim treesitter
require('nvim-treesitter.configs').setup {
  ensure_installed = {"vue", "html", "javascript", "typescript", "css", "json", "rust", "lua"}, -- one of "all", "maintained" (parsers with maintainers), or a list of languages
  highlight = {
    enable = true,
  },
  rainbow = {
    enable = true,
    extended_mode = true,
  },
  autotag = {
    enable = true,
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
      on_attach = on_attach,
      capabilities = capabilities,
    }
  end
end

setup_servers()

--nvim-compe
require'compe'.setup {
  enabled = true;
  autocomplete = true;
  debug = true;
  min_length = 1;
  preselect = 'enable';
  throttle_time = 80;
  source_timeout = 200;
  incomplete_delay = 400;
  max_abbr_width = 100;
  max_kind_width = 100;
  max_menu_width = 100;
  documentation = true;
  source = {
    path = true;
    buffer = true;
    calc = true;
    spell = true;
    nvim_lsp = true;
    nvim_lua = true;
    vsnip = true;
    omni = true;
    nvim_treesitter = true;
    emoji = true;
    tabnine = {
       max_line = 5000;
       max_num_results = 6;
       priority = 500;
       sort = false;
       show_prediction_strength = true;
       ignore_pattern = '';
    }
  };
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

local windline = require('windline')
local helper = require('windline.helpers')
local sep = helper.separators
local vim_components = require('windline.components.vim')

local b_components = require('windline.components.basic')
local state = _G.WindLine.state

local lsp_comps = require('windline.components.lsp')
local git_comps = require('windline.components.git')

local hl_list = {
    Black = { 'white', 'black' },
    White = { 'black', 'white' },
    Inactive = { 'InactiveFg', 'InactiveBg' },
    Active = { 'ActiveFg', 'ActiveBg' },
}
local basic = {}

basic.divider = { b_components.divider, '' }
basic.space = { ' ', '' }
basic.file_name_inactive = { b_components.full_file_name, hl_list.Inactive }
basic.line_col_inactive = { b_components.line_col, hl_list.Inactive }
basic.progress_inactive = { b_components.progress, hl_list.Inactive }

basic.vi_mode = {
    name = 'vi_mode',
    hl_colors = {
        Normal = { 'black', 'red', 'bold' },
        Insert = { 'black', 'green', 'bold' },
        Visual = { 'black', 'yellow', 'bold' },
        Replace = { 'black', 'blue_light', 'bold' },
        Command = { 'black', 'magenta', 'bold' },
        NormalBefore = { 'red', 'black' },
        InsertBefore = { 'green', 'black' },
        VisualBefore = { 'yellow', 'black' },
        ReplaceBefore = { 'blue_light', 'black' },
        CommandBefore = { 'magenta', 'black' },
        NormalAfter = { 'white', 'red' },
        InsertAfter = { 'white', 'green' },
        VisualAfter = { 'white', 'yellow' },
        ReplaceAfter = { 'white', 'blue_light' },
        CommandAfter = { 'white', 'magenta' },
    },
    text = function()
        return {
            { sep.left_rounded, state.mode[2] .. 'Before' },
            { state.mode[1] .. ' ', state.mode[2] },
            { sep.left_rounded, state.mode[2] .. 'After' },
        }
    end,
}

basic.lsp_diagnos = {
    name = 'diagnostic',
    hl_colors = {
        red = { 'red', 'black' },
        yellow = { 'yellow', 'black' },
        blue = { 'blue', 'black' },
    },
    width = 90,
    text = function()
        if lsp_comps.check_lsp() then
            return {
                { lsp_comps.lsp_error({ format = '  %s' }), 'red' },
                { lsp_comps.lsp_warning({ format = '  %s' }), 'yellow' },
                { lsp_comps.lsp_hint({ format = '  %s' }), 'blue' },
            }
        end
        return ''
    end,
}

basic.file = {
    name = 'file',
    hl_colors = {
        default = hl_list.White,
    },
    text = function()
        return {
            { b_components.cache_file_icon(''), 'default' },
            { ' ', '' },
            { b_components.cache_file_name('[No Name]', 'unique'), '' },
            { b_components.file_modified(' '), '' },
            { b_components.cache_file_size(), '' },
        }
    end,
}

basic.right = {
    hl_colors = {
        sep_before = { 'black_light', 'black' },
        sep_after = { 'black_light', 'black' },
        text = { 'white', 'black_light' },
    },
    text = function()
        return {
            { sep.left_rounded, 'sep_before' },
            { 'l/n', 'text' },
            { b_components.line_col, 'text' },
            { '', 'text' },
            { b_components.progress, 'text' },
            { sep.right_rounded, 'sep_after' },
        }
    end,
}
basic.git = {
    name = 'git',
    width = 90,
    hl_colors = {
        green = { 'green', 'black' },
        red = { 'red', 'black' },
        blue = { 'blue', 'black' },
    },
    text = function()
        if git_comps.is_git() then
            return {
                { ' ' },
                { git_comps.diff_added({ format = ' %s' }), 'green' },
                { git_comps.diff_removed({ format = '  %s' }), 'red' },
                { git_comps.diff_changed({ format = ' 柳%s' }), 'blue' },
            }
        end
        return ''
    end,
}

local default = {
    filetypes = { 'default' },
    active = {
        { ' ', hl_list.Black },
        basic.vi_mode,
        basic.file,
        { vim_components.search_count(), { 'red', 'white' } },
        { sep.right_rounded, hl_list.Black },
        basic.lsp_diagnos,
        basic.git,
        basic.divider,
        {git_comps.git_branch({ icon = '  ' }),  { 'green', 'black' }, 90 },
        { ' ', hl_list.Black },
        basic.right,
        { ' ', hl_list.Black },
    },
    in_active = {
        basic.file_name_inactive,
        basic.divider,
        basic.divider,
        basic.line_col_inactive,
        { '', { 'white', 'InactiveBg' } },
        basic.progress_inactive,
    },
}

local quickfix = {
    filetypes = { 'qf', 'Trouble' },
    active = {
        { '🚦 Quickfix ', { 'white', 'black' } },
        { helper.separators.slant_right, { 'black', 'black_light' } },
        {
            function()
                return vim.fn.getqflist({ title = 0 }).title
            end,
            { 'cyan', 'black_light' },
        },
        { ' Total : %L ', { 'cyan', 'black_light' } },
        { helper.separators.slant_right, { 'black_light', 'InactiveBg' } },
        { ' ', { 'InactiveFg', 'InactiveBg' } },
        basic.divider,
        { helper.separators.slant_right, { 'InactiveBg', 'black' } },
        { '🧛 ', { 'white', 'black' } },
    },
    show_in_active = true,
}

local explorer = {
    filetypes = { 'fern', 'NvimTree', 'lir' },
    active = {
        { '  ', { 'white', 'black' } },
        { helper.separators.slant_right, { 'black', 'black_light' } },
        { b_components.divider, '' },
        { b_components.file_name(''), { 'white', 'black_light' } },
    },
    show_in_active = true,

}

windline.setup({
    colors_name = function(colors)
        -- ADD MORE COLOR HERE ----
        return colors
    end,
    statuslines = {
        default,
        explorer,
        quickfix,
    },
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

-- true-zen
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

g.dashboard_session_directory = '/.sessions'
g.dashboard_default_executive = 'telescope'
cmd("let packages = len(globpath('~/.local/share/nvim/site/pack/packer/start', '*', 0, 1))")

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
