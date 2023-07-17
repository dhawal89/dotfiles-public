local global = vim.g
local o = vim.o

-- Visual
vim.opt.conceallevel	      = 0				                      -- Don;t hide quote in md
vim.opt.cmdheight		        = 1
vim.opt.pumheight		        = 10
vim.opt.showmode		        = false
vim.opt.showtabline	        = 2				                      -- Always shoptw tabline
vim.opt.title		            = true
vim.opt.termguicolors	      = true				                  -- use true color, required for some plugins
vim.wo.number		            = true
vim.wo.relativenumber	      = true
 vim.wo.signcolumn	          = 'yes'
vim.wo.cursorline	          = true
vim.opt.laststatus          = 2

-- Behaviour
vim.opt.hlsearch            = false
vim.opt.ignorecase          = true                          -- Ignore case when using lowercase in search
vim.opt.smartcase           = true                          -- But don't ignore it when using upper case
vim.opt.smarttab            = true
vim.opt.smartindent         = true
vim.opt.expandtab           = true                          -- Convert tabs to spaces.
vim.opt.tabstop             = 2
vim.opt.softtabstop         = 2
vim.opt.shiftwidth          = 2
vim.opt.splitbelow          = true
vim.opt.splitright          = true
vim.opt.scrolloff           = 12                            -- Minimum offset in lines to screen borders
vim.opt.sidescrolloff       = 8
vim.opt.mouse               = 'a'

-- Vim specific
vim.opt.hidden              = true                          -- Do not save when switching buffers
vim.opt.fileencoding        = "utf-8"
vim.opt.spell               = false
vim.opt.spelllang           = "en_us"
vim.opt.completeopt         = "menuone,noinsert,noselect"
vim.opt.wildmode            = "longest,full"                -- Display auto-complete in Command Mode
vim.opt.updatetime          = 300                           -- Delay until write to Swap and HoldCommand event
vim.opt.clipboard           = "unnamedplus"
-- vim.cmd.clipboard+=unnamedplus
