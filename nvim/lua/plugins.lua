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
  -- rose-pine

  -- use({ 
  --   'rose-pine/neovim',
  --   as = 'rose-pine',
  --   config = function()
  --     vim.cmd('colorscheme rose-pine')
  --   end
  -- })
  
  -- use({
  --   'catppuccin/nvim',
  --   as = 'catppuccin',
  --   config = function()
  --     vim.cmd('colorscheme catppuccin')
  --   end
  -- })

  use({
    'olimorris/onedarkpro.nvim',
    as = 'onedark',
    config = function()
      vim.cmd('colorscheme onedark')
    end
  })
  
  use({
      'NTBBloodbath/doom-one.nvim',
      as = 'doom-one',
      setup = function()
          -- Add color to cursor
  		vim.g.doom_one_cursor_coloring = true
  		-- Set :terminal colors
  		vim.g.doom_one_terminal_colors = true
  		-- Enable italic comments
  		vim.g.doom_one_italic_comments = true
  		-- Enable TS support
  		vim.g.doom_one_enable_treesitter = true
  		-- Color whole diagnostic text or only underline
          vim.g.doom_one_diagnostics_text_color = false
  		-- Enable transparent background
  		vim.g.doom_one_transparent_background = false
  
          -- Pumblend transparency
  		vim.g.doom_one_pumblend_enable = false
  		vim.g.doom_one_pumblend_transparency = 20
  
          -- Plugins integration
  		vim.g.doom_one_plugin_neorg = true
  		vim.g.doom_one_plugin_barbar = false
  		vim.g.doom_one_plugin_telescope = true
  		vim.g.doom_one_plugin_neogit = true
  		vim.g.doom_one_plugin_nvim_tree = true
  		vim.g.doom_one_plugin_dashboard = true
  		vim.g.doom_one_plugin_startify = true
  		vim.g.doom_one_plugin_whichkey = true
  		vim.g.doom_one_plugin_indent_blankline = true
  		vim.g.doom_one_plugin_vim_illuminate = true
  		vim.g.doom_one_plugin_lspsaga = false
    end,
    config = function()
      vim.cmd('colorscheme doom-one')
    end
  })

  -- use({
  --   "neanias/everforest-nvim",
  --   -- Optional; default configuration will be used if setup isn't called.
  --   config = function()
  --     require("everforest").setup()
  --   end,
  -- })


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
