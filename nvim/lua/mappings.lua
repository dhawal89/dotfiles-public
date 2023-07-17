local function map(mode, lhs, rhs, opts)
  local options = { noremap = true }
  if opts then
    options = vim.tbl_extend("force", options, opts)
  end
  vim.api.nvim_set_keymap(mode, lhs, rhs, options)
end


-- Map leader to space
vim.g.mapleader = " "

-- Switch Session
-- map("n", "<Leader>1", ":Telescope sessions [save_current=true]<CR>")
map("n", "<Leader>1", ":SearchSession<CR>")

-- Update Plugins
map("n", "<Leader>u", ":PackerSync<CR>")

-- Open nvimrc file
map("n", "<Leader>v", "<cmd>e $MYVIMRC<CR>")

-- Source nvimrc file
map("n", "<Leader>sv", ":luafile %<CR>")

--After searching, pressing escape stops the highlight
map("n", "<esc>", ":noh<cr><esc>", { silent = true })

-- Easy add date/time
map("n", "<Leader>t", "\"=strftime('%c')<CR>Pa", { silent = true })

-- Telescope
map("n", "<leader>.", '<cmd>lua require("telescope.builtin").find_files()<cr>')
map("n", "<leader>r", '<cmd>lua require("telescope.builtin").registers()<cr>')
map("n", "<leader>g", '<cmd>lua require("telescope.builtin").live_grep()<cr>')
map("n", "<leader>b", '<cmd>lua require("telescope.builtin").buffers()<cr>')
map("n", "<leader>j", '<cmd>lua require("telescope.builtin").help_tags()<cr>')
map("n", "<leader>h", '<cmd>lua require("telescope.builtin").git_bcommits()<cr>')
map("n", "<leader>f", '<cmd>lua require("telescope").extensions.file_browser.file_browser()<CR>')
map("n", "<leader>s", '<cmd>lua require("telescope.builtin").spell_suggest()<cr>')
map("n", "<leader>i", '<cmd>lua require("telescope.builtin").git_status()<cr>')
-- map("n", "<eader>ca", '<cmd>lua require("telescope.builtin").lsp_code_actions()<cr>')
-- map("n", "<leader>cs", '<cmd>lua require("telescope.builtin").lsp_document_symbols()<cr>')
-- map("n", "<leader>cd", '<cmd>lua require("telescope.builtin").lsp_document_diagnostics()<cr>')
-- map("n", "<leader>cr", '<cmd>lua require("telescope.builtin").lsp_references()<cr>')
map("i", "<F2>", '<cmd>lua require("renamer").rename()<cr>', { noremap = true, silent = true })
map("n", "<leader>cn", '<cmd>lua require("renamer").rename()<cr>', { noremap = true, silent = true })
map("v", "<leader>cn", '<cmd>lua require("renamer").rename()<cr>', { noremap = true, silent = true })
map("n", "<leader>ci", "<cmd>lua vim.diagnostic.open_float()<cr>")
