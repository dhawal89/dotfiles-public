-- Load all config files

-- Plugin management via Packer
require('plugins')
-- Vim mappings, see lua/config/which.lua for more mappings
require('mappings')
-- All non plugin related (vim) options
require('options')

local themeStatus, everforest = pcall(require, "everforest")

if themeStatus then
  vim.cmd("colorscheme onedark")
else
  return
end
