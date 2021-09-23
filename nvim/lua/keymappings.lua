local M = {}

local opts = {
  noremap = true,
  silent = false
}

local generic_opts = {
  insert_mode = opts,
  normal_mode = opts,
  visual_mode = opts,
  visual_block_mode = opts,
  command_mode = opts,
  term_mode = { silent = false }
}

local mode_adapters = {
  insert_mode = "i",
  normal_mode = "n",
  term_mode = "t",
  visual_mode = "v",
  visual_block_mode = "x",
  command_mode = "c"
}

local keymappings = {
  insert_mode = {
    ["jk"] = "<Esc>"
  },
  normal_mode = {
    ["<C-l>"] = "<Cmd>noh<CR>"
  },
  term_mode = {},
  visual_mode = {},
  visual_block_mode = {},
  command_mode = {}
}

local lsp_keymappings = {
  normal_mode = {
    ["K"] = "<Cmd>lua vim.lsp.buf.hover()<CR>",
    ["gD"] = "<Cmd>lua vim.lsp.buf.declaration()<CR>",
    ["gd"] = "<Cmd>lua vim.lsp.buf.definition()<CR>",
    ["gi"] = "<Cmd>lua vim.lsp.buf.implementation()<CR>",
    ["<C-k>"] = "<Cmd>lua vim.lsp.buf.signature_help()<CR>",
    ["[d"] = "<Cmd>lua vim.lsp.diagnostic.goto_prev()<CR>",
    ["]d"] = '<Cmd>lua vim.lsp.diagnostic.goto_next()<CR>',
    ["[e"] = "<Cmd>Lspsaga diagnostic_jump_next<CR>",
    ["]e"] = "<Cmd>Lspsaga diagnostic_jump_prev<CR>"
  }
}

function M.set_keymaps(mode, key, val)
  local opt = generic_opts[mode] and generic_opts[mode] or opts
  if type(val) == "table" then
    opt = val[2]
    val = val[1]
  end
  vim.api.nvim_set_keymap(mode, key, val, opt)
end

function M.map(mode, keymaps)
  mode = mode_adapters[mode] and mode_adapters[mode] or mode
  for k, v in pairs(keymaps) do M.set_keymaps(mode, k, v) end
end

function M.setup_lsp_mappings()
  for mode, mapping in pairs(lsp_keymappings) do M.map(mode, mapping) end
end

function M.setup()
  for mode, mapping in pairs(keymappings) do M.map(mode, mapping) end
end

return M
