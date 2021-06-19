-- Signature help
require('lsp_signature').on_attach()

--lspconfig + lsp trouble + Lspsaga
-- npm install --global vls vscode-css-languageserver-bin vscode-html-languageserver-bin typescript typescript-language-server vscode-json-languageserver graphql-language-service-cli dockerfile-language-server-nodejs stylelint-lsp vim-language-server yaml-language-server
-- rls, rust_analyzer

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
      on_attach = require'completion'.on_attach,
      capabilities = capabilities,
    }
  end
end

setup_servers()

require("trouble").setup {}

require('symbols-outline').setup()

require('nvim-autopairs').setup({
  disable_filetype = { "TelescopePrompt" },
})
