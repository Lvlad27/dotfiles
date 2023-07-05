local status_ok, telescope = pcall(require, "telescope")
if not status_ok then
	return
end

local actions = require("telescope.actions")

telescope.setup({
	defaults = {
		-- Default configuration for telescope goes here:
		-- config_key = value,
		layout_config = {
			bottom_pane = {
				height = 0.5,
				preview_width = 0.6,
				preview_cutoff = 120,
				prompt_position = "top",
			},
			center = {
				height = 0.4,
				preview_cutoff = 40,
				prompt_position = "top",
				width = 0.9,
			},
			cursor = {
				height = 0.9,
				preview_cutoff = 40,
				preview_width = 0.6,
				width = 0.9,
			},
			horizontal = {
				height = 0.9,
				preview_width = 0.6,
				preview_cutoff = 120,
				prompt_position = "bottom",
				width = 0.9,
			},
			vertical = {
				height = 0.9,
				preview_cutoff = 40,
				prompt_position = "bottom",
				width = 0.9,
			},
			-- other layout configuration here-
		},

		mappings = {
			i = {
				-- map actions.which_key to <C-h> (default: <C-/>)
				-- actions.which_key shows the mappings for your picker,
				-- e.g. git_{create, delete, ...}_branch for the git_branches picker
				["<C-u>"] = actions.preview_scrolling_up,
				["<C-d>"] = actions.preview_scrolling_down,
			},
		},
	},
	pickers = {
		-- Default configuration for builtin pickers goes here:
		-- picker_name = {
		--   picker_config_key = value,
		--   ...
		-- }
		-- Now the picker_config_key will be applied every time you call this
		-- builtin picker
	},
	extensions = {
		-- Your extension configuration goes here:
		-- extension_name = {
		--   extension_config_key = value,
		-- }
		-- please take a look at the readme of the extension you want to configure
		file_browser = {
			-- theme = "dropdown",
			-- disables netrw and use telescope-file-browser in its place
			-- hijack_netrw = true,
			mappings = {
				["i"] = {
					-- your custom insert mode mappings
				},
				["n"] = {
					-- your custom normal mode mappings
				},
			},
		},
	},
})

telescope.load_extension("file_browser")
telescope.load_extension("lazygit")
