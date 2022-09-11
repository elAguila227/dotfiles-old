require("plugin-conf.lsp.mason")
require("plugin-conf.lsp.mason-lspconfig")
require("mason-lspconfig").setup_handlers {
  -- The first entry (without a key) will be the default handler
  -- and will be called for each installed server that doesn't have
  -- a dedicated handler.
  function (server_name) -- default handler (optional)
    require("lspconfig")[server_name].setup {
      on_attach = require("plugin-conf.lsp.handlers").on_attach,
      capabilities = require("plugin-conf.lsp.handlers").capabilities,
    }
  end,
  -- Next, you can provide targeted overrides for specific servers.
  -- For example, a handler override for the `rust_analyzer`:
  -- ["rust_analyzer"] = function ()
  --   require("rust-tools").setup {}
  -- end
}

local status_ok, _ = pcall(require, "lspconfig")
if not status_ok then
	return
end


require("plugin-conf.lsp.handlers").setup()
