local M = {}

local cmd = vim.cmd
local o = vim.o
local wo = vim.wo
local bo = vim.bo
local opt = vim.opt
local indent = 2

function M.setup()
  cmd 'syntax enable'
  cmd 'filetype plugin indent on'
  cmd "colorscheme gruvbox-material"
  --cmd 'au TextYankPost * lua vim.highlight.on_yank {on_visual = false}'
  cmd "au TextYankPost * silent! lua vim.highlight.on_yank()"

  opt.shiftwidth = indent
  opt.tabstop = indent
  opt.softtabstop = indent
  opt.fileencoding = 'utf-8'

  opt.termguicolors = true
  opt.hidden = true
  opt.ignorecase = true
  opt.shiftround = true
  opt.smartcase = true
  opt.splitbelow = true
  opt.splitright = true
  opt.wildmode = 'list:longest'
  opt.clipboard = 'unnamed,unnamedplus'
  opt.encoding = 'utf-8'
  opt.lazyredraw = true
  opt.wildmenu = true
  opt.wildignorecase = true
  opt.list = true
  opt.autowrite = true
  opt.mouse = 'a'

  -- Set completeopt to have a better completion expreience
  -- @see https://github.com/neovim/nvim-lspconfig/wiki/Autocompletion
  opt.completeopt = 'menuone,noselect'

  opt.number = true
  opt.relativenumber = true
  opt.wrap = false 

  opt.expandtab= true
  opt.autoindent = true
  opt.smartindent = true

  ---- opt.listchars = {eol = '↲', tab = '▸ ', trail = '·'}
  opt.listchars = { tab = '· ', trail = '·', space = '·' }
end

return M
