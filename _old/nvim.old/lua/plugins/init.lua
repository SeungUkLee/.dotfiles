local M = {}

function M.setup()
  local packer = require "packer"

  packer.startup(function(use)
    -- Packer can manage itself as an optional plugin
    use { "wbthomason/packer.nvim", opt = true }


    -- Color scheme
    -- use { "sainnhe/gruvbox-material" }
    use {"ellisonleao/gruvbox.nvim", requires = {"rktjmp/lush.nvim"}}

    use { "kyazdani42/nvim-web-devicons" }


    -- Development
    use {
      "windwp/nvim-autopairs",
      --run = "make",
      config = function()
        require("nvim-autopairs").setup({
          disable_filetype = { "TelescopePrompt", "vim" },
        })
      end,
    }
    use {
      'kyazdani42/nvim-tree.lua',
      requires = 'kyazdani42/nvim-web-devicons',
      config = function()
        require('plugins.nvim-tree').setup()
      end,
    }
    use {
      "lukas-reineke/indent-blankline.nvim",
      config = function()
        require('plugins.indent-blankline').setup()
      end
    }
    use {
      "hoob3rt/lualine.nvim",
      requires = { 'kyazdani42/nvim-web-devicons', opt = true },
      config = function()
        require('plugins.lualine').setup()
      end
    }
    use {
      'akinsho/bufferline.nvim',
      requires = 'kyazdani42/nvim-web-devicons',
      config = function()
        require('plugins.bufferline').setup()
      end
    }
    use {
      'lewis6991/gitsigns.nvim',
      requires = {
        'nvim-lua/plenary.nvim'
      },
      config = function()
        require('gitsigns').setup()
      end,
    }
    use { 
      "simrat39/symbols-outline.nvim",
      config = function()
        require('plugins.symbols-outline').setup()
      end
    }


    -- LSP
    use { "neovim/nvim-lspconfig" }
    use { "kabouzeid/nvim-lspinstall" }
    use { "glepnir/lspsaga.nvim" }
    use {
      "jose-elias-alvarez/null-ls.nvim",
      requires = {
        "nvim-lua/plenary.nvim",
        "neovim/nvim-lspconfig"
      },
    }
    -- use { "ray-x/lsp_signature.nvim" }
    use { 'folke/lsp-colors.nvim' }


    -- Completion
    use {
      "hrsh7th/nvim-cmp",
      requires = {
        --"hrsh7th/vim-vsnip",
        "hrsh7th/cmp-buffer",
        "hrsh7th/cmp-nvim-lsp",
        "hrsh7th/cmp-nvim-lua",
        "hrsh7th/cmp-path",
        "ray-x/cmp-treesitter",
        "quangnguyen30192/cmp-nvim-ultisnips",

      },
      config = function()
        require('plugins.nvim-cmp').setup()
      end,
    }
    use {
      'tzachar/cmp-tabnine',
      run = './install.sh',
      requires = 'hrsh7th/nvim-cmp'
    }
    use {
      "onsails/lspkind-nvim",
      config = function()
        require("lspkind").init()
      end,
    }
    use { "RRethy/nvim-treesitter-textsubjects" }


    -- Snippet
    use {
      "SirVer/ultisnips",
      requires = { "honza/vim-snippets" },
      config = function()
        vim.g.UltiSnipsRemoveSelectModeMappings = 0
      end,
    }


    -- Telescope
    use { "nvim-lua/plenary.nvim" }
    use {
      "nvim-telescope/telescope.nvim",
      requires = {
        'nvim-lua/plenary.nvim',
        { 'nvim-telescope/telescope-fzf-native.nvim', run = 'make' },
      },
      config = function()
        require("plugins.telescope").setup()
      end
    }
    use { "nvim-telescope/telescope-fzf-native.nvim", run = "make" }

    -- Better syntax using treesitter
    use {
      'nvim-treesitter/nvim-treesitter',
      run = ':TSUpdate',
      config = function()
        require('plugins.treesitter').setup()
      end,
    }
    use { "nvim-treesitter/nvim-treesitter-textobjects" }
    use { "nvim-treesitter/playground" }
    use {
      "romgrk/nvim-treesitter-context",
      config = function()
        require("treesitter-context.config").setup { enable = true }
      end,
    }

    -- Typescript
    use { "jose-elias-alvarez/nvim-lsp-ts-utils" }
  end)
end

return M

