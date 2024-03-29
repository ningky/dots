local lsp = require("lsp-zero")

lsp.preset("recommended")
lsp.setup()

lsp.configure("tsserver", {
	flags = {
		debounce_text_changes = 150,
	},
	on_attach = function(client, bufnr)
		client.server_capabilities.documentFormattingProvider = false
		client.server_capabilities.documentRangeFormattingProvider = false
	end,
})

settings = require("jr.lsp.settings.sumneko_lua")
print(settings.settings)
lsp.configure("sumneko_lua", {
    settings = settings.settings
})

-- require("mason").setup {
--     ui = {
--         icons = {
--             package_installed = "✓"
--         }
--     }
-- }
-- require("mason-lspconfig").setup {
--     ensure_installed = { "sumneko_lua" },
-- }
--
-- local nvim_lsp = require("lspconfig")
--
-- -- use an on_attach function to only map the following keys
-- -- after the language server attaches to the current buffer
-- local on_attach = function(client, bufnr)
-- 	local function buf_set_keymap(...)
-- 		vim.api.nvim_buf_set_keymap(bufnr, ...)
-- 	end
-- 	local function buf_set_option(...)
-- 		vim.api.nvim_buf_set_option(bufnr, ...)
-- 	end
--
-- 	buf_set_option("omnifunc", "v:lua.vim.lsp.omnifunc")
--
-- 	-- mappings.
-- 	local opts = { noremap = true, silent = true }
--
-- 	-- see `:help vim.lsp.*` for documentation on any of the below functions
-- 	buf_set_keymap("n", "gd", "<cmd>lua vim.lsp.buf.declaration()<cr>", opts)
-- 	buf_set_keymap("n", "gd", "<cmd>lua vim.lsp.buf.definition()<cr>", opts)
-- 	buf_set_keymap("n", "k", "<cmd>lua vim.lsp.buf.hover()<cr>", opts)
-- 	buf_set_keymap("n", "gi", "<cmd>lua vim.lsp.buf.implementation()<cr>", opts)
-- 	buf_set_keymap("n", "<c-k>", "<cmd>lua vim.lsp.buf.signature_help()<cr>", opts)
-- 	buf_set_keymap("n", "<space>wa", "<cmd>lua vim.lsp.buf.add_workspace_folder()<cr>", opts)
-- 	buf_set_keymap("n", "<space>wr", "<cmd>lua vim.lsp.buf.remove_workspace_folder()<cr>", opts)
-- 	buf_set_keymap("n", "<space>wl", "<cmd>lua print(vim.inspect(vim.lsp.buf.list_workspace_folders()))<cr>", opts)
-- 	buf_set_keymap("n", "<space>d", "<cmd>lua vim.lsp.buf.type_definition()<cr>", opts)
-- 	buf_set_keymap("n", "<space>rn", "<cmd>lua vim.lsp.buf.rename()<cr>", opts)
-- 	buf_set_keymap("n", "<space>ca", "<cmd>lua vim.lsp.buf.code_action()<cr>", opts)
-- 	buf_set_keymap("n", "gr", "<cmd>lua vim.lsp.buf.references()<cr>", opts)
-- 	buf_set_keymap("n", "<space>e", "<cmd>lua vim.diagnostic.open_float()<cr>", opts)
-- 	buf_set_keymap("n", "[d", "<cmd>lua vim.diagnostic.goto_prev()<cr>", opts)
-- 	buf_set_keymap("n", "]d", "<cmd>lua vim.diagnostic.goto_next()<cr>", opts)
-- 	buf_set_keymap("n", "<space>q", "<cmd>lua vim.diagnostic.setloclist()<cr>", opts)
-- 	buf_set_keymap("n", "<space>f", "<cmd>lua vim.lsp.buf.formatting()<cr>", opts)
-- end
--
-- local status_ok, lsp_installer = pcall(require, "nvim-lsp-installer")
-- if not status_ok then
-- 	return
-- end
--
-- local capabilities = vim.lsp.protocol.make_client_capabilities()
--
-- local status_ok, cmp_nvim_lsp = pcall(require, "cmp_nvim_lsp")
-- if not status_ok then
--   return
-- end
--
-- -- register a handler that will be called for all installed servers.
-- -- alternatively, you may also register handlers on specific server instances instead (see example below).
-- lsp_installer.on_server_ready(function(server)
-- 	local opts = {
-- 		on_attach = on_attach,
-- 		capabilities = cmp_nvim_lsp.default_capabilities(capabilities),
-- 	}
--
-- 	-- if server.name == "jsonls" then
-- 	-- 	local jsonls_opts = require("user.lsp.settings.jsonls")
-- 	-- 	opts = vim.tbl_deep_extend("force", jsonls_opts, opts)
-- 	-- end
-- 	--
-- 	if server.name == "sumneko_lua" then
-- 		local sumneko_opts = require("jr.lsp.settings.sumneko_lua")
-- 		opts = vim.tbl_deep_extend("force", sumneko_opts, opts)
-- 	end
--
-- 	-- this setup() function is exactly the same as lspconfig's setup function.
-- 	-- refer to https://github.com/neovim/nvim-lspconfig/blob/master/doc/server_configurations.md
-- 	server:setup(opts)
-- end)
