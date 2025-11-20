return {
  "neovim/nvim-lspconfig",
  config = function()
    local lspconfig = require("lspconfig")
    
    -- Capabilities
    local capabilities = vim.lsp.protocol.make_client_capabilities()
    local ok_cmp, cmp_lsp = pcall(require, "cmp_nvim_lsp")
    if ok_cmp then
      capabilities = cmp_lsp.default_capabilities(capabilities)
    end
    
    -- on_attach
    local on_attach = function(_, bufnr)
      local map = function(mode, lhs, rhs)
        vim.keymap.set(mode, lhs, rhs, { buffer = bufnr, silent = true })
      end
      map("n", "gd", vim.lsp.buf.definition)
      map("n", "K", vim.lsp.buf.hover)
      map("n", "gi", vim.lsp.buf.implementation)
      map("n", "<leader>rn", vim.lsp.buf.rename)
      map("n", "<leader>ca", vim.lsp.buf.code_action)
      map("n", "gr", vim.lsp.buf.references)
      map("n", "<leader>f", function() vim.lsp.buf.format { async = true } end)
    end
    
    -- clangd
    lspconfig.clangd.setup {
      on_attach = on_attach,
      capabilities = capabilities,
    }
    
    -- hls
    lspconfig.hls.setup {
      on_attach = on_attach,
      capabilities = capabilities,
    }
    
    -- lua_ls
    lspconfig.lua_ls.setup {
      on_attach = on_attach,
      capabilities = capabilities,
      settings = {
        Lua = {
          runtime = { version = "LuaJIT" },
          diagnostics = { globals = { "vim" } },
          workspace = {
            library = vim.api.nvim_get_runtime_file("", true),
            checkThirdParty = false,
          },
          telemetry = { enable = false },
        },
      },
    }
  end,
}
