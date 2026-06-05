local M = {
	{
		"preservim/nerdtree",
		config = function()
			vim.cmd("let NERDTreeShowHidden=1")
			vim.keymap.set("n", "<Leader>T", ":NERDTreeToggle<CR>", { remap = false, desc = "Toogle Tree" })
		end,
	},
}

return M
