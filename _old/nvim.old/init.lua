-- Map leader to ','
vim.g.mapleader = ','
--vim.g.maplocalleader = ','

local fn = vim.fn
local execute = vim.api.nvim_command

-- Auto install packer.nvim if not exists
local function packer_init()
  local install_path = fn.stdpath('data') .. '/site/pack/packer/opt/packer.nvim'
  if fn.empty(fn.glob(install_path)) > 0 then
    execute('!git clone https://github.com/wbthomason/packer.nvim ' .. install_path)
  end
  vim.cmd [[packadd packer.nvim]]
  vim.cmd 'autocmd BufWritePost ./plugins/init.lua PackerCompile'
end

packer_init()

require('settings').setup()

-- Install plugins
require('plugins').setup()

-- Key mappings
require('keymappings').setup()

-- Setup Lua language server
require('config.lsp').setup()

