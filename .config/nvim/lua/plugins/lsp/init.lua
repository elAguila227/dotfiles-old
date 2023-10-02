require("plugins.lsp.mason")
require("plugins.lsp.mason-lspconfig")

local status_ok, lspconfig = pcall(require, "lspconfig")
if not status_ok then
	return
end

local lsp_capabilities = require('cmp_nvim_lsp').default_capabilities()

require("mason-lspconfig").setup_handlers({
  -- The first entry (without a key) will be the default handler
  -- and will be called for each installed server that doesn't have
  -- a dedicated handler.
  function (server_name) -- default handler (optional)
    lspconfig[server_name].setup({
      on_attach = require("plugins.lsp.handlers").on_attach,
      capabilities = lsp_capabilities,
    })
  end,
  -- Next, you can provide targeted overrides for specific servers.
  -- For example, a handler override for the `rust_analyzer`:
  -- ["rust_analyzer"] = function ()
  --   require("rust-tools").setup {}
  -- end
  ["jdtls"] = function()
    lspconfig.jdtls.setup({
      on_attach = require("plugins.lsp.handlers").on_attach,
      capabilities = lsp_capabilities,
      cmd = { 'jdtls' },
    })
  end
})

require("plugins.lsp.handlers").setup()
