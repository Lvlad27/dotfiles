local plugins = {
	-- Plugin Manager, load first
	"lazy",

	-- Keybindings
	"which-key",

	-- Appearance and UI
	"kanagawa",
	"dashboard",
	"bufferline",
	"colorizer",
	"lualine",
	"notify",
	"dressing",

	-- Utilities
	"nvim-tree",
	"telescope",
	"treesitter-context",
	"treesitter",
	"gitsigns",
	"indentline",
	"diffview",
	"tabout",
	"spectre",

	-- LSP
	"lsp-mason",
	"lsp-zero",
	"cmp",
	"prettier",
	"lsp-null-ls",
	"lsp-kind",
	"lsp-lines",
	"lsp-signature",
	"lsp-saga",
	"lsp-trouble",

	--Editing
	"autopairs",
	"autotag",
	"comment",
}

local errors = {}
local error_plugins = {}

for _, plugin in pairs(plugins) do
	local ok, err_msg = pcall(require, "nvim4me.plugins." .. plugin)
	if not ok then
		table.insert(errors, err_msg)
		table.insert(error_plugins, plugin)
	end
end

for i, err_msg in pairs(errors) do
	vim.notify(err_msg, vim.log.levels.ERROR, {
		title = "Error loading : " .. error_plugins[i],
	})
end
