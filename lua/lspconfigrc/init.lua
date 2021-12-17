local lspconfig = require'lspconfig'
local capabilities = require('cmp_nvim_lsp').update_capabilities(vim.lsp.protocol.make_client_capabilities())

capabilities.textDocument.completion.completionItem.snippetSupport = true

local on_attach = function(client, bufnr)
  local function buf_set_keymap(...) vim.api.nvim_buf_set_keymap(bufnr, ...) end
  local function buf_set_option(...) vim.api.nvim_buf_set_option(bufnr, ...) end

  -- Enable completion triggered by <c-x><c-o>
  buf_set_option('omnifunc', 'v:lua.vim.lsp.omnifunc')

  -- Mappings.
  local opts = { noremap=true, silent=true }

  -- See `:help vim.lsp.*` for documentation on any of the below functions
  --buf_set_keymap('n', 'gD', '<cmd>lua vim.lsp.buf.declaration()<CR>', opts)
  --buf_set_keymap('n', 'gd', '<cmd>lua vim.lsp.buf.definition()<CR>', opts)
  --buf_set_keymap('n', 'K', '<cmd>lua vim.lsp.buf.hover()<CR>', opts)
  buf_set_keymap('n', 'gi', '<cmd>lua vim.lsp.buf.implementation()<CR>', opts)
  buf_set_keymap('n', '<C-k>', '<cmd>lua vim.lsp.buf.signature_help()<CR>', opts)
  buf_set_keymap('n', '<space>wa', '<cmd>lua vim.lsp.buf.add_workspace_folder()<CR>', opts)
  buf_set_keymap('n', '<space>wr', '<cmd>lua vim.lsp.buf.remove_workspace_folder()<CR>', opts)
  buf_set_keymap('n', '<space>wl', '<cmd>lua print(vim.inspect(vim.lsp.buf.list_workspace_folders()))<CR>', opts)
  buf_set_keymap('n', '<space>D', '<cmd>lua vim.lsp.buf.type_definition()<CR>', opts)
  --buf_set_keymap('n', '<space>rn', '<cmd>lua vim.lsp.buf.rename()<CR>', opts)
  --buf_set_keymap('n', '<space>ca', '<cmd>lua vim.lsp.buf.code_action()<CR>', opts)
  buf_set_keymap('n', 'gr', '<cmd>lua vim.lsp.buf.references()<CR>', opts)
  --buf_set_keymap('n', '<space>e', '<cmd>lua vim.lsp.diagnostic.show_line_diagnostics()<CR>', opts)
  buf_set_keymap('n', '[d', '<cmd>lua vim.lsp.diagnostic.goto_prev()<CR>', opts)
  buf_set_keymap('n', ']d', '<cmd>lua vim.lsp.diagnostic.goto_next()<CR>', opts)
  buf_set_keymap('n', '<space>q', '<cmd>lua vim.lsp.diagnostic.set_loclist()<CR>', opts)
  buf_set_keymap('n', '<space>f', '<cmd>lua vim.lsp.buf.formatting()<CR>', opts)

  require'lsp_signature'.on_attach({
    bind = true,
    handler_opts = {
      border = 'rounded'
    },
    hint_enable = false,
    use_lspsaga = true
  }, bufnr)

end

lspconfig.tsserver.setup{
  on_attach = on_attach,
  flags = {
      debounce_text_changes = 150,
  },
  capabilities = capabilities
}

lspconfig.jsonls.setup{
  on_attach = on_attach,
  flags = {
    debounce_text_changes = 150
  },
  settings = {
    json = {
      schemas = {
        {
          description = 'TypeScript compiler configuration file',
          fileMatch = {'tsconfig.json', 'tsconfig.*.json'},
          url = 'http://json.schemastore.org/tsconfig'
        },
        {
          description = 'Lerna config',
          fileMatch = {'lerna.json'},
          url = 'http://json.schemastore.org/lerna'
        },
        {
          description = 'Babel configuration',
          fileMatch = {'.babelrc.json', '.babelrc', 'babel.config.json'},
          url = 'http://json.schemastore.org/lerna'
        },
        {
          description = 'ESLint config',
          fileMatch = {'.eslintrc.json', '.eslintrc'},
          url = 'http://json.schemastore.org/eslintrc'
        },
        {
          description = 'Bucklescript config',
          fileMatch = {'bsconfig.json'},
          url = 'https://bucklescript.github.io/bucklescript/docson/build-schema.json'
        },
        {
          description = 'Prettier config',
          fileMatch = {'.prettierdrc', '.prettierrc.json', 'prettier.config.json'},
          url = 'http://json.schemastore.org/prettierdrc'
        },
        {
          description = 'Vercel Now config',
          fileMatch = {'now.json'},
          url = 'http://json.schemastore.org/now'
        },
        {
          description = 'Stylelint config',
          fileMatch = {'.stylelintrc', '.stylelintrc.json', 'stylelint.config.json'},
          url = 'http://json.schemastore.org/stylelintrc'
        },
      }
    },
  },
  capabilities = capabilities
}

lspconfig.vuels.setup{
  on_attach = on_attach,
  flags = {
    debounce_text_changes = 150
  },
  capabilities = capabilities,
  init_options = {
    useWorkspaceDependencies = false,
    vetur = {
      completion = {
        autoImport = true,
      }
    }
  }
}

lspconfig.clangd.setup{
  on_attach = on_attach,
  flags = {
    debounce_text_changes = 150
  },
  capabilities = capabilities
}

lspconfig.cssls.setup {
  on_attach = on_attach,
  capabilities = capabilities
}

vim.lsp.handlers["textDocument/publishDiagnostics"] = vim.lsp.with(
  vim.lsp.diagnostic.on_publish_diagnostics, {
    underline = true,
    -- This sets the spacing and the prefix, obviously.
    virtual_text = {
      spacing = 4,
      prefix = ''
    }
  }
)
