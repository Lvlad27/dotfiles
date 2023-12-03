local status_ok, indent_blankline = pcall(require, "indent_blankline")
if not status_ok then
	return
end

indent_blankline.setup({
	use_treesitter_scope = true,
	show_current_context = true,
	show_current_context_start = true,
    char = '┊',
    show_trailing_blankline_indent = false,
	-- char_highlight_list = {
	--   "IndentBlanklineIndent1",
	--   "IndentBlanklineIndent2",
	--   "IndentBlanklineIndent3",
	-- },
})
