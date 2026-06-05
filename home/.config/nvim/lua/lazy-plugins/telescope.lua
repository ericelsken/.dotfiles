local M = {
	{
		"nvim-telescope/telescope.nvim",
		branch = "0.1.x",
		dependencies = { "nvim-lua/plenary.nvim" },
		config = function()
			require("telescope").setup({
				defaults = {
					mappings = {
						i = {
							["<C-k>"] = "move_selection_previous",
							["<C-j>"] = "move_selection_next",
						},
					},
				},
			})

			local builtin = require("telescope.builtin")
			vim.keymap.set("n", "<C-p>", builtin.find_files, { desc = "[Ctrl-p] for Telescope builtin.find_files" })
			vim.keymap.set("n", "<C-b>", builtin.buffers, { desc = "[Ctrl-b] for Telescope builtin.buffers" })
		end,
	},
}

return M
