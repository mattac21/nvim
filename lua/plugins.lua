return require('packer').startup(function(use)
  -- Packer can manage itself
  use 'wbthomason/packer.nvim'

  -- nvim lsp
  use 'neovim/nvim-lspconfig'

  -- nvim-cmp sources
  use 'hrsh7th/cmp-nvim-lsp'
  use 'hrsh7th/cmp-buffer'
  use 'hrsh7th/cmp-path'
  use 'hrsh7th/cmp-cmdline'
  use 'L3MON4D3/LuaSnip'
  use 'saadparwaiz1/cmp_luasnip'

  -- completion engine
  use 'hrsh7th/nvim-cmp'
  
  -- treesitter for parsing and highlights
  use {
    'nvim-treesitter/nvim-treesitter',
    run = function()
      local ts_update = require('nvim-treesitter.install').update({ with_sync = true })
      ts_update()
    end,
  }

  -- colorschemes
  use { "catppuccin/nvim", as = "catppuccin" }
  use { "bluz71/vim-moonfly-colors", as = "moonfly" }
  
  -- telescope for searching
  use {
    'nvim-telescope/telescope.nvim', tag = '0.1.1',
    requires = { {'nvim-lua/plenary.nvim'} }
  }
  
  -- git signs in sign column 
  use 'lewis6991/gitsigns.nvim'

  -- center buffers
  use {"shortcuts/no-neck-pain.nvim", tag = "*" }

  -- indent guides
  use "lukas-reineke/indent-blankline.nvim"

  -- a better quick fix list
  use 'kevinhwang91/nvim-bqf'

  -- running tests
  use 'vim-test/vim-test'

  -- dispatching jobs
  use 'tpope/vim-dispatch'

  -- debugging
  use 'mfussenegger/nvim-dap'
  use { "rcarriga/nvim-dap-ui", requires = {"mfussenegger/nvim-dap"} }
  use 'theHamsta/nvim-dap-virtual-text'

  -- go debugging
  use 'leoluz/nvim-dap-go'

  -- completion for neovim lua apis
  use "folke/neodev.nvim"

end)
