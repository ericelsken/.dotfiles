local M = {
	{
		"williamboman/mason.nvim",
		config = function()
			require("mason").setup()
		end,
	},
	{
		"williamboman/mason-lspconfig.nvim",
		config = function()
			require("mason-lspconfig").setup({
				ensure_installed = {
					"gopls",
					"jsonls",
					"lua_ls",
					"terraformls",
				},
			})
		end,
	},
	{
		"neovim/nvim-lspconfig",
		config = function()
			-- New style (Nvim 0.11+): use vim.lsp.config + vim.lsp.enable
			-- nvim-lspconfig ships server defaults in its `lsp/` directory,
			-- which vim.lsp.config() automatically discovers.
			local lsp = vim.lsp
			-- If you want to override defaults, call lsp.config('<name>', { ... }) first.
			-- Then enable filetype-based activation of each server:
			lsp.enable("gopls")
			lsp.enable("jsonls")
			lsp.enable("lua_ls")
			lsp.enable("terraformls")
		end,
	},
}

return M
