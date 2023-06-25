vim.opt.signcolumn = "yes" -- Reserve space for diagnostic icons

local status_ok, lsp = pcall(require, "lsp-zero")
if not status_ok then
	return
end

lsp.preset("recommended")

lsp.ensure_installed({
	"astro",
	"ansiblels",
	"bashls",
	"clangd",
	"cssls",
	"dockerls",
	"docker_compose_language_service",
	"eslint",
	"emmet_ls",
	"graphql",
	"html",
	"jsonls",
	"tsserver",
	"lua_ls",
	"marksman",
	"pylsp",
	"sqlls",
	"svelte",
	"tailwindcss",
	"yamlls",
})

lsp.format_on_save({
	format_opts = {
		async = false,
		timeout_ms = 10000,
	},
	servers = {
		["null-ls"] = {
			"lua",
			"javascript",
			"typescript",
			"javascriptreact",
			"typescriptreact",
			"css",
			"scss",
			"less",
			"html",
			"json",
			"jsonc",
			"yaml",
			"markdown",
			"markdown.mdx",
			"graphql",
			"handlebars",
		},
	},
})

lsp.nvim_workspace()

lsp.setup()
