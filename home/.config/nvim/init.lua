-- Leaders
vim.g.mapleader = " "
vim.g.maplocalleader = ","

-- Options and Keymaps
require("egoelk-options")
require("egoelk-keymaps")

-- Boostrap and add Lazy to runtimepath.
require("lazy-bootstrap")
-- Use lazy-plugins for name under lua directory for plugin configuration.
require("lazy").setup("lazy-plugins")

local function listedNamedBuffers()
	local buffers = {}
	for _, buffer in ipairs(vim.api.nvim_list_bufs()) do
		local buflisted = vim.api.nvim_buf_get_option(buffer, "buflisted")
		local name = vim.api.nvim_buf_get_name(buffer)
		if buflisted and not (name == nil and name == "") then
			table.insert(buffers, buffer)
		end
	end
	return buffers
end

vim.api.nvim_create_autocmd({ "VimEnter" }, {
	group = vim.api.nvim_create_augroup("EgoElkVimEnter", {}),
	callback = function()
		local buffers = listedNamedBuffers()
		local openTree = false
		if #buffers > 0 then
			if vim.api.nvim_buf_get_option(buffers[1], "filetype") == "gitcommit" then
				openTree = false
			end
		end
		if openTree then
			vim.cmd("NERDTree")
			vim.cmd("wincmd p")
		end
	end,
})
