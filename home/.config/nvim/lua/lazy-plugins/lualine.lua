local M = {
	{
		"nvim-lualine/lualine.nvim",
		config = function()
			local locationPercentStatusline = "%8.(%l,%c%V%) %P"
			local lualine = require("lualine")
			lualine.setup({
				options = {
					section_separators = { left = "", right = "" },
					component_separators = { left = "", right = "" },
					ignore_focus = { "nerdtree" },
				},
				sections = {
					lualine_a = { "mode" },
					lualine_b = {
						{
							"filetype",
							icon_only = true,
						},
						"%f",
					},
					lualine_c = { "%q%R%H%W%M" },
					lualine_x = {
						{

							"encoding",
							fmt = string.upper,
						},
						{
							"fileformat",

							icons_enabled = false,
							fmt = function(v)
								return string.upper(v) .. " "
							end,
						},
					},
					lualine_y = { "diff", "diagnostics" },
					lualine_z = { locationPercentStatusline },
				},
				inactive_sections = {
					lualine_a = {},
					lualine_b = {},
					lualine_c = { "%f" },
					lualine_x = { locationPercentStatusline },
					lualine_y = {},
					lualine_z = {},
				},
			})
		end,
	},
}

return M
