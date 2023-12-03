local plugins = {
	-- Plugin Manager, load first
	"lazy",

	-- Appearance and UI
	"kanagawa",
	"colorizer",
	"lualine",
	"notify",
    "indentline",

	-- Utilities
	"telescope",
	"treesitter-context",
	"treesitter",
	"gitsigns",
	"harpoon",
	"diffview",
	"harpoon",
	"spectre",

	-- LSP
    "lsp",
	"lsp-mason",
	"cmp",
	"prettier",

	--Editing
	"autopairs",
	"autotag",
	"comment",
	"spectre",
	"surround",
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
