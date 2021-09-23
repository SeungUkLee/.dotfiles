local M = {}

function M.setup()
  local lualine = require "lualine"
  local config = {
    options = {
      theme = 'gruvbox',
      component_separators = { left = '|', right = '|' },
      section_separators = { left = '', right = '' },
      icons_enabled = true,
    },
    extensions = { 'nvim-tree' }
  }

  lualine.setup(config)
end

return M
