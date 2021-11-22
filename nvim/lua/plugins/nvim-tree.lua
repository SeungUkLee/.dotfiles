local M = {}

function M.setup()
  local nvim_tree = require('nvim-tree')

 -- vim.g.nvim_tree_ignore = {'.git', 'node_modules', '.cache'}
  vim.g.nvim_tree_gitignore = 1
 -- vim.g.nvim_tree_auto_close = 1
 -- vim.g.nvim_tree_indent_markers = 1
  vim.g.nvim_tree_git_hl = 1 
  vim.g.nvim_tree_icons = {
    default = '',
    symlink = '',
    git = {
      unstaged = "✗",
      staged = "✓",
      unmerged = "",
      renamed = "➜",
      untracked = "★",
      deleted = "",
      ignored = "◌"
    },
    folder = {
      arrow_open = "",
      arrow_closed = "",
      default = "",
      open = "",
      empty = "",
      empty_open = "",
      symlink = "",
      symlink_open = "",
    },
    lsp = {
      hint = "",
      info = "",
      warning = "",
      error = "",
    }
  }

  nvim_tree.setup {}
end

return M
