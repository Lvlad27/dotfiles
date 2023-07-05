local status_ok, treesitter = pcall(require, "nvim-treesitter.configs")
if not status_ok then
	return
end

treesitter.setup({
	ensure_installed = {
		"bash",
		"c",
		"html",
		"javascript",
		"json",
		"lua",
		"luadoc",
		"luap",
		"markdown",
		"markdown_inline",
		"python",
		"query",
		"regex",
		"tsx",
		"typescript",
		"vim",
		"vimdoc",
		"yaml",
	},
	sync_install = false, -- install languages synchronously (only applied to `ensure_installed`)
	ignore_install = { "" }, -- List of parsers to ignore installing
	auto_install = true,

	autopairs = {
		enable = true,
	},

	endwise = {
		enable = true,
	},

	highlight = {
		enable = true, -- false will disable the whole extension
		disable = { "" }, -- list of language that will be disabled
		additional_vim_regex_highlighting = false,
	},

	indent = { enable = true },

	context_commentstring = {
		enable = true,
		enable_autocmd = false,
	},

	autotag = {
		enable = true,
	},

	matchup = {
		enable = true, -- mandatory, false will disable the whole extension
	},

	rainbow = {
		enable = true,
		-- disable = { "jsx", "cpp" }, list of languages you want to disable the plugin for
		extended_mode = true, -- Also highlight non-bracket delimiters like html tags, boolean or table: lang -> boolean
		max_file_lines = nil, -- Do not enable for files with more than n lines, int
	},
})
