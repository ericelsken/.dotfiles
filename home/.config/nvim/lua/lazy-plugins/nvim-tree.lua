local M = {
	{
		"nvim-tree/nvim-tree.lua",
		config = function()
			local nvimTree = require("nvim-tree")
			nvimTree.setup({})
		end,
	},
}

return M
