-- Plugins defination and loading
-- local execute = vim.api.nvim_command
local fn = vim.fn
local cmd = vim.cmd

-- Bootstrap Packer
local install_path = fn.stdpath('data')..'/site/pack/packer/start/packer.nvim'
local packer_bootstrap
if fn.empty(fn.glob(install_path)) > 0 then
	packer_bootstrap = fn.system({'git','clone','https://github.com/wbthomason/packer.nvim', install_path})
end

-- Rerun Packercompile everytime pluggins.lua is updated
cmd([[
  augroup packer_user_config
    autocmd!
    autocmd BufWritePost plugins.lua source <afile> | PackerCompile
  augroup end
]])

-- Load Packer
cmd([[packadd packer.nvim]])
-- returns the require for use in 'config' parameter of packer's use
-- expects the name of the config file
function get_setup(name)
  return string.format('require("setup/%s")', name)
end

-- Initialize Pluggins
return require('packer').startup({
  function(use)
  -- Let packer manage itself
  use({'wbthomason/packer.nvim', opt = true})


  -- Formatting
  use 'tpope/vim-commentary'
  use 'junegunn/vim-easy-align'


  -- tmux plugins
  use 'christoomey/vim-tmux-navigator'

  -- file explorer
  use("nvim-tree/nvim-tree.lua")


  -- Icons
  use("nvim-tree/nvim-web-devicons")

  -- Telescope
  use({
    "nvim-telescope/telescope.nvim",
    module = "telescope",
    cmd = "Telescope",
    requires = { 
      {"nvim-lua/plenary.nvim"},
      {"nvim-lua/popup.nvim"},

    },
    config = get_setup("telescope"),
  })
  use({ "nvim-telescope/telescope-file-browser.nvim" })
  use({ "onsails/lspkind-nvim", requires = { { "famiu/bufdelete.nvim" } } })
  use({ "tpope/vim-repeat" })
  use({ "tpope/vim-surround" })
  use({ "wellle/targets.vim" })
  
--  use({"kyazdani42/nvim-tree.lua", config = get_setup("nvim-tree")}) 

  use({"folke/which-key.nvim", config = get_setup("which")})

  -- Markdown: Vimwiki  
  use({
    'vimwiki/vimwiki',
    config = function()
      vim.g.vimwiki_list = {
      {
        path = '~/Documents/CO/personal/vimwiki',
        syntax = markdown,
        ext = '.md',
      }
    }
    vim.g.vimwiki_ext2syntax = {
      ['.md'] = 'markdown',
      ['.markdown'] = 'markdown',
      ['.mdown'] = 'markdown',
    }
  end,
  })

  -- Markdown preview
  use({
    "iamcco/markdown-preview.nvim",
    run = function()
      vim.fn["mkdp#util#install"]()
    end,
  })


  -- Background Transparent
  use({
    "xiyaowong/nvim-transparent",
    config = get_setup("transparent"),
  })

  -- Lualine
  use({
    'nvim-lualine/lualine.nvim',
    event = "BufEnter",
    config = get_setup("lualine"),
    requires = { "nvim-web-devicons", opt = true },
  })
--  use({ "kyazdani42/nvim-web-devicons" })

  -- auto bracket pair
  use({
    "windwp/nvim-autopairs",
    config = get_setup("autopairs"),
  })

  -- Colorscheme

  -- use({"folke/tokyonight.nvim"})

  -- use({"marko-cerovac/material.nvim"})
  -- use({"EdenEast/nightfox.nvim", config = get_setup("nightfox") })

  use({
    "neanias/everforest-nvim",
    -- Optional; default configuration will be used if setup isn't called.
    config = function()
      require("everforest").setup()
    end,
  })

  -- use({
  --   "NTBBloodbath/doom-one.nvim",
  --     config = function()
  --         require('doom-one').setup({
  --             cursor_coloring = false,
  --             terminal_colors = false,
  --             italic_comments = false,
  --             enable_treesitter = true,
  --             transparent_background = false,
  --             pumblend = {
  --                 enable = true,
  --                 transparency_amount = 20,
  --             },
  --             plugins_integrations = {
  --                 neorg = true,
  --                 barbar = true,
  --                 bufferline = false,
  --                 gitgutter = false,
  --                 gitsigns = true,
  --                 telescope = true,
  --                 neogit = true,
  --                 nvim_tree = true,
  --                 dashboard = true,
  --                 startify = true,
  --                 whichkey = true,
  --                 indent_blankline = true,
  --                 vim_illuminate = true,
  --                 lspsaga = false,
  --             },
  --         })
  --     end,
  --   })

  use({
    "norcalli/nvim-colorizer.lua",
    event = "BufReadPre",
    config = get_setup("colorizer")
  })

  use({"navarasu/onedark.nvim"})

  if packer_bootstrap then
    require('packer').sync()
  end
end,
config = {
  display = {
    open_fn = require("packer.util").float,
  },
}
})
