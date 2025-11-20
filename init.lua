require("config.lazy")
-- System clipboard
vim.opt.clipboard = "unnamedplus"


-- Executes whole file
vim.keymap.set("n", "<space><space>x", "<cmd>source %<CR>")
-- Executes single line
vim.keymap.set("v", "<space>x", ":.lua<CR>")
-- Opens diagnostic according to lsp on cursor's line
vim.keymap.set('n', '<space>cd', vim.diagnostic.open_float)
-- Disables lsp warning for current line
vim.api.nvim_set_keymap('n', '<space>cw', '<cmd>lua vim.lsp.buf.code_action()<CR>', { noremap = true, silent = true })

-- Highlight when yanked
vim.api.nvim_create_autocmd('TextYankPost', {
	desc = 'Highlight when yanking (copying)',
	group = vim.api.nvim_create_augroup('kickstart-highlight-yank', { clear = true }),
	callback = function()
		vim.highlight.on_yank()
	end,
})
