local M = {}

local lsp_providers = {
  typescript = true
}

local function setup_servers()
  local lspinstall = require "lspinstall"
  local lsputils = require "config.lsp.utils"

  lspinstall.setup()

  -- null-ls
  require("config.lsp.null-ls").setup()

  local servers = lspinstall.installed_servers()
  for _, server in pairs(servers) do
    if lsp_providers[server] then
      require("config.lsp." .. server).setup()
    else
      lsputils.setup_server(server)
    end
  end
end

local function post_install()
  local lspinstall = require "lspinstall"
  lspinstall.post_install_hook = function()
    setup_servers()
    vim.cmd "bufdo e"
  end
end

function M.setup()
  post_install()
  setup_servers()
end

-- function M.setup()
--  local lspconfig = require('lspconfig')
--
--  local function custom_on_attach(client, bufnr)
--    local function buf_keymap(...) vim.api.nvim_buf_set_keymap(bufnr, ...) end
--    local function buf_set_option(...) vim.api.nvim_buf_set_option(bufnr, ...) end
--    -- keymaps
--    buf_keymap('n', 'K'         , ':lua vim.lsp.buf.hover()<CR>'                   , {noremap = false, silent = true})
--    buf_keymap('n', '<C-]>'     , ':lua vim.lsp.buf.definition()<CR>'              , {noremap = false, silent = true})
--    buf_keymap('n', 'gA'        , ':lua vim.lsp.buf.code_action()<CR>'             , {noremap = true , silent = true})
--    buf_keymap('n', 'gd'        , ':lua vim.lsp.buf.definition()<CR>'              , {noremap = true , silent = true})
--    buf_keymap('n', 'gD'        , ':lua vim.lsp.buf.type_definition()<CR>'         , {noremap = true , silent = true})
--    buf_keymap('n', '<leader>fs', ':lua vim.lsp.buf.workspace_symbol()<CR>'        , {noremap = true , silent = true})
--    buf_keymap('n', 'gr'        , ':lua vim.lsp.buf.references()<CR>'              , {noremap = true , silent = true})
--    buf_keymap('n', 'gR'        , ':lua vim.lsp.buf.rename()<CR>'                  , {noremap = true , silent = true})
--    buf_keymap('' , '<leader>F' , ':lua vim.lsp.buf.formatting()<CR>'              , {noremap = true , silent = true})
--    buf_keymap('n', '<C-e>'     , ':lua vim.diagnostic.show_line_diagnostics()<CR>', {noremap = true , silent = true})
--    buf_keymap('n', 'g['        , ':lua vim.diagnostic.goto_prev()<CR>'            , {noremap = true , silent = true})
--    buf_keymap('n', 'g]'        , ':lua vim.diagnostic.goto_next()<CR>'            , {noremap = true , silent = true})
--    buf_keymap('n', 'gl'        , ':lua vim.diagnostic.set_loclist()<CR>'          , {noremap = true , silent = true})
--    buf_keymap('n', 'gq'        , ':lua vim.diagnostic.set_qflist()<CR>'           , {noremap = true , silent = true})
--  end
--
--  local capabilities = vim.lsp.protocol.make_client_capabilities()
--  capabilities.textDocument.completion.completionItem.snippetSupport = true
--  capabilities.textDocument.completion.completionItem.resolveSupport = {
--    properties = {
--      'documentation',
--      'detail',
--      'additionalTextEdits',
--    }
--  }
--
--  lspconfig.tsserver.setup{
--    on_attach = custom_on_attach,
--    capabilities = capabilities
--  }
--end

return M
