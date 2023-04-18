local lsp = require('lspconfig')
local cmp = require('cmp_nvim_lsp')
local builtin = require('telescope.builtin')

-- Mappings.
-- See `:help vim.diagnostic.*` for documentation on any of the below functions
local opts = { noremap=true, silent=true }
vim.keymap.set('n', '<space>e', vim.diagnostic.open_float, opts)
vim.keymap.set('n', '[d', vim.diagnostic.goto_prev, opts)
vim.keymap.set('n', ']d', vim.diagnostic.goto_next, opts)
vim.keymap.set('n', '<space>q', vim.diagnostic.setloclist, opts)

-- Use an on_attach function to only map the following keys
-- after the language server attaches to the current buffer
local on_attach = function(client, bufnr)
  -- Enable completion triggered by <c-x><c-o>
  vim.api.nvim_buf_set_option(bufnr, 'omnifunc', 'v:lua.vim.lsp.omnifunc')

  -- Mappings.
  -- See `:help vim.lsp.*` for documentation on any of the below functions
  local bufopts = { noremap=true, silent=true, buffer=bufnr }

  local with_zz = function(f)
    return function()
      f()
      vim.cmd('normal! zz')
    end
  end

  vim.keymap.set('n', 'gr', with_zz(builtin.lsp_references), bufopts)
  vim.keymap.set('n', 'gd', with_zz(builtin.lsp_definitions), bufopts)
  vim.keymap.set('n', 'gD', with_zz(builtin.lsp_type_definitions), bufopts)
  vim.keymap.set('n', 'gi', with_zz(builtin.lsp_implementations), bufopts)

  vim.keymap.set('n', 'K', vim.lsp.buf.hover, bufopts)
  vim.keymap.set('n', '<C-k>', vim.lsp.buf.signature_help, bufopts)
  vim.keymap.set('n', '<space>wa', vim.lsp.buf.add_workspace_folder, bufopts)
  vim.keymap.set('n', '<space>wr', vim.lsp.buf.remove_workspace_folder, bufopts)
  vim.keymap.set('n', '<space>wl', function()
    print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
  end, bufopts)
  vim.keymap.set('n', '<space>D', vim.lsp.buf.type_definition, bufopts)
  vim.keymap.set('n', '<space>rn', vim.lsp.buf.rename, bufopts)
  vim.keymap.set('n', '<space>ca', vim.lsp.buf.code_action, bufopts)
  vim.keymap.set('n', '<space>f', function() vim.lsp.buf.format { async = true } end, bufopts)

  local textedit = vim.api.nvim_create_augroup('textedit', { clear = true })
  vim.api.nvim_create_autocmd({"BufWritePre"}, {
      group = textedit,
      callback = function()
          local clients = vim.lsp.get_active_clients()
          for _, c in ipairs(clients) do
              if c.server_capabilities.documentFormattingProvider then
                  vim.lsp.buf.format()
              end
          end
      end,
  })


  if client.name == 'gopls' and vim.fn.has('nvim-0.8.3') == 1 and not client.server_capabilities.semanticTokensProvider then
    local semantic = client.config.capabilities.textDocument.semanticTokens
    client.server_capabilities.semanticTokensProvider = {
      full = true,
      legend = { tokenModifiers = semantic.tokenModifiers, tokenTypes = semantic.tokenTypes },
      range = true,
    }
  end
end

lsp.gopls.setup{
	on_attach = on_attach,
	capabilities = cmp.default_capabilities(),
    settings = {
        gopls = {
            hints = {
                assignVariableTypes = true,
                compositeLiteralFields = true,
                compositeLiteralTypes = true,
                constantValues = true,
                functionTypeParameters = true,
                parameterNames = true,
                rangeVariableTypes = true,
            },
            analyses = {
                unreachable = true,
                nilness = true,
                unusedparams = true,
                useany = true,
                unusedwrite = true,
                ST1003 = true,
                undeclaredname = true,
                fillreturns = true,
                nonewvars = true,
                fieldalignment = false,
                shadow = true,
            },
            codelenses = {
                generate = true, -- show the `go generate` lens.
                gc_details = true, -- Show a code lens toggling the display of gc's choices.
                test = true,
                tidy = true,
                vendor = true,
                regenerate_cgo = true,
                upgrade_dependency = true,
            },
            usePlaceholders = true,
            completeUnimported = true,
            staticcheck = true,
            matcher = 'Fuzzy',
            diagnosticsDelay = '500ms',
            symbolMatcher = 'fuzzy',
            semanticTokens = true,
        },
    },
}
