-- Mappings

-- All Modes

vim.keymap.set("", "<Up>", "<Nop>", { desc = "Set the Up key to a no-op" })
vim.keymap.set("", "<Down>", "<Nop>", { desc = "Set the Down key to a no-op" })
vim.keymap.set("", "<Left>", "<Nop>", { desc = "Set the Left key to a no-op" })
vim.keymap.set("", "<Right>", "<Nop>", { desc = "Set the Right key to a no-op" })

-- NORMAL Mode

vim.keymap.set("n", "<Leader>T", ":NERDTreeToggle<Enter>", { remap = false, desc = "<Leader> [T]ree toggle." })

vim.keymap.set("n", ";", ":", { remap = false, desc = "Switch ; to :" })
vim.keymap.set("n", ":", ";", { remap = false, desc = "Switch : to ;" })

vim.keymap.set("n", "<Space>", "<Nop>", { remap = false, desc = "Set NORMAL Space key to a no-op" })
vim.keymap.set("n", "<BS>", "<Nop>", { remap = false, desc = "Set NORMAL Backspace key to a no-op" })

vim.keymap.set(
	"n",
	"<Leader>o",
	"o<Esc>",
	{ remap = false, desc = "<Leader> [o]pen and go back to NORMAL mode. Add line below." }
)
vim.keymap.set(
	"n",
	"<Leader>O",
	"O<Esc>",
	{ remap = false, desc = "<Leader> [O]pen and go back to NORMAL mode. Add line above." }
)
vim.keymap.set(
	"n",
	"<Leader>w",
	":wa<Enter>",
	{ remap = false, desc = "<Leader> [w]rite [a]ll to save all open buffers." }
)
vim.keymap.set(
	"n",
	"<Leader>x",
	":wqa<Enter>",
	{ remap = false, desc = "<Leader> [w]rite [q]uit [a]ll to save all open buffers then quit." }
)
vim.keymap.set(
	"n",
	"<Leader>/",
	":nohlsearch<Enter>",
	{ remap = false, silent = true, desc = "Turn off highlight search" }
)
vim.keymap.set(
	"n",
	"<Leader><Tab>",
	":b#<Enter>",
	{ remap = false, silent = true, desc = "<Leader> <Tab> to goto last buffer." }
)

vim.keymap.set("n", "<Tab>", "%", { remap = false, desc = "<Tab> to goto the matching bracket." })

vim.keymap.set("n", "<S-h>", ":bp<Enter>", { remap = false, desc = "<Shift> h to goto previous buffer." })
vim.keymap.set("n", "<S-l>", ":bn<Enter>", { remap = false, desc = "<Shift> l to goto next buffer." })

vim.keymap.set("n", "<A-h>", "<C-w>h", { remap = false, desc = "[A]lt [h] to move window to the left" })
vim.keymap.set("n", "<A-j>", "<C-w>j", { remap = false, desc = "[A]lt [j] to move window to the left" })
vim.keymap.set("n", "<A-k>", "<C-w>k", { remap = false, desc = "[A]lt [k] to move window to the left" })
vim.keymap.set("n", "<A-l>", "<C-w>l", { remap = false, desc = "[A]lt [l] to move window to the left" })

-- NORMAL Mode LSP and Diagnostics

vim.api.nvim_create_autocmd("LspAttach", {
	group = vim.api.nvim_create_augroup("EgoElkLspConfig", {}),
	callback = function(event)
		vim.bo[event.buf].omnifunc = "v:lua.vim.lsp.omnifunc"

		local opts = { buffer = event.buf }
		vim.keymap.set("n", "<Leader>ca", vim.lsp.buf.code_action, opts)
		vim.keymap.set("n", "<Leader>f", vim.lsp.buf.format, opts)
		vim.keymap.set("n", "<Leader>gD", vim.lsp.buf.declaration, opts)
		vim.keymap.set("n", "<Leader>gd", vim.lsp.buf.definition, opts)
		vim.keymap.set("n", "<Leader>gi", vim.lsp.buf.implementation, opts)
		vim.keymap.set("n", "<Leader>gr", vim.lsp.buf.references, opts)
		vim.keymap.set("n", "<Leader>gt", vim.lsp.buf.type_definition, opts)
		vim.keymap.set("n", "<Leader>K", vim.lsp.buf.signature_help, opts)
		vim.keymap.set("n", "<Leader>k", vim.lsp.buf.hover, opts)
		vim.keymap.set("n", "<Leader>r", vim.lsp.buf.rename, opts)
	end,
})

-- INPUT Mode

vim.keymap.set("i", "kj", "<Esc>", { remap = false, desc = "[kj] to Escape INSERT mode" })

-- VISUAL Mode

vim.keymap.set("v", ";", ":", { remap = false, desc = "Switch ; to :" })
vim.keymap.set("v", ":", ";", { remap = false, desc = "Switch : to ;" })

vim.keymap.set("v", "<Tab>", "%", { remap = false, desc = "<Tab to goto the matching bracket." })
