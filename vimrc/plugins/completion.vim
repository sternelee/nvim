let g:completion_chain_complete_list = {
    \ 'default': [
    \    {'complete_items': ['lsp', 'buffers', 'snippet', 'dictionary', 'ts', 'tabnine' ]},
    \    {'mode': '<c-p>'},
    \    {'mode': '<c-n>'}
    \]
\}

let g:completion_enable_snippet = 'vim-vsnip'

inoremap <expr> <Tab>   pumvisible() ? "\<C-n>" : "\<Tab>"
inoremap <expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"
let g:completion_confirm_key = ""
imap <expr> <cr>  pumvisible() ? complete_info()["selected"] != "-1" ?
                 \ "\<Plug>(completion_confirm_completion)"  : "\<c-e>\<CR>" :  "\<CR>"


lua << EOF
local nvim_lsp = require('lspconfig')
local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities.textDocument.completion.completionItem.snippetSupport = true
capabilities.textDocument.completion.completionItem.resolveSupport = {
  properties = {
    'documentation',
    'detail',
    'additionalTextEdits',
  }
}

local servers = { "vls", "cssls", "html", "rust_analyzer", "tsserver", "bashls", "jsonls" }
-- npm install --global vls vscode-css-languageserver-bin vscode-html-languageserver-bin typescript typescript-language-server vscode-json-languageserver
local completion = require('completion')
for _, lsp in ipairs(servers) do
  nvim_lsp[lsp].setup {
    on_attach = completion.on_attach,
    capabilities = capabilities,
  }
end

require('nvim-autopairs').setup({
  disable_filetype = { "TelescopePrompt" , "vim" },
})
local remap = vim.api.nvim_set_keymap
local npairs = require('nvim-autopairs')

EOF
