local present, lspconfig = pcall(require, "lspconfig")

if not present then
	return
end

require("lspconfig.ui.windows").default_options.border = "rounded"

local opts = { buffer = 0, noremap = true, silent = true }

local M = {}

M.on_attach = function(client, bufnr)
	client.server_capabilities.documentFormattingProvider = false
	client.server_capabilities.documentRangeFormattingProvider = false

	vim.keymap.set("n", "gD", function()
		vim.lsp.buf.declaration()
	end, opts)
	vim.keymap.set("n", "gd", function()
		vim.lsp.buf.definition()
	end, opts)
	vim.keymap.set("n", "gi", function()
		vim.lsp.buf.implementation()
	end, opts)
	vim.keymap.set("n", "gr", function()
		vim.lsp.buf.references()
	end, opts)
	vim.keymap.set("n", "K", function()
		vim.lsp.buf.hover()
	end, opts)

	vim.keymap.set("n", "<leader>ls", function()
		vim.lsp.buf.signature_help()
	end, opts)
	vim.keymap.set("n", "<leader>rn", function()
		vim.lsp.buf.rename()
	end)
	vim.keymap.set("n", "<leader>ca", function()
		vim.lsp.buf.code_action()
	end, opts)
	vim.keymap.set("n", "<leader>fm", function()
		vim.lsp.buf.format({ async = true })
	end, opts)

	vim.keymap.set("n", "<leader>wa", function()
		vim.lsp.buf.add_workspace_folder()
	end, opts)
	vim.keymap.set("n", "<leader>wd", function()
		vim.lsp.buf.remove_workspace_folder()
	end, opts)
	vim.keymap.set("n", "<leader>wl", function()
		vim.lsp.buf.list_workspace_folder()
	end, opts)

	-- Diagnostics
	vim.keymap.set("n", "[d", vim.diagnostic.goto_prev, opts)
	vim.keymap.set("n", "]d", vim.diagnostic.goto_next, opts)
	vim.keymap.set("n", "<leader>df", vim.diagnostic.open_float, opts)
	vim.keymap.set("n", "<leader>dl", "<cmd>Telescope diagnostics<cr>", opts)
end

M.capabilities = require("cmp_nvim_lsp").default_capabilities(vim.lsp.protocol.make_client_capabilities())

M.capabilities.textDocument.completion.completionItem = {
	documentationFormat = { "markdown", "plaintext" },
	snippetSupport = true,
	preselectSupport = true,
	insertReplaceSupport = true,
	labelDetailsSupport = true,
	deprecatedSupport = true,
	commitCharactersSupport = true,
	tagSupport = { valueSet = { 1 } },
	resolveSupport = {
		properties = {
			"documentation",
			"detail",
			"additionalTextEdits",
		},
	},
}

local servers = require("bfswrd.plugins.lspconfig.servers")
for server, conf in pairs(servers) do
	local name = server
	local config = conf.config or {}
	local final_config = config

	if type(config) == "function" then
		final_config = config()
	end

	if type(final_config) ~= "table" then
		vim.notify("custom/lspconfig.lua: final_config was not a table for " .. name, 3)
		final_config = {}
	end

	local default_config = {
		on_attach = M.on_attach,
		capabilities = M.capabilities,
		flags = { debounce_text_changes = 200 },
	}

	final_config = vim.tbl_deep_extend("force", default_config, final_config) or default_config
	lspconfig[name].setup(final_config)
end
