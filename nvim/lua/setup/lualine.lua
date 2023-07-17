-- Custom Config
--
require('lualine').setup {
   options = {
     theme = "auto",
     component_separators = { left = "", right = "" },
		 section_separators = { left = "", right = "" },
    -- component_separators = { left = '', right = '' },
    -- section_separators = { left = '', right = '' },
   },
   sections = {
        lualine_a = {"mode"},
        lualine_b = {{"b:gitsigns_head", icon = ""}, "diff"},
        lualine_c = {
            {
                "filename",
                file_status = true,
                path = 1, -- show relativ path
                shorting_target = 40,
                symbols = {modified = "[]", readonly = " "}
            }
        },
        lualine_x = {
            {"diagnostics", sources = {"nvim_diagnostic"}}, "encoding",
            "fileformat", "filetype"
        },
        lualine_y = {"progress"},
        lualine_z = {"location"}
    },
    inactive_sections = {
        lualine_a = {},
        lualine_b = {},
        lualine_c = {"filename"},
        lualine_x = {"location"},
        lualine_y = {},
        lualine_z = {}
    },
    tabline = {},
    extensions = {"nvim-tree", "toggleterm", "quickfix", "symbols-outline"}
 }
-- Now don't forget to initialize lualine
-- lualine.setup(config)
