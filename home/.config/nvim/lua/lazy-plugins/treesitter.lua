local M = {
	"nvim-treesitter/nvim-treesitter",
	branch = "main",
	build = ":TSUpdate",
	lazy = false,

	config = function()
		local ts = require("nvim-treesitter")

		ts.setup()

		ts.install({
			"bash",
			"git_config",
			"git_rebase",
			"gitattributes",
			"gitcommit",
			"gitignore",
			"go",
			"javascript",
			"json",
			"lua",
			"markdown",
			"terraform",
			"toml",
			"typescript",
			"vim",
			"vimdoc",
			"yaml",
		})

		vim.api.nvim_create_autocmd("FileType", {
			callback = function(args)
				local bufnr = args.buf
				local ft = vim.bo[bufnr].filetype

				if ft == "" then
					return
				end

				pcall(vim.treesitter.start, bufnr)
			end,
		})
	end,
}

return M
