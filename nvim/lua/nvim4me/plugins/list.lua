return {
    -- Appearance
    "rebelot/kanagawa.nvim",
    "nvim-lualine/lualine.nvim",
    "nvim-tree/nvim-web-devicons",

    -- Utilities
    { "folke/which-key.nvim",          lazy = true },
    "nvim-tree/nvim-tree.lua",
    "windwp/nvim-autopairs",
    "windwp/nvim-ts-autotag",

    -- Telescope
    { "nvim-telescope/telescope.nvim", tag = "0.1.1", dependencies = { "nvim-lua/plenary.nvim" } },

    -- TreeSitter
    {
        "nvim-treesitter/nvim-treesitter",
        build = ":TSUpdate",
        dependencies = {
            "nvim-treesitter/nvim-treesitter-context",
            "RRethy/nvim-treesitter-endwise",
            "windwp/nvim-ts-autotag",
            "HiPhish/nvim-ts-rainbow2",
        },
        lazy = true,
    },

    -- LSP
    {
        "VonHeikemen/lsp-zero.nvim",
        dependencies = {
            "neovim/nvim-lspconfig",
            "williamboman/mason.nvim",
            "williamboman/mason-lspconfig.nvim",
            "jose-elias-alvarez/null-ls.nvim",
            "folke/trouble.nvim",
            "Maan2003/lsp_lines.nvim",
            "ray-x/lsp_signature.nvim",
            "glepnir/lspsaga.nvim",
        },
        lazy = true,
    },

    -- Completion
    {
        "hrsh7th/nvim-cmp",
        event = "InsertEnter",
        dependencies = {
            "onsails/lspkind-nvim",
            "hrsh7th/cmp-buffer",
            "hrsh7th/cmp-path",
            "hrsh7th/cmp-cmdline",
            "saadparwaiz1/cmp_luasnip",
            "hrsh7th/cmp-nvim-lsp",
            "hrsh7th/cmp-nvim-lua",
            "L3MON4D3/LuaSnip",
            "rafamadriz/friendly-snippets",
            "MunifTanjim/prettier.nvim",
        },
    },
}
