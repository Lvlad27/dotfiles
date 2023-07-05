local status_ok, null_ls = pcall(require, "null-ls")
if not status_ok then
	return
end

local formatting = null_ls.builtins.formatting
local diagnostics = null_ls.builtins.diagnostics
local hover = null_ls.builtins.hover
local code_actions = null_ls.builtins.code_actions
local completion = null_ls.builtins.completion

null_ls.setup({
	debug = false,
	border = "rounded",
	log_level = "error",
	diagnostics_format = "#{c} #{m} (#{s})",
	sources = {
		code_actions.eslint,
		completion.spell,
		completion.tags,
		diagnostics.eslint,
		formatting.prettier,
		formatting.stylua,
		hover.dictionary,
		hover.printenv,
	},

	on_formatting = function()
		print("Formatting is being called from lsp-zero")
	end,
})
