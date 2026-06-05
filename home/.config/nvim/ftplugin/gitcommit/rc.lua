vim.wo.colorcolumn = "50,72"

vim.api.nvim_create_autocmd({ "BufEnter" }, {
	group = vim.api.nvim_create_augroup("EgoElkGitCommitBufEnter", {}),
	pattern = "COMMIT_EDITMSG",
	callback = function()
		for i = 1, vim.fn.line("$") do
			if #vim.fn.getline(i) == 0 then
				vim.cmd("normal " .. i .. "gg")
				vim.cmd("startinsert")
				break
			end
			if i > 10 then
				break
			end
		end
	end,
})
