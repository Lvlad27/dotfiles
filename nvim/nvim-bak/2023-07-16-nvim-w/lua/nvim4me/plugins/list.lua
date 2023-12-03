return {
	-- Appearance
	"rebelot/kanagawa.nvim",
	"nvim-lualine/lualine.nvim",
	"nvim-tree/nvim-web-devicons",
	"norcalli/nvim-colorizer.lua",
    'lukas-reineke/indent-blankline.nvim',

	-- Utilities
	"numToStr/Comment.nvim",
	"windwp/nvim-autopairs",
	"windwp/nvim-ts-autotag",
	"rcarriga/nvim-notify",
	"lewis6991/gitsigns.nvim",
	"sindrets/diffview.nvim",
	"windwp/nvim-spectre",
	"kylechui/nvim-surround",
    "ThePrimeagen/harpoon",
    'tpope/vim-sleuth',
	{ "mbbill/undotree", cmd = "UndotreeToggle", lazy = true },

    -- Telescope
    { "nvim-telescope/telescope.nvim", tag = "0.1.1", dependencies = { "nvim-lua/plenary.nvim" } },
    "nvim-telescope/telescope-file-browser.nvim",
    { "nvim-telescope/telescope-fzf-native.nvim", build = "make" },

	-- TreeSitter
	{
		"nvim-treesitter/nvim-treesitter",
		build = ":TSUpdate",
		dependencies = {
			"nvim-treesitter/nvim-treesitter-context",
            'nvim-treesitter/nvim-treesitter-textobjects',
			"RRethy/nvim-treesitter-endwise",
			"windwp/nvim-ts-autotag",
			"JoosepAlviste/nvim-ts-context-commentstring",
		},
        build = ':TSUpdate',
		lazy = true,
	},

	-- LSP
	{
		"VonHeikemen/lsp-zero.nvim",
		dependencies = {
			"neovim/nvim-lspconfig",
			"williamboman/mason.nvim",
			"williamboman/mason-lspconfig.nvim",
			"folke/neodev.nvim",
		},
		lazy = true,
	},

	-- Completion
	{
		"hrsh7th/nvim-cmp",
		event = "InsertEnter",
		dependencies = {
			"saadparwaiz1/cmp_luasnip",
			"hrsh7th/cmp-nvim-lsp",
			"L3MON4D3/LuaSnip",
			"rafamadriz/friendly-snippets",
			"MunifTanjim/prettier.nvim",
		},
	},

	-- Language specific
}
