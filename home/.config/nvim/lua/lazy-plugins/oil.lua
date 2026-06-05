local M = {
	{
		"stevearc/oil.nvim",
		config = function()
			local oil = require("oil")
			oil.setup({})

			vim.keymap.set("n", "<Leader>-", oil.open, {})
		end,
	},
}

return M
