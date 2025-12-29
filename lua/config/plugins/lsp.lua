return {
	{
		"neovim/nvim-lspconfig",
		dependencies = {
			"saghen/blink.cmp",
			{ "folke/lazydev.nvim", opts = {} },
		},
		config = function()
			local lspconfig = require("lspconfig")
			local capabilities = require("blink.cmp").get_lsp_capabilities()

			vim.api.nvim_create_autocmd("LspAttach", {
				callback = function(args)
					local client = vim.lsp.get_client_by_id(args.data.client_id)
					if not client then return end

					local map = function(mode, lhs, rhs)
						vim.keymap.set(mode, lhs, rhs, { buffer = args.buf, silent = true })
					end

					-- Keymaps
					map("n", "gd", vim.lsp.buf.definition)
					map("n", "K", vim.lsp.buf.hover)
					map("n", "gi", vim.lsp.buf.implementation)
					map("n", "gr", vim.lsp.buf.references)
					map("n", "<leader>rn", vim.lsp.buf.rename)
					map("n", "<leader>ca", vim.lsp.buf.code_action)
					map("n", "<leader>f", function() vim.lsp.buf.format({ async = true }) end)

					-- if vim.bo.filetype == "lua" then ...
					vim.api.nvim_create_autocmd("BufWritePre", {
						buffer = args.buf,
						callback = function()
							vim.lsp.buf.format({ bufnr = args.buf, id = client.id })
						end,
					})
				end,
			})

			-- Server Setups
			local servers = { "clangd", "hls", "lua_ls" }
			for _, server in ipairs(servers) do
				lspconfig[server].setup({ capabilities = capabilities })
			end
		end,
	},
}
