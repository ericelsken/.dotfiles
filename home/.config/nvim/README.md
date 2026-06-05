Neovim LSP: Exploring Server Configurations

Quick ways to discover, inspect, and tweak language server configs using the new `vim.lsp.config` API.

Where configs live
- nvim-lspconfig ships default configs under: `:echo stdpath('data') .. '/lazy/nvim-lspconfig/lsp'`
- On this machine that resolves to: `~/.local/share/nvim/lazy/nvim-lspconfig/lsp`
- Each server has a file like `gopls.lua`, `lua_ls.lua`, `jsonls.lua` with default settings and docs at the top.

Explore available servers
- In Neovim help: `:help lspconfig-all`
- Migration guide: `:help lspconfig-nvim-0.11`
- Core API: `:help vim.lsp.config()` and `:help vim.lsp.ClientConfig`

Inspect defaults from inside Neovim
- Print the resolved default config for a server (without enabling it):
  `:lua vim.print(vim.lsp.config['gopls'])`
- List active clients on the current buffer: `:LspInfo` or `:checkhealth vim.lsp`

Enable a server (uses defaults)
- Example: `:lua vim.lsp.enable('gopls')`
- In your config, call once during setup; autostarts by filetype.

Override defaults then enable
- Example (Lua):
  `:lua vim.lsp.config('lua_ls', { settings = { Lua = { hint = { enable = true } } } })`
  `:lua vim.lsp.enable('lua_ls')`
- Example (Go):
  `:lua vim.lsp.config('gopls', { settings = { gopls = { analyses = { unusedparams = true } } } })`
  `:lua vim.lsp.enable('gopls')`
- Example (JSON):
  `:lua vim.lsp.config('jsonls', { init_options = { provideFormatter = true } })`
  `:lua vim.lsp.enable('jsonls')`

Useful commands
- Open Mason UI to manage servers: `:Mason`
- Check LSP health: `:checkhealth vim.lsp`
- Restart a server: `:LspRestart`
- Increase log verbosity (temporary): `:lua vim.lsp.set_log_level('debug')` then `:LspLog`

Tips
- Read the server file under `…/nvim-lspconfig/lsp/<server>.lua` for supported fields, root markers, and notes.
- For JSON schemas or complex settings, prefer putting them under the server’s `settings = { … }` via `vim.lsp.config`.

