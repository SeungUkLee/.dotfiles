local M = {}

function M.setup()
  local indent_blankline = require "indent_blankline"

  local config = {
    space_char_blankline = " ",
    show_current_context = true
  }

  indent_blankline.setup(config)
end

return M

